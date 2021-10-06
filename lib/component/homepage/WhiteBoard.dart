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
      appBar:AppBar(
        title:Text("WhiteBoards"),
        centerTitle: true,
      ),
      body: Center(child: Text("Whiteboard"),),
    );
  }
}