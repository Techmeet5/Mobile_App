import 'package:flutter/material.dart';
import 'account.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    Scaffold page1() {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity(0.7),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.lightGreen[300],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(5, 5),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      const Text(
                        "Welcome To Techmeet",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Center(
                        child: Container(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 20, 20, 10),
                          child: const Text(
                            "Techmeet is a virtual platform for technical interview and have many features that help you in your interview.",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 20, 20, 10),
                          child: const Text(
                            "We provide features from cut-edge technology like Video-Confrence , Collaborative Whiteboard ,Collaborative Code-Editor",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 20, 20, 10),
                          child: const Text(
                            "Slide down for brief introduction or direct login using this button ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 40)),
                      GestureDetector(
                        onTap: ()=>  Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => const AccountPage())),
                        child: Center(
                          child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.lightGreen[400],
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(5, 5),
                              )
                            ],
                          ),
                          child:const Center(child:Text("Login")),
                        ),
                        )
                      )
                    ],
                  ),
                ),
              ),
        ),
    );
  }

    return PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: [
        page1(),
        page1(),
        page1(),
        page1(),
      ],
    );

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         title: const Text("TechMeet"),
//         backgroundColor:const Color(0xff151348),
//         centerTitle: true,
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const AccountPage()));
//               },
//               icon: const Icon(
//                 Icons.person,
//                 color: Colors.white,
//               )),
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color:const Color(0xff151348),
//               border: Border.all(width: 0),
//             ),
//             child: Stack(
//               children: [
//                 Container(
//                   color: const Color(0xff151348),
//                   height: MediaQuery.of(context).size.height * 0.3,
//                   width: MediaQuery.of(context).size.width,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 9.0),
//                             child: Text(
//                               'Simple Text',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 180.0,
//                             padding: const EdgeInsets.all(10),
//                             child: const Text(
//                               'Lorem Ipsum is simply mine dummytext of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       height: MediaQuery.of(context).size.height * 0.3,
//                       padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
//                       child: const Image(
//                         image: AssetImage('assets/mainpage.png'),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.3,
//             width: MediaQuery.of(context).size.width,
//             child: ClipPath(
//               clipper: BackgroundClipper(),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 0.3,
//                 color: const Color(0xff151348),
//               ),
//             ),
//           ),
//           // Expanded(
//           //   child: Container(
//           //     color: Colors.white,
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }

// class BackgroundClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width / 2, size.height * 0.6);
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
  }
}
