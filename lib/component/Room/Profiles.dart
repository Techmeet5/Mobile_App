// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Profiles extends StatefulWidget {
  const Profiles({ Key? key }) : super(key: key);

  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profiles"),
        centerTitle: true,
      ),
      body: Center(child: Text("Drawing"),),
    );
  }
}