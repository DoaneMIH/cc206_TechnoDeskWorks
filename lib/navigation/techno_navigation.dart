import 'package:exercise_4/navigation/Profile/techno_profile.dart';
import 'package:exercise_4/navigation/Notification/techno_notification.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;


  static const List<Widget> _screens = <Widget>[
    Screen1(),
    Screen2(),
    Screen3(),
    NotificationScreen(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          _navIconItem(Icons.menu, 0),
          _navIconItem(Icons.book_outlined, 1),
          _navIconItem(Icons.apps, 2),
          _navIconItem(Icons.notifications_outlined, 3),
          _navIconItem(Icons.person_outline_outlined  , 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _navIconItem(IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [Colors.orange, Colors.deepOrange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [Colors.orange.shade100, const Color.fromARGB(255, 255, 169, 41)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      label: '',
    );
  }
}


class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Home')),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Month')),
      body: const Center(child: Text('Tasks')),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Portfolio')),
      body: const Center(child: Text('Insert Portfolio')),
    );
  }
}

