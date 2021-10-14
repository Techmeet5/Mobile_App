// ignore_for_file: file_names

import 'package:flutter/material.dart';


class Activity extends StatefulWidget {
  const Activity({ Key? key }) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff022136),
      appBar: AppBar(
        title: const Text("Activity"),
        centerTitle: true,
      ),
      body: const Center(child: Text("Activity"),),
    );
  }
}