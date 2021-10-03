import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'account.dart';
import 'package:techmeet_app/component/Mainpage/account.dart';

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
        title: const Text("TechMeet"),
        backgroundColor: HexColor("#151348"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const accountpage()));
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              )),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              child: Container(
                child: Column(
                      children: [
                      Align(
                        alignment: const Alignment(-0.5, -1),
                        child: Container(
                          color: HexColor("#151348"),
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width,
                        child:Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                padding: const EdgeInsets.fromLTRB(0, 40, 10, 20),
                                child: Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment(-0.5, -1),
                                      child: Text(
                                        "Simple Text",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: const Text(
                                        "Lorem Ipsum is simply mine dummytext of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.3,
                                padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                                child: const Image(
                                  image: AssetImage('lib/assets/mainpage.png'),
                                ),
                              ),
                            ],
                          ),
                          ),
                      ),
                        Container(
                          height: MediaQuery.of(context).size.height*0.3,
                          width: MediaQuery.of(context).size.width,
                          child: ClipPath(
                            clipper: BackgroundClipper(),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*0.3,
                              color: HexColor("#151348"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
          ],
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path();
    path.lineTo(size.width,0);
    path.lineTo(size.width/2, size.height*0.5);
    return path;  
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
