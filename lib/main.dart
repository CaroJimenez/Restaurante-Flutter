import 'package:firebase_core/firebase_core.dart';
import 'package:restaurants/navigation/navigation.dart';
import 'package:restaurants/screens/login.dart';
import 'package:restaurants/widgets/splash_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:restaurants/screens/restaurants.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/config/error_state.dart';
import 'package:restaurants/screens/map_screen.dart';
import 'firebase_options.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: Scaffold(body: Center(child: CircularProgressIndicator())));
        } else if (snapshot.hasError) {
          return MaterialApp(home: Scaffold(body: Center(child: Text('Error initializing Firebase'))));
        }
        
        return ChangeNotifierProvider(
          create: (context) => ErrorState(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/login': (context) => const Login(),
              '/navigation': (context) => const Navigation(),
            },
          ),
        );
      },
    );
  }
}
