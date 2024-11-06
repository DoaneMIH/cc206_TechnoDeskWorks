import 'package:exercisce_unit4/techno_searchBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
//   int selected = -1;
//   final List <double> _buttonOffSet = [0.0,0.0,0.0,0.0,0.0];

//   final LinearGradient _original = const LinearGradient(
//     colors: [Color.fromRGBO(255, 226, 121, 1), Color.fromRGBO(	255, 175, 63, 1)],
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//   );

//   final LinearGradient _hoverColor = const LinearGradient(
//     colors: [Color.fromRGBO(255, 149, 0,1), Color.fromRGBO(	255, 77, 0, 1)],
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//   );

//  late LinearGradient _originalColor;

//   @override
//   void initState() {
//     super.initState();
//     _originalColor = _original; 
//   }

// void _changeAndmove(int index) {
//   setState(() {
//     if(selected != index){
//       //Here para di sila mag dungan
//       if(selected != -1){
//         _buttonOffSet[selected] = 0.0;
//       }

//       _buttonOffSet[index] = -15.0;
//       _originalColor = _hoverColor;
//       selected = index;
//     } else {
//       _buttonOffSet[index] = 0.0;
//       _originalColor = _original;
//         selected = -1;
//     }
//   });
// }

// List <Widget> _tabscreens = [const HomePage(), const TaskOrganizer(), const TaskInventory(), const NotificationTechno(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,   //no back button
        flexibleSpace: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(255, 226, 121, 1), Colors.white]),
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
                      onPressed: () {}))),
        ]),
      ),
      // bottomNavigationBar:
      // Container(
      //   height: 100,
      //   width: 478,
      //   decoration: const BoxDecoration(
      //     color: Colors.black,
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(50),
      //       topRight: Radius.circular(50)
      //     )
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [

      //       InkWell(
      //         onTap: () {
      //           _changeAndmove(0);
      //           Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage()));
      //         },
              
      //         child: AnimatedContainer(
      //           duration: const Duration(milliseconds: 300),
      //           height: 70,
      //           width: 70,
      //           decoration: BoxDecoration(
      //             gradient: selected == 0 ? _hoverColor : _original, //if selected will change ang color
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           transform: Matrix4.translationValues(0, _buttonOffSet[0], 0),
      //           child:const Icon(Icons.filter_list, size: 30,),
      //         ),
      //       ),

      //       InkWell(
      //         onTap: () {
      //           _changeAndmove(1);
      //           Navigator.push(context, MaterialPageRoute(builder: (context) => const TaskOrganizer()));
      //         },
      //         child: AnimatedContainer(
      //           duration: const Duration(milliseconds: 300),
      //           transform: Matrix4.translationValues(0, _buttonOffSet[1], 0),
      //           height: 70,
      //           width: 70,
      //           decoration: BoxDecoration(
      //             gradient:  selected == 1 ? _hoverColor : _original,
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           child:const Icon(Icons.book, size: 30,),
      //         ),
      //       ),

      //       InkWell(
      //         onTap: () {
      //           _changeAndmove(2);
      //           Navigator.push(context, MaterialPageRoute(builder: (context) => const TaskInventory()));

      //         } ,
      //         child: AnimatedContainer(
      //           duration: const Duration(milliseconds: 300),
      //           transform: Matrix4.translationValues(0, _buttonOffSet[2], 0),
      //           height: 70,
      //           width: 70,
      //           decoration: BoxDecoration(
      //             gradient:selected == 2 ? _hoverColor : _original,
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           child:const Icon(Icons.grid_view, size: 30,),
      //         ),
      //       ),


      //       InkWell(
      //         onTap: () {
      //         _changeAndmove(3);
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationTechno()));
      //         },
      //         child: AnimatedContainer(
      //           duration: const Duration(milliseconds: 300),
      //           transform: Matrix4.translationValues(0, _buttonOffSet[3], 0),
      //           height: 70,
      //           width: 70,
      //           decoration: BoxDecoration(
      //             gradient: selected == 3 ? _hoverColor : _original,
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           child:const Icon(Icons.notifications, size: 30,),
      //         ),
      //       ),


      //       InkWell(
      //         onTap: () {
      //           _changeAndmove(4);
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
      //         },
      //         child: AnimatedContainer(
      //           duration: const Duration(milliseconds: 300),
      //           transform: Matrix4.translationValues(0, _buttonOffSet[4], 0),
      //           height: 70,
      //           width: 70,
      //           decoration: BoxDecoration(
      //             gradient: selected == 4 ? _hoverColor : _original, 
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           child:const Icon(Icons.person, size: 30,),
      //         ),
      //       ),

      //     ]),
      // ),
      body: ListView(children: [
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
                  child: TextField(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => Searchbar())));
                    },
                    decoration: InputDecoration(
                        labelText: "Search Projects or Freelancer",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.search)),
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
      ]),
    );
  }
}