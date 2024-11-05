import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final int count;
  final String description;
  final String name;
  final double rating;
  final List<String> images;

  const ProductCard({
    Key? key,
    required this.count,
    required this.description,
    required this.name,
    required this.rating,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen principal
            if (images.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  images[0],
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 12),
            // Nombre del producto
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Descripción del producto
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            // Rating con estrellas
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Icon(
                    i < rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 20,
                  ),
                const SizedBox(width: 8),
                Text(
                  rating.toStringAsFixed(1),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
