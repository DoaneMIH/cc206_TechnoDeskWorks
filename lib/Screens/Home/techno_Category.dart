import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchbyCategory extends StatefulWidget {
  const SearchbyCategory({super.key});

  @override
  State<SearchbyCategory> createState() => _SearchbyCategoryState();
}

class _SearchbyCategoryState extends State<SearchbyCategory> {
  late Future<List<String>> _categoriesFuture;
  final TextEditingController _searchController = TextEditingController();
  List<String> _originalCategories = [];
  List<String> _filteredCategories = [];
  
  @override
  void initState() {
    super.initState();
    _categoriesFuture = fetchJobCategories();
  }

   Future<List<String>> fetchJobCategories() async {
    const url = 'https://jsonfakery.com/jobs';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jobs = json.decode(response.body);

      // Remove duplicates using Set
      _originalCategories = jobs
          .map<String>((job) => job['job_category'] as String)
          .toSet()
          .toList();

      _filteredCategories = List.from(_originalCategories);
      return _originalCategories;
    } else {
      throw Exception('Failed to load job categories');
    }
  }

   void _filterCategories(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCategories = List.from(_originalCategories);
      } else {
        _filteredCategories = _originalCategories
            .where((category) => category.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(255, 226, 121, 1), Colors.white],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(255, 255, 255, 1),
                    Color.fromRGBO(207, 229, 251, 1.0)
                  ]),
            ),
            child: FutureBuilder<List<String>>(
              future: _categoriesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No job categories found.');
                }

                return Column(
                  children: [
                    SizedBox(
                      height: 80,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _searchController,
                                onChanged: _filterCategories,
                                decoration: InputDecoration(
                                  labelText: "Search Projects or Freelancing",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  prefixIcon: const Icon(Icons.search),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Categories",
                        style: TextStyle(fontSize: 20, letterSpacing: 2),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                    ..._buildCategoryList(_filteredCategories),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildCategoryList(List<String> categories) {
    return categories
        .map(
          (category) => Container(
            width: 500,
            height: 130,
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
                    child: Text(
                      category,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    // Define your onTap behavior here
                  },
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                      child: Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(255, 149, 0, 1),
                        ),
                        child: const Center(
                          child: Text(
                            "Browse",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }
