import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  Searchbar({super.key});

  final List <String> _title = [
    "Accounting and Consulting",
    "Admin Support",
    "Customer Service",
    "Data Science and Analysis",
    "Design and Creative"
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(255, 226, 121, 1), Colors.white]),
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
            child:  Column(
              children: [
                SizedBox(
                    height: 80,
                    child: Row(children: <Widget>[
                      SizedBox(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            }, icon: const Icon(Icons.arrow_back)),
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

              Container(
                height: 140,
                width: 490,
                color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(_title[0], 
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left),
                    ),
                  ),
                const Spacer(flex: 8),
                InkWell(
                  onTap: (){},
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding:const EdgeInsets.fromLTRB(0, 1, 20, 10),
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(255, 149, 0, 1),
                        ),
                        child:const Center(
                          child: Text("Browse", style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                    ),
                  ),
                ),
                ],
              ),
              ),

              Container(
                height: 140,
                width: 490,
                color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(_title[1], 
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left),
                    ),
                  ),
                const Spacer(flex: 8),
                InkWell(
                  onTap: (){},
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding:const EdgeInsets.fromLTRB(0, 1, 20, 10),
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(255, 149, 0, 1),
                        ),
                        child:const Center(
                          child: Text("Browse", style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                    ),
                  ),
                ),
                ],
              ),
              ),

              Container(
                height: 140,
                width: 490,
                color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(_title[2], 
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left),
                    ),
                  ),
                const Spacer(flex: 8),
                InkWell(
                  onTap: (){},
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding:const EdgeInsets.fromLTRB(0, 1, 20, 10),
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(255, 149, 0, 1),
                        ),
                        child:const Center(
                          child: Text("Browse", style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                    ),
                  ),
                ),
                ],
              ),
              ),

              Container(
                height: 140,
                width: 490,
                color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(_title[3], 
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left),
                    ),
                  ),
                const Spacer(flex: 8),
                InkWell(
                  onTap: (){},
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding:const EdgeInsets.fromLTRB(0, 1, 20, 10),
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(255, 149, 0, 1),
                        ),
                        child:const Center(
                          child: Text("Browse", style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                    ),
                  ),
                ),
                ],
              ),
              ),

              Container(
                height: 140,
                width: 490,
                color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(_title[4], 
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left),
                    ),
                  ),
                const Spacer(flex: 8),
                InkWell(
                  onTap: (){},
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding:const EdgeInsets.fromLTRB(0, 1, 20, 10),
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(255, 149, 0, 1),
                        ),
                        child:const Center(
                          child: Text("Browse", style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                    ),
                  ),
                ),
                ],
              ),
              )
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
