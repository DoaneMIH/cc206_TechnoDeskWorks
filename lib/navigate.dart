import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:exercisce_unit4/techno_home.dart';
import 'package:exercisce_unit4/techno_notification.dart';
import 'package:exercisce_unit4/techno_profile.dart';
import 'package:exercisce_unit4/techno_taskInventory.dart';
import 'package:exercisce_unit4/techno_taskOrganizer.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigation = GlobalKey();

final List<Widget> _pages = [
    const HomePage(),
    const TaskOrganizer(),
    const TaskInventory(),
    const NotificationTechno(),
    const Profile(),
    // const Searchbar()
  ];


final List <Widget> _navigationItem = [
 const Icon(Icons.filter_list),
 const Icon(Icons.book),
 const Icon(Icons.grid_view),
 const Icon(Icons.notifications),
 const Icon(Icons.person),
];

Color bgColor = Colors.amberAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigation,
        height: 70,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: bgColor,
        items: _navigationItem, 
        index: _page,
        onTap: (index) {
          setState(() {
            _page = index;
            switch(index){
              case 0:
              bgColor = Colors.amberAccent;
              break;
              case 1:
              bgColor = Colors.blue;
              break;
              case 2:
              bgColor = Colors.cyan;
              break;
              case 3:
              bgColor = Colors.deepOrange;
              break;
              case 4:
              bgColor = Colors.greenAccent;
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