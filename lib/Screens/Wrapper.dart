// import 'package:exercisce_unit4/Models/User.dart';
// import 'package:exercisce_unit4/Screens/Authenticate/techno_logIn_validation.dart';
// import 'package:exercisce_unit4/Screens/Navigation.dart';
// import 'package:provider/provider.dart';
import 'package:exercisce_unit4/Screens/Authenticate/techno_logIn_validation.dart';
import 'package:exercisce_unit4/Screens/Home/techno_HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(), 
//       builder: (context, snapshot){
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text('Something went wrong!');
//         } else if (snapshot.hasData) {
//           return Homepage();
//         } else {
//           return LoginValidatedScreen();
//         }
//       });
//   }
// }

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // If user is logged in, show home screen
          if (snapshot.hasData) {
            return HomeScreen();  //going to homescreen if ara ang data
          } else {
            // If user is not logged in, show login screen
            return LoginValidatedScreen();  //if not log in or not registered
          }
        } else {
          // While the Firebase auth state is being loaded, show a loading screen
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}