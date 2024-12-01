import 'package:exercise_4/Navigation.dart';
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
      initialRoute: 'login',
      routes: {
        'login': (BuildContext ctx) => const LoginValidatedScreen(),
        'home': (BuildContext ctx) => const NavigationTechno(), 
        'profile': (BuildContext ctx) => const Profile(), 
        'notifications': (BuildContext ctx) => const NotificationScreen(), 
      },
    );
  }
}
