import 'package:flutter/material.dart';
import 'package:restaurants/widgets/product_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurants/screens/map_screen.dart'; 

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({super.key});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurantes'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('restaurants').snapshots(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Failed to load restaurants'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No restaurants found'));
          }

          final restaurantDocs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: restaurantDocs.length,
            itemBuilder: (context, index) {
              final restaurantData = restaurantDocs[index].data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: GestureDetector(
                  onTap: () {
                    final x = restaurantData['x'] ?? 0.0;
                    final y = restaurantData['y'] ?? 0.0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapScreen(x: x, y: y),
                      ),
                    );
                  },
                  child: ProductCard(
                    count: restaurantData['count'] ?? 0,
                    description: restaurantData['description'] ?? 'No description',
                    name: restaurantData['name'] ?? 'Unknown',
                    rating: (restaurantData['rating'] ?? 0).toDouble(),
                    images: List<String>.from(restaurantData['images'] ?? []),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
