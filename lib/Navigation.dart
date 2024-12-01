import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:exercise_4/navigation/Notification/techno_notification.dart';
import 'package:exercise_4/navigation/Profile/techno_profile.dart';
import 'package:flutter/material.dart';

class NavigationTechno extends StatefulWidget {
  const NavigationTechno({super.key});

  @override
  State<NavigationTechno> createState() => _NavigationTechnoState();
}

class _NavigationTechnoState extends State<NavigationTechno> {
  
  int _page = 0; // Tracks the current selected page index
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List <Widget> _navigationItems = [
    const Icon(Icons.filter_list),
    const Icon(Icons.book),
    const Icon(Icons.grid_view),
    const Icon(Icons.notifications),
    const Icon(Icons.person),
  ];

   final List<Widget> _pages = [
    //const HomeScreen(),
    //const TaskOrganizer(),
   //const FileInventory(),
   const NotificationScreen(),
    const Profile(),
    //const Profile(),
  ];
  
  Color bgColor = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        height: 70,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: bgColor,
        items: _navigationItems,
        index: _page,
        onTap: (index){
          setState(() {
            _page = index;
            switch(index){
              case 0:
                bgColor = Colors.orange;
                break;
              case 1:
                bgColor = Colors.orange;
                break;
              case 2:
                bgColor = Colors.orange;
                break;
              case 3:
                bgColor = Colors.orange;
                break;
              case 4:
                bgColor = Colors.orange;
                break;
            }
          });
        },
        letIndexChange: (index) => true,
        ),
        body: _pages[_page],
    );
  }
}