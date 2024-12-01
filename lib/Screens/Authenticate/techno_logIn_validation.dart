import 'package:exercisce_unit4/Navigation.dart';
import 'package:exercisce_unit4/Screens/Authenticate/techno_signUp_validated.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';

class LoginValidatedScreen extends StatefulWidget {
  const LoginValidatedScreen({super.key});

  @override
  State<LoginValidatedScreen> createState() => _LoginValidatedScreenState();
}

class _LoginValidatedScreenState extends State<LoginValidatedScreen> {
  // final _auth = FirebaseAuth.instance;
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(207, 229, 251, 1.0)
              ])),
          child: Form(
            key: _formfield,
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('images/TechnoDeskWorks.png'),
                ),
                Container(
                  width: 290,
                  alignment: Alignment.centerLeft,
                  child: const Text("Login to your account",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(9, 110, 188, 1),
                      )),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.1), 
                          offset: const Offset(1, 3),
                          blurRadius: 4,
                          spreadRadius: 0.23,
                        ),
                      ]),
                  width: 300,
                  child: TextFormField(
                    controller: emailController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Email',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 8.0), 
                          child: Icon(
                            Icons.circle_rounded,
                            color: Color.fromRGBO(83, 173, 243, 1),
                          ),
                        ),
                      ),
                    ),
                    validator: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value.isEmpty) {
                        return "Enter Email";
                      } else if (!emailValid) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.1), 
                          offset: const Offset(1, 3),
                          blurRadius: 4,
                          spreadRadius: 0.23,
                        ),
                      ]),
                  width: 300,
                  child: TextFormField(
                    controller: passController,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Password',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.0), 
                          child: Icon(
                            Icons.circle_rounded,
                            color: Color.fromRGBO(244, 166, 50, 1.0), 
                          ),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      } else if (passController.text.length < 6) {
                        return "Password Length Should be more than 6 characters";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                GradientElevatedButton(
                    onPressed: () async {
                      try {
                        if(_formfield.currentState!.validate()){
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text, 
                            password: passController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Login Successful!')));
                        emailController.clear();
                        passController.clear();
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => const NavigationTechno())));
                        }
                      } catch (e){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed: $e")));
                      }
                      // if (_formfield.currentState!.validate()) {
                      //   // _login();
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //         content: Text('Login Successful!')),
                      //   );

                      //   emailController.clear();
                      //   passController.clear();
                      //   Navigator.push(context, MaterialPageRoute(builder: ((context) => const NavigationTechno())));

                      // }
                    },
                    style: GradientElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 130),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 250, 230, 194),
                            Color.fromARGB(255, 232, 162, 13),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 20,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider(
                        color: Color.fromRGBO(57, 105, 144, 1),
                        height: 10,
                        indent: 20,
                        endIndent: 20,
                      )),
                      Text(
                        "or Login with",
                        style: TextStyle(
                            color: Color.fromRGBO(57, 105, 144, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Divider(
                        color: Color.fromRGBO(57, 105, 144, 1),
                        height: 10,
                        indent: 20,
                        endIndent: 20,
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 80,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset("images/google.png")),
                      ),
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset("images/facebook.png")),
                      ),
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset("images/linkedin.png")),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => const RegistrationTechno())));
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Color.fromRGBO(9, 110, 188, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
