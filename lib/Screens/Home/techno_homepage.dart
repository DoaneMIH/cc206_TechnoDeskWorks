// import 'package:flutter/material.dart';

// class Homepage extends StatelessWidget {
//   const Homepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         flexibleSpace: Stack(children: [
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Color.fromRGBO(255, 226, 121, 1), Colors.white]),
//             ),
//           ),
//           Positioned(
//               bottom: 1,
//               left: 300,
//               right: 20,
//               child: CircleAvatar(
//                   backgroundColor: Colors.orange,
//                   child: IconButton(
//                       icon: const Icon(Icons.mail, color: Colors.white),
//                       onPressed: () {}))),
//         ]),
//       ),
//       body: ListView(children: [
//         SingleChildScrollView(
//           child: Container(
//             decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                   Color.fromRGBO(255, 255, 255, 1),
//                   Color.fromRGBO(207, 229, 251, 1.0)
//                 ])),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         labelText: "Search Projects or Freelancer",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                         prefixIcon: const Icon(Icons.search)),
//                         onTap: (){
//                           Navigator.push(context, MaterialPageRoute(builder: ((context) =>const SearchBar())));
//                         },
//                   ),
//                 ),
//                 const Text(
//                   "Featured Jobs",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                       "Browse jobs that match your experience to a client's hiring preferences. "
//                       "Ordered by most relevant",
//                       textAlign: TextAlign.center,
//                     )),
//                 e: 20),
//                                 )
//                               ],
//                             ),
//                           ),
//                  Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Container(
//                       height: 200,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 3,
//                               blurStyle: BlurStyle.normal,
//                               spreadRadius: 1)
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.fromLTRB(10, 10, 10, 2),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   "Graphic Designer",
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 Spacer(flex: 5),
//                                 Text(
//                                   "₱500/hr",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20),
//                                 )
//                               ],
//                             ),
//                           ),
//                           const Divider(
//                             color: Colors.black,
//                             height: 3,
//                             thickness: 1.2,
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.fromLTRB(13, 15, 11, 0),
//                             child: SizedBox(
//                               height: 80,
//                               child: Text(
//                                 "We are looking for a skilled Graphic Designer to join our team. As a Graphic "
//                                 "Designer, you will be responsible for creating concepts that communicate ideas "
//                                 "to inspire, inform, and captivate our audience. You should have a keen eye "
//                                 "for details and a creative mindset",
//                                 style: TextStyle(
//                                     fontSize: 10, fontFamily: "Calibre"),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                             child: SizedBox(
//                               height: 50,
//                               child: Row(
//                                 children: [
//                                   const Text(
//                                     "#graphicdesigner #design",
//                                     style: TextStyle(
//                                       fontSize: 10,
//                                     ),
//                                   ),
//                                   const Spacer(flex: 1),
//                                   const Icon(Icons.bookmark_border,
//                                       color: Colors.blue),
//                                   InkWell(
//                                     onTap: () {},
//                                     child: Container(
//                                       height: 30,
//                                       width: 100,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20),
//                                         color: const Color.fromRGBO(
//                                             255, 149, 0, 1),
//                                       ),
//                                       child: const Center(
//                                         child: Text(
//                                           "Apply",
//                                           style: TextStyle(fontSize: 12),
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )),
//                 Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Container(
//                       height: 200,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 3,
//                               blurStyle: BlurStyle.normal,
//                               spreadRadius: 1)
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.fromLTRB(10, 10, 10, 2),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   "Graphic Designer",
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 Spacer(flex: 5),
//                                 Text(
//                                   "₱500/hr",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSiz
//                           const Divider(
//                             color: Colors.black,
//                             height: 3,
//                             thickness: 1.2,
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.fromLTRB(13, 15, 11, 0),
//                             child: SizedBox(
//                               height: 80,
//                               child: Text(
//                                 "We are looking for a skilled Graphic Designer to join our team. As a Graphic "
//                                 "Designer, you will be responsible for creating concepts that communicate ideas "
//                                 "to inspire, inform, and captivate our audience. You should have a keen eye "
//                                 "for details and a creative mindset",
//                                 style: TextStyle(
//                                     fontSize: 10, fontFamily: "Calibre"),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                             child: SizedBox(
//                               height: 50,
//                               child: Row(
//                                 children: [
//                                   const Text(
//                                     "#graphicdesigner #design",
//                                     style: TextStyle(
//                                       fontSize: 10,
//                                     ),
//                                   ),
//                                   const Spacer(flex: 1),
//                                   const Icon(Icons.bookmark_border,
//                                       color: Colors.blue),
//                                   InkWell(
//                                     onTap: () {},
//                                     child: Container(
//                                       height: 30,
//                                       width: 100,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20),
//                                         color: const Color.fromRGBO(
//                                             255, 149, 0, 1),
//                                       ),
//                                       child: const Center(
//                                         child: Text(
//                                           "Apply",
//                                           style: TextStyle(fontSize: 12),
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )),
//                 Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Container(
//                       height: 200,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 3,
//                               blurStyle: BlurStyle.normal,
//                               spreadRadius: 1)
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.fromLTRB(10, 10, 10, 2),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   "Graphic Designer",
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 Spacer(flex: 5),
//                                 Text(
//                                   "₱500/hr",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20),
//                                 )
//                               ],
//                             ),
//                           ),
//                           const Divider(
//                             color: Colors.black,
//                             height: 3,
//                             thickness: 1.2,
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.fromLTRB(13, 15, 11, 0),
//                             child: SizedBox(
//                               height: 80,
//                               child: Text(
//                                 "We are looking for a skilled Graphic Designer to join our team. As a Graphic "
//                                 "Designer, you will be responsible for creating concepts that communicate ideas "
//                                 "to inspire, inform, and captivate our audience. You should have a keen eye "
//                                 "for details and a creative mindset",
//                                 style: TextStyle(
//                                     fontSize: 10, fontFamily: "Calibre"),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                             child: SizedBox(
//                               height: 50,
//                               child: Row(
//                                 children: [
//                                   const Text(
//                                     "#graphicdesigner #design",
//                                     style: TextStyle(
//                                       fontSize: 10,
//                                     ),
//                                   ),
//                                   const Spacer(flex: 1),
//                                   const Icon(Icons.bookmark_border,
//                                       color: Colors.blue),
//                                   InkWell(
//                                     onTap: () {},
//                                     child: Container(
//                                       height: 30,
//                                       width: 100,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20),
//                                         color: const Color.fromRGBO(
//                                             255, 149, 0, 1),
//                                       ),
//                                       child: const Center(
//                                         child: Text(
//                                           "Apply",
//                                           style: TextStyle(fontSize: 12),
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )),
//                 Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Container(
//                       height: 200,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 3,
//                               blurStyle: BlurStyle.normal,
//                               spreadRadius: 1)
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.fromLTRB(10, 10, 10, 2),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   "Graphic Designer",
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 Spacer(flex: 5),
//                                 Text(
//                                   "₱500/hr",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20),
//                                 )
//                               ],
//                             ),
//                           ),
//                           const Divider(
//                             color: Colors.black,
//                             height: 3,
//                             thickness: 1.2,
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.fromLTRB(13, 15, 11, 0),
//                             child: SizedBox(
//                               height: 80,
//                               child: Text(
//                                 "We are looking for a skilled Graphic Designer to join our team. As a Graphic "
//                                 "Designer, you will be responsible for creating concepts that communicate ideas "
//                                 "to inspire, inform, and captivate our audience. You should have a keen eye "
//                                 "for details and a creative mindset",
//                                 style: TextStyle(
//                                     fontSize: 10, fontFamily: "Calibre"),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                             child: SizedBox(
//                               height: 50,
//                               child: Row(
//                                 children: [
//                                   const Text(
//                                     "#graphicdesigner #design",
//                                     style: TextStyle(
//                                       fontSize: 10,
//                                     ),
//                                   ),
//                                   const Spacer(flex: 1),
//                                   const Icon(Icons.bookmark_border,
//                                       color: Colors.blue),
//                                   InkWell(
//                                     onTap: () {},
//                                     child: Container(
//                                       height: 30,
//                                       width: 100,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20),
//                                         color: const Color.fromRGBO(
//                                             255, 149, 0, 1),
//                                       ),
//                                       child: const Center(
//                                         child: Text(
//                                           "Apply",
//                                           style: TextStyle(fontSize: 12),
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isMessagePanelVisible = false;

  void toggleMessagePanel() {
    setState(() {
      _isMessagePanelVisible = !_isMessagePanelVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(255, 226, 121, 1), Colors.white],
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              left: 300,
              right: 20,
              child: CircleAvatar(
                backgroundColor: Colors.orange,
                child: IconButton(
                  icon: const Icon(Icons.mail, color: Colors.white),
                  onPressed: toggleMessagePanel,
                ),
              ),
            ),
          ],
        ),
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
                        Color.fromRGBO(207, 229, 251, 1.0),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Search Projects or Freelancer",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: const Icon(Icons.search),
                          ),
                        ),
                      ),
                      const Text(
                        "Featured Jobs",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Browse jobs that match your experience to a client's hiring preferences. Ordered by most relevant",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 3,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 1)
                        ],
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 2),
                            child: Row(
                              children: [
                                Text(
                                  "Graphic Designer",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Spacer(flex: 5),
                                Text(
                                  "₱500/hr",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                            height: 3,
                            thickness: 1.2,
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(13, 15, 11, 0),
                            child: SizedBox(
                              height: 80,
                              child: Text(
                                "We are looking for a skilled Graphic Designer to join our team. As a Graphic "
                                "Designer, you will be responsible for creating concepts that communicate ideas "
                                "to inspire, inform, and captivate our audience. You should have a keen eye "
                                "for details and a creative mindset",
                                style: TextStyle(
                                    fontSize: 10, fontFamily: "Calibre"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: SizedBox(
                              height: 50,
                              child: Row(
                                children: [
                                  const Text(
                                    "#graphicdesigner #design",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  const Spacer(flex: 1),
                                  const Icon(Icons.bookmark_border,
                                      color: Colors.blue),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color.fromRGBO(
                                            255, 149, 0, 1),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Apply",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
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
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Inbox',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: toggleMessagePanel,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(16),
                      children: [
                        
                        ListTile(
                          leading: Icon(Icons.person, size: 30,),
                          title: Text('Wendy'),
                          subtitle: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                        ),
                        ListTile(
                          leading: Icon(Icons.person, size: 30,),
                          title: Text('Seugi'),
                          subtitle: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                        ),
                        ListTile(
                          leading: Icon(Icons.person, size: 30,),
                          title: Text('Irene'),
                          subtitle: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                        ),
                        ListTile(
                          leading: Icon(Icons.person, size: 30,),
                          title: Text('Yeri'),
                          subtitle: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                        ),
                        ListTile(
                          leading: Icon(Icons.person, size: 30,),
                          title: Text('Joy'),
                          subtitle: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
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

