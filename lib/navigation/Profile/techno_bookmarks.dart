import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarksPage> {
  List<dynamic> randomJobs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRandomJobs();
  }

  Future<void> fetchRandomJobs() async {
    final url = Uri.parse('https://jsonfakery.com/jobs');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        setState(() {
          randomJobs = (data..shuffle()).take(5).toList(); // Take 5 random posts
          isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch jobs');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching random jobs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarked Posts'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : randomJobs.isEmpty
              ? const Center(child: Text('No Bookmarked Posts Available'))
              : ListView.builder(
                  itemCount: randomJobs.length,
                  itemBuilder: (context, index) {
                    final job = randomJobs[index];
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
                          Text(
                            job['title'] ?? 'No Title',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
                            job['qualifications'] ?? 'No Qualifications Available',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\$${job['salary_from']} - \$${job['salary_to']}',
                            style: const TextStyle(fontSize: 15),
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
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
