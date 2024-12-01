
// import 'package:exercisce_unit4/Screens/Navigation.dart';
import 'package:exercisce_unit4/Screens/Wrapper.dart';
import 'package:exercisce_unit4/Services/portfolio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//FIREBASE BABY
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBsOsSDKu_1LEbZ52LkeQVdgrtTZjyjqRo",
      appId: "1:912839656061:android:abac9ddc532f2edf7c6714",
      messagingSenderId: "912839656061",
      projectId: "technodeskworks",
    ),
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => PortfolioProvider(),
      child: const MyApp(),
    ),
  );
}

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TechnoWorks",

    //UNCOMMENT THIS IF YOU WANT TO STORE SA DATABASE
    //NOTE IF YOU WANT TO UNCOMMENT, EH UNCOMMENT MAN ANG UNDER SA FIREBASE BABY
      home: AuthCheck(),
    
    //IF YOU WANT TO TESTING LANG DIRI KLANG HUHUHUH
      // home: HomeScreen(),
      // home: NavigationTechno(),
      // home: SearchbyCategory(),
    
    );
  }
}



// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) =>PortfolioProvider(),
//       child: const MyApp(),
//     ),
//   );
// }




// class AuthCheck extends StatelessWidget {
//   const AuthCheck({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           // If user is logged in, show home screen
//           if (snapshot.hasData) {
//             return Homepage();
//           } else {
//             // If user is not logged in, show login screen
//             return LoginValidatedScreen();
//           }
//         } else {
//           // While the Firebase auth state is being loaded, show a loading screen
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// // import 'firebase_options.dart'; // Ensure you have this if using the FlutterFire CLI

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  
//   // Initialize Firebase with custom options (Web/Manual setup)
//   await Firebase.initializeApp(
//     options: FirebaseOptions(
//       apiKey: "AIzaSyBsOsSDKu_1LEbZ52LkeQVdgrtTZjyjqRo",
//       appId: "1:912839656061:android:abac9ddc532f2edf7c6714",
//       messagingSenderId: "912839656061",
//       projectId: "technodeskworks",
//     ),
//   );
  
//   runApp(MyApp());
// } 



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firebase Authentication',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: AuthCheck(),  // This will handle login state
//     );
//   }
// }

// class AuthCheck extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           // If user is logged in, show home screen
//           if (snapshot.hasData) {
//             return HomeScreen();
//           } else {
//             // If user is not logged in, show login screen
//             return LoginScreen();
//           }
//         } else {
//           // While the Firebase auth state is being loaded, show a loading screen
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }

// class LoginScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Login")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: "Email"),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: "Password"),
//               obscureText: true,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await FirebaseAuth.instance.signInWithEmailAndPassword(
//                     email: emailController.text,
//                     password: passwordController.text,
//                   );
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Login failed: $e')),
//                   );
//                 }
//               },
//               child: Text("Login"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Screen"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () async {
//               await FirebaseAuth.instance.signOut();
//             },
//           ),
//         ],
//       ),
//       body: Center(child: Text("Welcome to the Home Screen!")),
//     );
//   }
// }



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// // Firebase initialization with your custom options
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  
//   // Initialize Firebase
//   await Firebase.initializeApp(
//     options: FirebaseOptions(
//       apiKey: "AIzaSyBsOsSDKu_1LEbZ52LkeQVdgrtTZjyjqRo",
//       appId: "1:912839656061:android:abac9ddc532f2edf7c6714",
//       messagingSenderId: "912839656061",
//       projectId: "technodeskworks",
//     ),
//   );
  
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'TechnoDeskWorks',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Authentication(),  // This will handle login state
//     );
//   }
// }

// class Authentication extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           // If user is logged in, show home screen
//           if (snapshot.hasData) {
//             return HomeScreen();
//           } else {
//             // If user is not logged in, show login screen
//             return LoginScreen();
//           }
//         } else {
//           // While the Firebase auth state is being loaded, show a loading screen
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }

// class LoginScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Login")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: "Email"),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: "Password"),
//               obscureText: true,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await FirebaseAuth.instance.signInWithEmailAndPassword(
//                     email: emailController.text,
//                     password: passwordController.text,
//                   );
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Login failed: $e')),
//                   );
//                 }
//               },
//               child: Text("Login"),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => RegistrationScreen()),
//                 );
//               },
//               child: Text("Don't have an account? Sign Up"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RegistrationScreen extends StatefulWidget {
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController fullNameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Sign Up")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: fullNameController,
//               decoration: InputDecoration(labelText: "Full Name"),
//             ),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: "Email"),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: "Password"),
//               obscureText: true,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   // Create a new user with email and password
//                   UserCredential userCredential = await FirebaseAuth.instance
//                       .createUserWithEmailAndPassword(
//                     email: emailController.text,
//                     password: passwordController.text,
//                   );

//                   // After the user is created, store additional information in Firestore
//                   User? user = userCredential.user;
//                   if (user != null) {
//                     await FirebaseFirestore.instance
//                         .collection('users')
//                         .doc(user.uid)
//                         .set({
//                       'full_name': fullNameController.text,
//                       'email': user.email,
//                     });

//                     // Navigate to the home screen after successful registration
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => HomeScreen()),
//                     );
//                   }
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Registration failed: $e')),
//                   );
//                 }
//               },
//               child: Text("Register"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Screen"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () async {
//               await FirebaseAuth.instance.signOut();
//             },
//           ),
//         ],
//       ),
//       body: Center(child: Text("Welcome to the Home Screen!")),
//     );
//   }
// }

