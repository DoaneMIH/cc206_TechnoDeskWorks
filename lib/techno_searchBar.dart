import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(255, 226, 121, 1), Colors.white]),
          ),
        ),
      ),
      body: Center(
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
          child: Column(
            children: [
              SizedBox(
                  height: 80,
                  child: Row(children: <Widget>[
                    SizedBox(
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Search Projects or Freelancing",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: const Icon((Icons.search))),
                      ),
                    )),
                  ])),
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Categories",
                      style: TextStyle(fontSize: 20, letterSpacing: 2))),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),

            ],
          ),
        ),
      ),
    );
  }
}
