import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'resident_home.dart';
import 'register_bin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Waste Management System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: WelcomeScreen(), // Initial screen
      routes: {
        '/login_screen': (context) => LoginScreen(),
        '/signup_screen': (context) => SignUpScreen(),
        '/resident_home': (context) =>
            ResidentHomePage(), // Resident Home page route
        '/resident_bin_page': (context) => RegisterBinPage(),
      },
    );
  }
}
