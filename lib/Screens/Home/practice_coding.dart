// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // class NavigationScreen extends StatefulWidget {
// //   const NavigationScreen({super.key});

// //   @override
// //   _NavigationScreenState createState() => _NavigationScreenState();
// // }

// // class _NavigationScreenState extends State<NavigationScreen> {
// //   int _selectedIndex = 0;

// //   // List of screens for each tab
// //   static const List<Widget> _screens = <Widget>[
// //     Screen1(),
// //     Screen2(),
// //     Screen3(),
// //   ];

// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: _screens[_selectedIndex],
// //       bottomNavigationBar: BottomNavigationBar(
// //         backgroundColor: Colors.white,
// //         currentIndex: _selectedIndex,
// //         onTap: _onItemTapped,
// //         type: BottomNavigationBarType.fixed,
// //         items: [
// //           _navIconItem(Icons.menu, 0),
// //           _navIconItem(Icons.book_outlined, 1),
// //           _navIconItem(Icons.apps, 2),
// //           _navIconItem(Icons.notifications_outlined, 3),
// //           _navIconItem(Icons.person_outline_outlined, 4),
// //         ],
// //       ),
// //     );
// //   }

// //   BottomNavigationBarItem _navIconItem(IconData icon, int index) {
// //     final isSelected = _selectedIndex == index;
// //     return BottomNavigationBarItem(
// //       icon: Container(
// //         padding: const EdgeInsets.all(15.0),
// //         decoration: BoxDecoration(
// //           gradient: isSelected
// //               ? LinearGradient(
// //                   colors: [Colors.orange, Colors.deepOrange],
// //                   begin: Alignment.topLeft,
// //                   end: Alignment.bottomRight,
// //                 )
// //               : LinearGradient(
// //                   colors: [Colors.orange.shade100, const Color.fromARGB(255, 255, 169, 41)],
// //                   begin: Alignment.topLeft,
// //                   end: Alignment.bottomLeft,
// //                 ),
// //           borderRadius: BorderRadius.circular(15),
// //         ),
// //         child: Icon(
// //           icon,
// //           color: isSelected ? Colors.white : const Color.fromARGB(255, 255, 255, 255),
// //         ),
// //       ),
// //       label: '',
// //     );
// //   }
// // }

// // // Screen1: Jobs Listing with Search, Bookmarks, and Apply Button
// // class Screen1 extends StatefulWidget {
// //   const Screen1({super.key});

// //   @override
// //   _Screen1State createState() => _Screen1State();
// // }

// // class _Screen1State extends State<Screen1> {
// //   List<dynamic> jobs = [];
// //   List<dynamic> filteredJobs = [];
// //   bool isLoading = true;
// //   String searchQuery = '';
// //   Map<int, bool> bookmarkedJobs = {}; // Track bookmarked jobs using a Map

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchJobs();
// //   }

// //   Future<void> fetchJobs() async {
// //     final url = Uri.parse('https://jsonfakery.com/jobs'); // Replace with your API URL
// //     try {
// //       final response = await http.get(url);
// //       if (response.statusCode == 200) {
// //         final data = json.decode(response.body);
// //         setState(() {
// //           jobs = data;
// //           filteredJobs = data;
// //           isLoading = false;
// //         });
// //       } else {
// //         throw Exception('Failed to load jobs');
// //       }
// //     } catch (e) {
// //       setState(() {
// //         isLoading = false;
// //       });
// //       print('Error fetching jobs: $e');
// //     }
// //   }

// //   void filterJobs(String query) {
// //     setState(() {
// //       searchQuery = query;
// //       filteredJobs = jobs
// //           .where((job) =>
// //               job['title'].toLowerCase().contains(query.toLowerCase()) ||
// //               job['company'].toLowerCase().contains(query.toLowerCase()))
// //           .toList();
// //     });
// //   }

// //   void toggleBookmark(int index) {
// //     setState(() {
// //       bookmarkedJobs[index] = !(bookmarkedJobs[index] ?? false); // Toggle bookmark status
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Home')),
// //       body: isLoading
// //           ? const Center(child: CircularProgressIndicator())
// //           : SingleChildScrollView(
// //               child: Column(
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Container(
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         borderRadius: BorderRadius.circular(30.0),
// //                         boxShadow: [
// //                           BoxShadow(
// //                             color: Colors.black12,
// //                             blurRadius: 4,
// //                             offset: Offset(0, 2),
// //                           ),
// //                         ],
// //                       ),
// //                       child: TextField(
// //                         onChanged: filterJobs,
// //                         decoration: InputDecoration(
// //                           hintText: 'Search Projects or Freelancers',
// //                           hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
// //                           prefixIcon: const Icon(Icons.search, color: Colors.grey),
// //                           border: InputBorder.none,
// //                           contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
// //                           isCollapsed: true,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   const Padding(
// //                     padding: EdgeInsets.all(8.0),
// //                     child: Column(
// //                       children: [
// //                         Text("Featured Jobs", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //                         SizedBox(height: 5),
// //                         Text(
// //                           "Browse jobs that match your experience to a client's hiring preferences. Ordered by most relevant.",
// //                           textAlign: TextAlign.center,
// //                           style: TextStyle(color: Colors.grey),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   ListView.builder(
// //                     shrinkWrap: true,
// //                     physics: NeverScrollableScrollPhysics(),
// //                     itemCount: filteredJobs.length,
// //                     itemBuilder: (context, index) {
// //                       final job = filteredJobs[index];
// //                       return Container(
// //                         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
// //                         padding: const EdgeInsets.all(12),
// //                         decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           borderRadius: BorderRadius.circular(15),
// //                           boxShadow: [
// //                             BoxShadow(
// //                               color: Colors.black12,
// //                               blurRadius: 6,
// //                               offset: Offset(0, 2),
// //                             ),
// //                           ],
// //                         ),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Text(job['title'] ?? 'No Title', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //                                 Text('\$${job['salary_from']} - \$${job['salary_to']}', style: const TextStyle(fontSize: 15)),
// //                               ],
// //                             ),
// //                             const SizedBox(height: 5),
// //                             Text(job['company'] ?? 'No Company', style: const TextStyle(color: Colors.grey)),
// //                             const SizedBox(height: 10),
// //                             Text(
// //                               job['qualifications'] ?? 'No qualifications Available',
// //                               maxLines: 3,
// //                               overflow: TextOverflow.ellipsis,
// //                               style: const TextStyle(fontSize: 14, color: Colors.black87),
// //                             ),
// //                             const SizedBox(height: 10),
// //                             Wrap(
// //                               spacing: 5,
// //                               children: (job['tags'] as List<dynamic>? ?? [])
// //                                   .map((tag) => Chip(
// //                                         label: Text(tag, style: const TextStyle(fontSize: 12)),
// //                                         backgroundColor: Colors.blue[50],
// //                                       ))
// //                                   .toList(),
// //                             ),
// //                             const SizedBox(height: 10),
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 IconButton(
// //                                   icon: Icon(
// //                                     bookmarkedJobs[index] == true ? Icons.bookmark : Icons.bookmark_border,
// //                                     color: bookmarkedJobs[index] == true ? Colors.orange : Colors.grey,
// //                                   ),
// //                                   onPressed: () => toggleBookmark(index),
// //                                 ),
// //                                 ElevatedButton(
// //                                   style: ElevatedButton.styleFrom(
// //                                     backgroundColor: Colors.orange,
// //                                     shape: RoundedRectangleBorder(
// //                                       borderRadius: BorderRadius.circular(20),
// //                                     ),
// //                                   ),
// //                                   onPressed: () {
// //                                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Applied for ${job['title']}')));
// //                                   },
// //                                   child: const Text('Apply'),
// //                                 ),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ],
// //               ),
// //             ),
// //     );
// //   }
// // }

// // // Placeholder Screens for the bottom navigation bar
// // class Screen2 extends StatelessWidget {
// //   const Screen2({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Month')),
// //       body: const Center(child: Text('Tasks')),
// //     );
// //   }
// // }

// // class Screen3 extends StatelessWidget {
// //   const Screen3({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('My Portfolio')),
// //       body: const Center(child: Text('Insert Portfolio')),
// //     );
// //   }
// // }



// // import 'dart:typed_data';

// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';

// // class AddPortfolioPage extends StatefulWidget {
// //   const AddPortfolioPage({super.key});

// //   @override
// //   State<AddPortfolioPage> createState() => _AddPortfolioPageState();
// // }

// // class _AddPortfolioPageState extends State<AddPortfolioPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   String _title = "";
// //   String _subtitle = "";
// //   String _description = "";
// //   Uint8List? _selectedImageBytes;

// //   final ImagePicker _picker = ImagePicker();

// //   // Function to pick an image from the gallery
// //   Future<void> _pickImage() async {
// //     try {
// //       // Show a loading indicator while the image is being picked
// //       showDialog(
// //         context: context,
// //         barrierDismissible: false,
// //         builder: (context) => const Center(
// //           child: CircularProgressIndicator(),
// //         ),
// //       );

// //       final XFile? image = await _picker.pickImage(
// //         source: ImageSource.gallery,
// //         maxWidth: 800, // Limit the width of the image
// //         maxHeight: 800, // Limit the height of the image
// //         imageQuality: 85, // Adjust image quality
// //       );

// //       if (image != null) {
// //         final Uint8List imageBytes = await image.readAsBytes();
// //         setState(() {
// //           _selectedImageBytes = imageBytes;
// //         });
// //       } else {
// //         // If user cancels or doesn't select an image
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text("No image selected.")),
// //         );
// //       }
// //     } catch (e) {
// //       print("Error picking image: $e");
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text("Failed to pick image.")),
// //       );
// //     } finally {
// //       // Remove the loading indicator
// //       if (context.mounted) Navigator.of(context).pop();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Add Portfolio"), titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
// //         centerTitle: true,
// //       backgroundColor: Color.fromRGBO(207, 229, 251, 1.0),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(20),
// //         child: Form(
// //           key: _formKey,
// //           child: SingleChildScrollView(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 SizedBox(height: 20,),
// //                 // Portfolio Title
// //                 TextFormField(
// //                   decoration: const InputDecoration(
// //                     labelText: "Portfolio Title",
// //                     border: OutlineInputBorder(),
// //                   ),
// //                   onSaved: (value) {
// //                     _title = value!;
// //                   },
// //                   validator: (value) {
// //                     if (value == null || value.isEmpty) {
// //                       return "Please enter a title";
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //                 const SizedBox(height: 20),

// //                 // Subtitle (e.g., Name)
// //                 TextFormField(
// //                   decoration: const InputDecoration(
// //                     labelText: "Subtitle (e.g., Name)",
// //                     border: OutlineInputBorder(),
// //                   ),
// //                   onSaved: (value) {
// //                     _subtitle = value!;
// //                   },
// //                   validator: (value) {
// //                     if (value == null || value.isEmpty) {
// //                       return "Please enter a subtitle";
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //                 const SizedBox(height: 20),

// //                 // Description
// //                 TextFormField(
// //                   decoration: const InputDecoration(
// //                     labelText: "Description",
// //                     border: OutlineInputBorder(),
// //                   ),
// //                   onSaved: (value) {
// //                     _description = value!;
// //                   },
// //                   validator: (value) {
// //                     if (value == null || value.isEmpty) {
// //                       return "Please enter a description";
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //                 const SizedBox(height: 20),

// //                 // Display selected image or show placeholder
// //                 _selectedImageBytes != null
// //                     ? Image.memory(
// //                         _selectedImageBytes!,
// //                         height: 380,
// //                         width: double.infinity,
// //                         fit: BoxFit.cover,
// //                       )
// //                     : const Text("No image selected", style: TextStyle(color: Colors.grey)),
// //                 const SizedBox(height: 10),

// //                 // Pick Image Button
// //                 ElevatedButton.icon(
// //                   onPressed: _pickImage,
// //                   icon: const Icon(Icons.photo),
// //                   label: const Text("Pick Image"),
// //                 ),
// //                 const SizedBox(height: 30),

// //                 // Save Button
// //                 Center(
// //                   child: ElevatedButton(
// //                     onPressed: () {
// //                       if (_formKey.currentState!.validate()) {
// //                         _formKey.currentState!.save();
// //                         Navigator.pop(
// //                           context,
// //                           {
// //                             "title": _title,
// //                             "subtitle": _subtitle,
// //                             "description": _description,
// //                             "imageBytes": _selectedImageBytes, // Pass image bytes
// //                           },
// //                         );
// //                       }
// //                     },
// //                     child: const Text("Save Portfolio"),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }




// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/material.dart';

// // // Firebase initialization with your custom options
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
  
// //   // Initialize Firebase
// //   await Firebase.initializeApp(
// //     options: FirebaseOptions(
// //       apiKey: "AIzaSyBsOsSDKu_1LEbZ52LkeQVdgrtTZjyjqRo",
// //       appId: "1:912839656061:android:abac9ddc532f2edf7c6714",
// //       messagingSenderId: "912839656061",
// //       projectId: "technodeskworks",
// //     ),
// //   );
  
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Firebase Authentication',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: AuthCheck(),  // This will handle login state
// //     );
// //   }
// // }

// // class AuthCheck extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder<User?>(
// //       stream: FirebaseAuth.instance.authStateChanges(),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.active) {
// //           // If user is logged in, show home screen
// //           if (snapshot.hasData) {
// //             return HomeScreen();
// //           } else {
// //             // If user is not logged in, show login screen
// //             return LoginScreen();
// //           }
// //         } else {
// //           // While the Firebase auth state is being loaded, show a loading screen
// //           return Center(child: CircularProgressIndicator());
// //         }
// //       },
// //     );
// //   }
// // }

// // class LoginScreen extends StatelessWidget {
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Login")),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: emailController,
// //               decoration: InputDecoration(labelText: "Email"),
// //             ),
// //             TextField(
// //               controller: passwordController,
// //               decoration: InputDecoration(labelText: "Password"),
// //               obscureText: true,
// //             ),
// //             ElevatedButton(
// //               onPressed: () async {
// //                 try {
// //                   await FirebaseAuth.instance.signInWithEmailAndPassword(
// //                     email: emailController.text,
// //                     password: passwordController.text,
// //                   );
// //                 } catch (e) {
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     SnackBar(content: Text('Login failed: $e')),
// //                   );
// //                 }
// //               },
// //               child: Text("Login"),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => RegistrationScreen()),
// //                 );
// //               },
// //               child: Text("Don't have an account? Sign Up"),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class RegistrationScreen extends StatefulWidget {
// //   @override
// //   _RegistrationScreenState createState() => _RegistrationScreenState();
// // }

// // class _RegistrationScreenState extends State<RegistrationScreen> {
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final TextEditingController fullNameController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Sign Up")),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: fullNameController,
// //               decoration: InputDecoration(labelText: "Full Name"),
// //             ),
// //             TextField(
// //               controller: emailController,
// //               decoration: InputDecoration(labelText: "Email"),
// //             ),
// //             TextField(
// //               controller: passwordController,
// //               decoration: InputDecoration(labelText: "Password"),
// //               obscureText: true,
// //             ),
// //             ElevatedButton(
// //               onPressed: () async {
// //                 try {
// //                   // Create a new user with email and password
// //                   UserCredential userCredential = await FirebaseAuth.instance
// //                       .createUserWithEmailAndPassword(
// //                     email: emailController.text,
// //                     password: passwordController.text,
// //                   );

// //                   // After the user is created, store additional information in Firestore
// //                   User? user = userCredential.user;
// //                   if (user != null) {
// //                     await FirebaseFirestore.instance
// //                         .collection('users')
// //                         .doc(user.uid)
// //                         .set({
// //                       'full_name': fullNameController.text,
// //                       'email': user.email,
// //                     });

// //                     // Navigate to the home screen after successful registration
// //                     Navigator.pushReplacement(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => HomeScreen()),
// //                     );
// //                   }
// //                 } catch (e) {
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     SnackBar(content: Text('Registration failed: $e')),
// //                   );
// //                 }
// //               },
// //               child: Text("Register"),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Home Screen"),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.logout),
// //             onPressed: () async {
// //               await FirebaseAuth.instance.signOut();
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Center(child: Text("Welcome to the Home Screen!")),
// //     );
// //   }
// // }


// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<dynamic> jobs = [];
//   List<dynamic> filteredJobs = [];
//   bool isLoading = true;
//   String searchQuery = '';
//   bool _isPanelOpen = false; // Control for the panel visibility
//   Map<int, bool> bookmarkedJobs = {};

//   @override
//   void initState() {
//     super.initState();
//     fetchJobs();
//   }

//   Future<void> fetchJobs() async {
//     final url = Uri.parse('https://jsonfakery.com/jobs');
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           jobs = data;
//           filteredJobs = data;
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load jobs');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       print('Error fetching jobs: $e');
//     }
//   }

//   void togglePanel() {
//     setState(() {
//       _isPanelOpen = !_isPanelOpen;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(207, 229, 251, 1.0),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         flexibleSpace: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Color.fromRGBO(255, 226, 121, 1), Colors.white],
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 1,
//               left: 300,
//               right: 20,
//               child: CircleAvatar(
//                 backgroundColor: Colors.orange,
//                 child: IconButton(
//                   icon: const Icon(Icons.mail, color: Colors.white),
//                   onPressed: togglePanel,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color.fromRGBO(255, 255, 255, 1),
//                     Color.fromRGBO(207, 229, 251, 1.0)
//                   ],
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         labelText: "Search Projects or Freelancer",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                         prefixIcon: const Icon(Icons.search),
//                       ),
//                     ),
//                   ),
//                   const Text(
//                     "Featured Jobs",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // Sliding Message Panel
//           AnimatedPositioned(
//             duration: const Duration(milliseconds: 300),
//             right: _isPanelOpen ? 0 : -MediaQuery.of(context).size.width,
//             top: 0,
//             bottom: 0,
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(color: Colors.black26, blurRadius: 10),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     color: Colors.blue,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Inbox',
//                           style: TextStyle(color: Colors.white, fontSize: 18),
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.close, color: Colors.white),
//                           onPressed: togglePanel,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView(
//                       padding: const EdgeInsets.all(16),
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             color: Colors.cyan[100],
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: const [
//                               Row(
//                                 children: [
//                                   Icon(Icons.person, size: 50),
//                                   SizedBox(width: 10),
//                                   Text(
//                                     "Wendy",
//                                     style: TextStyle(
//                                         fontSize: 22,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 10),
//                               Text(
//                                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In aperiam soluta et unde quos ea.",
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


