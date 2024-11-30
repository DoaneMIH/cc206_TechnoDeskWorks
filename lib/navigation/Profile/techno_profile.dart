import 'package:exercise_4/navigation/Profile/techno_bookmarks.dart';
import 'package:exercise_4/navigation/Profile/techno_editprofile';
import 'package:exercise_4/navigation/Profile/techno_payment.dart';
import 'package:exercise_4/navigation/Profile/techno_testimonials.dart';
import 'package:exercise_4/navigation/Profile/techno_settings.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color.fromARGB(255, 91, 158, 252),
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Job Position'),
                      Text('La Paz, Iloilo City'),
                      Row(
                        children: [
                          Icon(Icons.star, size: 16),
                          Icon(Icons.star, size: 16),
                          Icon(Icons.star, size: 16),
                          Icon(Icons.star, size: 16),
                          Icon(Icons.star_half, size: 16),
                          Text('(N/A Reviews)'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Hi there! I\'m [your name], an experienced freelance graphic designer specializing in creating stunning visuals for digital and print. With over 5 years of experience, my portfolio includes a wide range of projects from corporate identity to marketing materials and more.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),

              
              Column( 
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyProfileScreen(), 
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.person, color: Colors.orange),
                      title: Text('Edit Profile'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TestimonialsScreen(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.comment, color: Colors.orange),
                      title: Text('Testimonials'),
                    ),
                  ),
                  InkWell(
                    onTap: () {}, 
                    child: const ListTile(
                      leading: Icon(Icons.dashboard, color: Colors.orange),
                      title: Text('Dashboard'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentScreen(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.payment, color: Colors.orange),
                      title: Text('Payment'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookmarksScreen(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.bookmark, color: Colors.orange),
                      title: Text('Bookmarks'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.settings, color: Colors.orange),
                      title: Text('Settings'),
                    ),
                  ),
                ],
              ),

              
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 130,
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 98, 98),
                        Color.fromARGB(255, 251, 50, 50),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  child: TextButton(
                    onPressed: () {
                      
                      print("Logged out");
                    },
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16), 
            ],
          ),
        ),
      ),
    );
  }
}
