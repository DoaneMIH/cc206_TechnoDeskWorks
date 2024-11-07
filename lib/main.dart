import 'package:exercise_4/navigation/techno_navigation.dart';
import 'package:exercise_4/Login/techno_logIn_validation.dart'; 
import 'package:exercise_4/navigation/Profile/techno_profile.dart';
import 'package:exercise_4/navigation/Notification/techno_notification.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TechnoWorks",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
      initialRoute: 'login', // Set initial route to LoginValidatedScreen
      routes: {
        'login': (BuildContext ctx) => const LoginValidatedScreen(), // Ensure this is defined
        'home': (BuildContext ctx) => const NavigationScreen(), // Home or main screen
        'profile': (BuildContext ctx) => const Profile(), // Profile screen
        'notifications': (BuildContext ctx) => const NotificationScreen(), // Notification screen
      },
    );
  }
}
