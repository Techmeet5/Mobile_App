// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'vidConf.dart';
import 'CodeEditor.dart';
import 'Drawing.dart';
import 'Profiles.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({ Key? key }) : super(key: key);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {

  int _currentIndex = 1;
  final List<Widget> _children = [
    CodeEditor(),
    VidConf(),
    Drawing(),
    Profiles(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.code),
            label: "Code Editor",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera_front),
            label: "Video Confrence",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_color),
            label: "WhiteBoard",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_rounded),
            label: "Profiles",
            backgroundColor: Colors.blue,
          ),
        ],
        ),
    );
  }
}