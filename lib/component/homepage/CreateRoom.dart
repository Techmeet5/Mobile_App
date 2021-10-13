// ignore_for_file: file_names

import 'package:flutter/material.dart';
import './../../component/Room/RoomPage.dart';

class Room extends StatefulWidget {
  const Room({ Key? key }) : super(key: key);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff022136),
      appBar: AppBar(
        title:Text("Room"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child:Container(
            height: 50,
            width: 100,
            child: Center(child: Text("Room Page"),)
          ),
          onPressed: ()=>{Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RoomPage()))
            }
        ),
        )
    );
  }
}