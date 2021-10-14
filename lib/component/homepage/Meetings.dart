// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ScheduledMeeting extends StatefulWidget {
  const ScheduledMeeting({ Key? key }) : super(key: key);

  @override
  _ScheduledMeetingState createState() => _ScheduledMeetingState();
}

class _ScheduledMeetingState extends State<ScheduledMeeting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff022136),
      appBar: AppBar(
        title: const Text("Meeting"),
        centerTitle: true,
      ),
      body: const Center(child: Text("meetings"),),
    );
  }
}