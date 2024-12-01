import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SETTINGS',
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(57, 105, 144, 1),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 237, 198, 136),
                Color.fromARGB(255, 246, 217, 173),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0), 
            child: ListView(
              children: [
                const SizedBox(height: 12),
                const Text(
                  'Account Settings',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600), 
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.orange, size: 20), 
                  title: const Text('Account', style: TextStyle(fontSize: 14)), 
                  subtitle: const Text(
                    'Manage your account details',
                    style: TextStyle(fontSize: 12), 
                  ),
                  onTap: () {
                    print('Navigate to Account');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.contact_mail, color: Colors.orange, size: 20),
                  title: const Text('Contact Info', style: TextStyle(fontSize: 14)),
                  subtitle: const Text(
                    'Update your email or phone',
                    style: TextStyle(fontSize: 12),
                  ),
                  onTap: () {
                    print('Navigate to Contact Info');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.lock, color: Colors.orange, size: 20),
                  title: const Text('Password and Security', style: TextStyle(fontSize: 14)),
                  subtitle: const Text(
                    'Change your password and secure your account',
                    style: TextStyle(fontSize: 12),
                  ),
                  onTap: () {
                    print('Navigate to Password and Security');
                  },
                ),
                const SizedBox(height: 18),
                const Text(
                  'Preferences',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.notifications, color: Colors.orange, size: 20),
                  title: const Text('Notifications Settings', style: TextStyle(fontSize: 14)),
                  subtitle: const Text(
                    'Customize notifications',
                    style: TextStyle(fontSize: 12),
                  ),
                  onTap: () {
                    print('Navigate to Notifications Settings');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.attach_money, color: Colors.orange, size: 20),
                  title: const Text('Get Paid', style: TextStyle(fontSize: 14)),
                  subtitle: const Text(
                    'Manage payment methods',
                    style: TextStyle(fontSize: 12),
                  ),
                  onTap: () {
                    print('Navigate to Get Paid');
                  },
                ),
                const SizedBox(height: 18),
                const Text(
                  'Support',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.help, color: Colors.orange, size: 20),
                  title: const Text('Help', style: TextStyle(fontSize: 14)),
                  subtitle: const Text(
                    'Get assistance and support',
                    style: TextStyle(fontSize: 12),
                  ),
                  onTap: () {
                    print('Navigate to Help');
                  },
                ),
                const SizedBox(height: 80), 
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0), 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'images/TechnoDeskWorks.png', 
                    width: 50, 
                    height: 50,
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '© 2024 All Rights Reserved',
                    style: TextStyle(fontSize: 10, color: Colors.grey), 
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
