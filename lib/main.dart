


import 'package:exercisce_unit4/Navigation.dart';
import 'package:exercisce_unit4/techno_searchBar.dart';
import 'package:exercisce_unit4/techno_signUp_validated.dart';

import 'package:exercise_4/techno_logIn_validation.dart';



import 'package:exercise_4/navigation/techno_navigation.dart';
import 'package:exercise_4/Login/techno_logIn_validation.dart';
import 'package:exercise_4/navigation/Profile/techno_profile.dart';
import 'package:exercise_4/navigation/Notification/techno_notification.dart';

import 'package:flutter/material.dart';

//FIREBASE BABY

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

//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => PortfolioProvider(),
//       child: const MyApp(),
//     ),
//   );
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TechnoWorks",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(

            seedColor: const Color.fromRGBO(255, 255, 255, 1)),
        // scaffoldBackgroundColor: const Color.fromRGBO(207, 229, 251, 1.0)
      ),
      initialRoute: 'Homepage', //Change to '/' to SignUp
      routes: {
        '/' : (BuildContext ctx) => const RegistrationTechno(),
        'Homepage': (BuildContext ctx) => const NavigationTechno(),
        'SearchBar' : (BuildContext ctx) => const Searchbar(),
      },

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: logIn(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _logIn() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      print('Email: $email');
      print('Password: $password');

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login'),
            content: Text('Login Successful!\nEmail: $email'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(253, 253, 253, 1),
                Color.fromARGB(255, 172, 201, 255),
              ],
              stops: [0.04, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: 120,
          child: Container(
            width: 196,
            height: 276,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/TechnoDeskWorks.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Positioned(
          top: 350,
          left: 60,
          child: Text(
            'Login to your account',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 9, 110, 188),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 400,
          left: 60,
          child: Container(
            width: 290,
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(1, 3),
                  blurRadius: 4,
                  spreadRadius: 0.23,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 470,
          left: 60,
          child: Container(
            width: 290,
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(1, 3),
                  blurRadius: 4,
                  spreadRadius: 0.23,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 170, 0),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 540,
          left: 60,
          child: GestureDetector(
            onTap: _logIn,
            child: Container(
              width: 290,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 250, 230, 194),
                    Color.fromARGB(255, 232, 162, 13),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(1, 3),
                    blurRadius: 4,
                    spreadRadius: 0.23,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 650,
            left: 60,
            child: Container(
              height: 1,
              width: 80,
              color: Color.fromRGBO(57, 105, 144, 1),
            )),
        Positioned(
            top: 650,
            left: 270,
            child: Container(
              height: 1,
              width: 80,
              color: Color.fromRGBO(57, 105, 144, 1),
            )),
        Positioned(
            top: 640,
            left: 160,
            child: Center(
                child: Text('or Login with',
                    style: TextStyle(
                      color: Color.fromRGBO(57, 105, 144, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )))),
        Positioned(
          top: 675,
          left: 80,
          child: GestureDetector(
            onTap: () {
              print('Google icon clicked');
            },
            child: Container(
              width: 86,
              height: 44,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/ggl.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 675,
          left: 170,
          child: GestureDetector(
            onTap: () {
              print('Facebook icon clicked');
            },
            child: Container(
              width: 86,
              height: 44,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/fb.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 675,
          left: 260,
          child: GestureDetector(
            onTap: () {
              print('LinkedIn icon clicked');
            },
            child: Container(
              width: 86,
              height: 44,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/lnk.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 400,
            height: 80,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(1, 3),
                  blurRadius: 4,
                  spreadRadius: 0.23,
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                            color: Color.fromRGBO(57, 105, 144, 1),
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),


      title: "TechnoWorks",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(

          seedColor: const Color.fromRGBO(255, 255, 255, 1),
        ),
      ),

      initialRoute: 'login',
      routes: {
        'login': (BuildContext ctx) => const LoginValidatedScreen(),
        'home': (BuildContext ctx) => const NavigationScreen(),
        'profile': (BuildContext ctx) => const Profile(),
        'notifications': (BuildContext ctx) => const NotificationScreen(),
      },


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
