// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'Account.dart';
import 'Activity.dart';
import 'CreateRoom.dart';
import 'Meetings.dart';
import 'WhiteBoard.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 2;
  final List<Widget> _children = const [
    ScheduledMeeting(),
    Room(),
    Activity( ),
    WhiteBoard(),
    Account(),
  ];

   void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: _children[_currentIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     onTap: onTappedBar,
    //     currentIndex: _currentIndex,
    //     backgroundColor: Colors.cyan,
    //     items: const [
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.people_alt_sharp),
    //         backgroundColor: Colors.blue,
    //         label: "Meetings",
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.ring_volume_rounded),
    //         backgroundColor: Colors.blue,
    //         label: "Room",
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.work),
    //         backgroundColor: Colors.blue,
    //         label: "Activity",
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.border_color_rounded),
    //         label: "WhiteBoard",
    //         backgroundColor: Colors.blue,
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.person),
    //         backgroundColor: Colors.blue,
    //         label: "Account",
    //       ),
    //     ],
    //   ),
    // );
      return Scaffold(
      backgroundColor: const Color(0xff022136),
      body: _children[_currentIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey[700],
        selectedIndex: _currentIndex,
        onTabChange: (int index) {
          _currentIndex = index;
          onTappedBar(index);
        },
        // showActiveButtonText: false,
        textStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          navigationBarButtons:const <NavigationBarButton>[
            NavigationBarButton(
              text: 'Meetings',
              icon: Icons.people_alt_sharp,
              //backgroundColor: HexColor("#95FE0D")
              backgroundGradient: LinearGradient(
                colors: <Color>[Colors.green, Colors.yellow],
              ),
            ),
            NavigationBarButton(
              text: 'Room',
              icon: Icons.ring_volume_rounded,
              //backgroundColor: HexColor("#95FE0D")
              backgroundGradient: LinearGradient(
                colors: <Color>[Colors.green, Colors.yellow],
              ),
            ),
            NavigationBarButton(
              text: 'Activity',
              icon: Icons.work,
              //backgroundColor: HexColor("#95FE0D")
              backgroundGradient: LinearGradient(
                colors: <Color>[Colors.green, Colors.yellow],
              ),
            ),
            NavigationBarButton(
              text: 'WhiteBoard',
              icon: Icons.border_color_rounded,
              //backgroundColor: HexColor("#95FE0D")
              backgroundGradient: LinearGradient(
                colors: <Color>[Colors.green, Colors.yellow],
              ),
            ),
            NavigationBarButton(
              text: 'Account',
              icon: Icons.person,
              //backgroundColor: HexColor("#95FE0D")
              backgroundGradient: LinearGradient(
                colors: <Color>[Colors.green, Colors.yellow],
              ),
            )
          ],
      ),
    );
  }
}