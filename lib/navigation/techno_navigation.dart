import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:exercise_4/navigation/Notification/techno_notification.dart';
import 'package:exercise_4/navigation/Profile/techno_profile.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

Map<int,bool> bookmarkedJobs ={};

  // List of screens for each tab
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
          _navIconItem(Icons.person_outline_outlined, 4),
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

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<dynamic> jobs = [];
  List<dynamic> filteredJobs = [];
  bool isLoading = true;
  String searchQuery = '';
  Map<int, bool> bookmarkedJobs = {}; // Track bookmarked jobs using a Map

  @override
  void initState() {
    super.initState();
    fetchJobs();
  }

  Future<void> fetchJobs() async {
    final url = Uri.parse('https://jsonfakery.com/jobs');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          jobs = data;
          filteredJobs = data;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load jobs');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching jobs: $e');
    }
  }

  void filterJobs(String query) {
    setState(() {
      searchQuery = query;
      filteredJobs = jobs
          .where((job) =>
              job['title'].toLowerCase().contains(query.toLowerCase()) ||
              job['company'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void toggleBookmark(int index) {
    setState(() {
      bookmarkedJobs[index] = !(bookmarkedJobs[index] ?? false); // Toggle bookmark status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        onChanged: filterJobs,
                        decoration: InputDecoration(
                          hintText: 'Search Projects or Freelancers',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          prefixIcon: const Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Featured Jobs",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Browse jobs that match your experience to a client's hiring preferences. "
                          "Ordered by most relevant.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredJobs.length,
                    itemBuilder: (context, index) {
                      final job = filteredJobs[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  job['title'] ?? 'No Title',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '\$${job['salary_from']} - \$${job['salary_to']}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              job['company'] ?? 'No Company',
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              job['qualifications'] ?? 'No qualifications Available',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14, color: Colors.black87),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 5,
                              children: (job['tags'] as List<dynamic>? ?? [])
                                  .map((tag) => Chip(
                                        label: Text(tag, style: const TextStyle(fontSize: 12)),
                                        backgroundColor: Colors.blue[50],
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    bookmarkedJobs[index] == true
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                    color: bookmarkedJobs[index] == true ? Colors.orange : Colors.grey,
                                  ),
                                  onPressed: () => toggleBookmark(index),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Applied for ${job['title']}')),
                                    );
                                  },
                                  child: const Text('Apply'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
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
