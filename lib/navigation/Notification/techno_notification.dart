import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 214, 148),
                    Color.fromARGB(255, 255, 222, 192)
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            title: const Text(
              'Notification',
              style: TextStyle(
                //color: Color.fromRGBO(57, 105, 144, 1), 
                //fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Recent'),
                Tab(text: 'Important'),
              ],
              indicator: BoxDecoration(
                color: Color.fromARGB(255, 252, 181, 75), 
              ),
              indicatorSize: TabBarIndicatorSize.tab, 
              indicatorPadding: EdgeInsets.symmetric(horizontal: 0), 
              labelColor: Colors.white, 
              unselectedLabelColor: Colors.black, 
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color.fromARGB(255, 91, 158, 252),
                        child: const Icon(Icons.attach_money, color: Colors.white),
                      ),
                      title: const Text('Jane Doe'),
                      subtitle: const Text('sent you a payment'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        print('Tapped on payment');
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color.fromARGB(255, 91, 158, 252),
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      title: const Text('Jane Doe'),
                      subtitle: const Text('replied to your request'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        print('Tapped on reply');
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color.fromARGB(255, 91, 158, 252),
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      title: const Text('Jane Doe'),
                      subtitle: const Text('bookmarked your post'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        print('Tapped on bookmark');
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'A few days ago',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color.fromARGB(255, 91, 158, 252),
                        child: const Icon(Icons.admin_panel_settings, color: Colors.white),
                      ),
                      title: const Text('Latest Update is Available'),
                      onTap: () {
                        print('Tapped on latest update');
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color.fromARGB(255, 91, 158, 252),
                        child: const Icon(Icons.auto_graph, color: Colors.white),
                      ),
                      title: const Text('Your Statistics this month'),
                      onTap: () {
                        print('Tapped on statistics');
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color.fromARGB(255, 91, 158, 252),
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      title: const Text('Jane Doe'),
                      subtitle: const Text('viewed your portfolio'),
                      onTap: () {
                        print('Tapped on portfolio view');
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color.fromARGB(255, 91, 158, 252),
                        child: const Icon(Icons.work, color: Colors.white),
                      ),
                      title: const Text('See latest jobs'),
                      onTap: () {
                        print('Tapped on latest jobs');
                      },
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.warning, color: Colors.red),
                      title: const Text('Account update notice'),
                      subtitle: const Text('Action required immediately'),
                      onTap: () {
                        print('Tapped on account update notice');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.security, color: Colors.red),
                      title: const Text('Security alert'),
                      subtitle: const Text('Unusual login detected'),
                      onTap: () {
                        print('Tapped on security alert');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
