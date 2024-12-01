import 'dart:convert';

import 'package:exercisce_unit4/Screens/Home/techno_searchBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isMessagePanelVisible = false;  //check if na click
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
    final url = Uri.parse('https://jsonfakery.com/jobs'); // Replace with your API URL
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

  //Toggle the inbox
    void toggleMessagePanel() {
    setState(() {
      _isMessagePanelVisible = !_isMessagePanelVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(207, 229, 251, 1.0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(255, 226, 121, 1), Colors.white]),
            ),
          ),
          if(!_isMessagePanelVisible)
          Positioned(
              bottom: 1,
              left: 300,
              right: 20,
              child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: IconButton(
                      icon: const Icon(Icons.mail, color: Colors.white),
                      onPressed: toggleMessagePanel))),
        ]),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color.fromRGBO(255, 255, 255, 1),
                          Color.fromRGBO(207, 229, 251, 1.0)
                  ])),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: GestureDetector(
                            onDoubleTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: ((context) =>const Searchbar())));
              
                            },
                            child: TextField(
                              onChanged: filterJobs,
                              decoration: InputDecoration(
                                  labelText: "Search Projects or Freelancer",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  prefixIcon: const Icon(Icons.search)),
                                  onTap: (){
                                    // Navigator.push(context, MaterialPageRoute(builder: ((context) =>const SearchBar())));
                                  },
                            ),
                          ),
                        ),
                        const Text(
                          "Featured Jobs",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Browse jobs that match your experience to a client's hiring preferences. "
                              "Ordered by most relevant",
                              textAlign: TextAlign.center,
                        )),
                      ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: filteredJobs.length,
                            itemBuilder: (context, index) {
                              final job = filteredJobs[index];
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  // height: 200,
                                  // margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                    decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 3,
                                        offset: Offset(0, 2),
                                        spreadRadius: 1
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(10, 10, 10, 2),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(job['title'] ?? 'No Title', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                            Text('\$${job['salary_from']} - \$${job['salary_to']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(job['company'] ?? 'No Company', style: const TextStyle(color:  Color.fromRGBO(
                                                        255, 149, 0, 1),)),
                                      ),
                                      const Divider(
                                      color: Colors.black,
                                      height: 3,
                                      thickness: 1.2,
                                    ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(13, 15, 11, 0),
                                        child: SizedBox(
                                          height: 80,
                                          child: Text(
                                            job['qualifications'] ?? 'No qualifications Available',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(fontSize: 14, 
                                            fontFamily: "Calibre"),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Wrap(
                                        spacing: 2,
                                        children: (job['tags'] as List<dynamic>? ?? [])
                                            .map((tag) => Chip(
                                                  label: Text(tag, style: const TextStyle(fontSize: 12)),
                                                  backgroundColor: Colors.blue[50],
                                                ))
                                            .toList(),
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 9, 10, 0),
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                            "#graphicdesigner #design",
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                          const Spacer(flex: 1),
                                            IconButton(
                                              icon: Icon(
                                                bookmarkedJobs[index] == true ? Icons.bookmark : Icons.bookmark_border,
                                                color: bookmarkedJobs[index] == true ? Colors.orange : Colors.grey,
                                              ),
                                              onPressed: () => toggleBookmark(index),
                                            ),
                                            SizedBox(
                                              height: 30,
                                              width: 150,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Color.fromRGBO(
                                                      255, 149, 0, 1),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Applied for ${job['title']}')));
                                                },
                                                child: const Text('Apply', style: TextStyle(fontSize: 12),),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Message Panel
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            right: _isMessagePanelVisible ? 0 : -MediaQuery.of(context).size.width,
            top: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_rounded, color: Color.fromARGB(255, 89, 145, 249)),
                      onPressed: toggleMessagePanel,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: IconButton(
                            icon: const Icon(Icons.mail, color: Colors.white),
                            onPressed: toggleMessagePanel,
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: const Text(
                            'Inbox',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Spacer(),
                        Text("0 unread message")
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),

                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(16),
                      children: [
                        
                        ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.orange,child: Icon(Icons.person, size: 30,color: Colors.white,)),
                          title: Text('Wendy'),
                          subtitle: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(207, 229, 251, 1.0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.orange,child: Icon(Icons.person, size: 30,color: Colors.white,)),
                          title: Text('Seugi'),
                          subtitle: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(207, 229, 251, 1.0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.orange,child: Icon(Icons.person, size: 30,color: Colors.white,)),
                          title: Text('Irene'),
                          subtitle: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(207, 229, 251, 1.0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.orange,child: Icon(Icons.person, size: 30,color: Colors.white,)),
                          title: Text('Yeri'),
                          subtitle: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(207, 229, 251, 1.0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.orange,child: Icon(Icons.person, size: 30,color: Colors.white,)),
                          title: Text('Joy'),
                          subtitle: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(207, 229, 251, 1.0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                            ),
                          ),
                        ),
                      ],
                    ),
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