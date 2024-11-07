import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.transparent, // Make background transparent
        elevation: 0, // Remove shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color.fromARGB(255, 91, 158, 252),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
            SizedBox(height: 16),
            Text(
              'Hi there! I\'m [your name], an experienced freelance graphic designer specializing in creating stunning visuals for digital and print. With over 5 years of experience, my portfolio includes a wide range of projects from corporate identity to marketing materials and more.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.person, color: Colors.orange),
                      title: Text('My Profile'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.comment, color: Colors.orange),
                      title: Text('Testimonials'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.dashboard, color: Colors.orange),
                      title: Text('Dashboard'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.payment, color: Colors.orange),
                      title: Text('Payment'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.bookmark, color: Colors.orange),
                      title: Text('Bookmarks'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.settings, color: Colors.orange),
                      title: Text('Settings'),
                    ),
                  ),
                ],
              ),
            ),
            
            

            Align (
              alignment: Alignment.bottomRight,
            child:Container(
              width: 130,
              padding: EdgeInsets.symmetric(vertical: 1),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 98, 98),
                    Color.fromARGB(255, 251, 50, 50)
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
              child: TextButton(
                onPressed: () {
                  // Implement logout functionality here
                  print("Logged out");
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ),
              ),
            ),
            SizedBox(height: 16), // Add some space below
          ],
        ),
      ),
    );
  }
}
