import 'package:exercisce_unit4/Services/Method.dart';
import 'package:flutter/material.dart';

class MyProfileMain extends StatefulWidget {
  const MyProfileMain({super.key});

  @override
  State<MyProfileMain> createState() => _MyProfileMainState();
}

class _MyProfileMainState extends State<MyProfileMain> {
  String name = 'Loading...';
  String email = 'Loading...';

  void fetchAndDisplayUserDetails()async{
    UserAuthentication userAuthentication = UserAuthentication();
    Map<String,dynamic>? userDetails = await userAuthentication.getUserDetails();

    if (userDetails != null) {
      setState(() {
        name = userDetails['name'] ?? 'No name available';
        email = userDetails['email'] ?? 'No email available';
      });
    } else {
      print("Failed to fetch user details");
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch user details when the page loads
    fetchAndDisplayUserDetails(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Profile'),
        actions: [
          TextButton(
            onPressed: () {
              
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Save Changes',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color.fromARGB(255, 91, 158, 252),
                  child: const Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text('La Paz, Iloilo City'),
                    const Text(
                      '★★★★★ (N/A Reviews)',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    ElevatedButton(
                      onPressed: () {
                       
                      },
                      child: const Text('Hours per week'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            SectionHeader(title: 'Education'),
            const Text(
              'West Visayas State University',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            SectionHeader(title: 'Position'),
            const Text('₱0.00/hr'),
            const Text('- Graphic Designer\n- UI/UX Designer'),
            const SizedBox(height: 16),

            SectionHeader(title: 'Work History'),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),

            SectionHeader(title: 'Portfolio'),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('images/portfolio.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    
                  },
                  icon: const Icon(Icons.add_circle, color: Colors.orange, size: 50),
                ),
              ],
            ),
            const SizedBox(height: 16),

            SectionHeader(title: 'Skills'),
            Wrap(
              spacing: 15,
              children: const [
                SkillChip(label: 'Web Design'),
                SkillChip(label: 'Layout'),
                SkillChip(label: 'HTML/CSS'),
                SkillChip(label: 'UI/UX Design'),
                SkillChip(label: 'Graphics'),
                SkillChip(label: 'JavaScript'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {
            
          },
          icon: const Icon(Icons.edit, color: Colors.blue),
        ),
      ],
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.orange, width: 0.1),
      ),
    );
  }
}
