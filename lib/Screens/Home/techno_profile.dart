import 'package:exercisce_unit4/Screens/Authenticate/techno_logIn_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginValidatedScreen()),
                    );
            },
          ),
        ],
      ),
      body: Center(child: Text("Welcome to the Home Screen!")),
    );
  }
}