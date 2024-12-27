import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'feedback_responses.dart'; // Import your feedback response screen
import 'welcome_screen.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'resident_home.dart';
import 'register_bin_page.dart';
import 'feedback_page.dart'; // ProvideFeedbackPage
import 'role_selection_screen.dart';
import 'resident.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
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
        '/role_selection_screen': (context) => RoleSelectionScreen(),
        '/resident_home': (context) => ResidentHomePage(),
        '/resident_bin_page': (context) => RegisterBinPage(),
        '/feedback_page': (context) => ProvideFeedbackPage(),
        '/feedback_responses': (context) => FeedbackResponseScreen(),
      },
    );
  }
}
