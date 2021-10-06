import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'account.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("TechMeet"),
        backgroundColor: HexColor("#151348"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountPage()));
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              )),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: HexColor("#151348"),
              border: Border.all(width: 0),
            ),
            child: Stack(
              children: [
                Container(
                  color: HexColor("#151348"),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 9.0),
                            child: Text(
                              'Simple Text',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            width: 180.0,
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              'Lorem Ipsum is simply mine dummytext of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                      child: const Image(
                        image: AssetImage('assets/mainpage.png'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                color: HexColor("#151348"),
              ),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     color: Colors.white,
          //   ),
          // )
        ],
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height * 0.6);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}