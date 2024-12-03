// import 'package:exercisce_unit4/techno_logIn_validation.dart';
import 'package:exercisce_unit4/Screens/Authenticate/techno_logIn_validation.dart';
import 'package:exercisce_unit4/Services/Method.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth_platform_interface/';
import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';

class RegistrationTechno extends StatefulWidget {
  const RegistrationTechno({super.key});

  @override
  State<RegistrationTechno> createState() => _RegistrationTechnoState();
}

class _RegistrationTechnoState extends State<RegistrationTechno> {
  // final _auth = FirebaseAuth.instance;
final _formfield = GlobalKey<FormState>();
final emailController = TextEditingController();
final passController = TextEditingController();
final passConfirmController = TextEditingController();
final nameController = TextEditingController();
String error = " ";
bool passToggle = true;

final UserAuthentication _userAuthentication = UserAuthentication();

void _signup(BuildContext context) async {
  String? result = await _userAuthentication.signUp(name: nameController.text
  , email: emailController.text, 
  password: passController.text);

  if(result == null){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("SignUp Successfull! Welcome ${nameController.text}"))
    );

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginValidatedScreen()));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Registration failed"))
    );
  }
}

//  Future<void> _register() async {
//     try {
//         await _auth.createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passController.text,
//       );

     
//       // if (userCredential != null) {

//         // FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
//           // 'fullName': nameController.text,  // Store Full Name
//           // 'email': emailController.text,    // Store Email
//           // Add any additional fields you want to store
//         // });

//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginValidatedScreen()));
//       // }
//     } on FirebaseAuthException catch (e) {
//       print('Error: $e');
//     }
//   }

// Future<void> registerUser() async {
// const String apiUrl = "http://localhost/technodeskworks/register.php";
//   try {
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {"Content-Type": "application/json"},
//       body: json.encode({
//         "user_name": nameController.text,
//         "user_email": emailController.text,
//         "user_password": passController.text,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       if (data['status'] == 'success') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(data['message'])),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(data['message'])),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to connect to the server!')),
//       );
//     }
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error: $e')),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  child: const Text("Register Form",
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
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.1), 
                          blurRadius: 4,
                          spreadRadius: 0.23,
                        )
                      ]),
                  width: 300,
                  child: TextFormField(
                    controller: nameController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Full name',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.circle_rounded,
                            color: Color.fromRGBO(21, 131, 220, 1.0),
                          ),
                        ),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your full name";
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
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.1), 
                          blurRadius: 4,
                          spreadRadius: 0.23,
                        )
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
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.circle_rounded,
                            color: Color.fromRGBO(244, 166, 50, 1.0),
                          ),
                        ),
                      ),
                    ),
                    validator: (value){
                      bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                      if(value.isEmpty){
                        return "Enter Email";
                      } else if(!emailValid){
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
                          blurRadius: 4,
                          spreadRadius: 0.23,
                        )
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
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.circle_rounded,
                            color: Color.fromRGBO(21, 131, 220, 1.0),
                          ),
                        ),
                      ),
                    ),
                    validator: (value){
                      if (value!.isEmpty){
                        return "Please enter your password";
                      } else if (passController.text.length < 6){
                        return "Password Length Should be more than 6 characters";
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
                          blurRadius: 4,
                          spreadRadius: 0.23,
                        )
                      ]),
                  width: 300,
                  child: TextFormField(
                    controller: passConfirmController,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Confirmed Password',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.circle_rounded,
                            color: Color.fromRGBO(244, 166, 50, 1.0),
                          ),
                        ),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please confirm your password";
                      } else if(value != passController.text){
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                GradientElevatedButton(
                    onPressed: () => _signup(context),
                      // try{
                      //   if (_formfield.currentState!.validate()){
                      //     // Create a new user with email and password
                      //     UserCredential userCredential = await FirebaseAuth.instance
                      //       .createUserWithEmailAndPassword(
                      //         email: emailController.text,
                      //         password: passController.text,
                      //   );
                      //     User? user = userCredential.user;
                      //   if (user != null) {
                      //       await FirebaseFirestore.instance
                      //     .collection('users')
                      //     .doc(user.uid)
                      //       .set({
                      //       'full_name': nameController.text,
                      //       'email': user.email,
                      //     });  
                      //   }
                      //   nameController.clear();
                      //   emailController.clear();
                      //   passController.clear();
                      //   passConfirmController.clear();
                      //   Navigator.push(context,MaterialPageRoute(builder: (context) => LoginValidatedScreen()));
                      //   } 
                        
                      // }catch (e){
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('Registration failed: $e')),
                      //   );
                      // }
                      // if (_formfield.currentState!.validate()){
                      //   // _register();
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(content: Text('Registration Successful!')),
                      //   );
                      // if (_formfield.currentState!.validate()) {
                      //   // registerUser();
                      //   dynamic result = await _auth.registerWithEmailAndPassword(emailController.text, passController.text);
                      //   if (result == null){
                      //     setState(() => error = "Please supply a valid email");
                      //   }
                        // print("Data Added Successfully");
                        // nameController.clear();
                        // emailController.clear();
                        // passController.clear();
                        // passConfirmController.clear();
                        // Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginValidatedScreen())));
                      // }
                    // }
                    
                    style: GradientElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 130),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 250, 230, 194),
                            Color.fromARGB(255, 232, 162, 13),
                          ],
                        )),
                    child: const Text(
                      "Sign Up",
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
                        "or Sign up with",
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
                    borderRadius: BorderRadius.circular(15),
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
                            "Already have an account? ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginValidatedScreen())));
                            },
                            child: const Text(
                              "Log In",
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