// ignore_for_file: file_names

import 'package:flutter/material.dart';

class WhiteBoard extends StatefulWidget {
  const WhiteBoard({ Key? key }) : super(key: key);

  @override
  _WhiteBoardState createState() => _WhiteBoardState();
}

class _WhiteBoardState extends State<WhiteBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff022136),
      appBar:AppBar(
        title:const Text(
          "WhiteBoards",
          style: TextStyle(
            color: Color(0xff95FE0D),
          ),
          ),
        backgroundColor:const Color(0xff022136),
        centerTitle: true,
      ),
      body: const Center(child: Text("Whiteboard"),),
    );
  }
}