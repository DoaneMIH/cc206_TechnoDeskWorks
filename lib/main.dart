



import 'package:exercise_4/navigation/techno_navigation.dart';
import 'package:exercise_4/Login/techno_logIn_validation.dart'; 
import 'package:exercise_4/navigation/Profile/techno_profile.dart';
import 'package:exercise_4/navigation/Notification/techno_notification.dart';




import 'package:exercisce_unit4/Navigation.dart';
import 'package:exercisce_unit4/techno_searchBar.dart';
import 'package:exercisce_unit4/techno_signUp_validated.dart';



import 'package:exercisce_unit4/Navigation.dart';
import 'package:exercisce_unit4/techno_searchBar.dart';
import 'package:exercisce_unit4/techno_signUp_validated.dart';

import 'package:exercise_4/techno_logIn_validation.dart';


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
        'home': (BuildContext ctx) => const NavigationScreen(), 
        'profile': (BuildContext ctx) => const Profile(), 
        'notifications': (BuildContext ctx) => const NotificationScreen(), 

      initialRoute: 'login', 
      routes: {
        'login': (BuildContext ctx) => const LoginValidatedScreen(), 
        'home': (BuildContext ctx) => const NavigationScreen(), 
        'profile': (BuildContext ctx) => const Profile(), 
        'notifications': (BuildContext ctx) => const NotificationScreen(),

      },



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TechnoWorks",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(255, 255, 255, 1)),
        // scaffoldBackgroundColor: const Color.fromRGBO(207, 229, 251, 1.0)
      ),


      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

      initialRoute: 'Homepage',

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
    )

    );
  }
}
