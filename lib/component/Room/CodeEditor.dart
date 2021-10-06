// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CodeEditor extends StatefulWidget {
  const CodeEditor({ Key? key }) : super(key: key);

  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CodeEditor"),
        centerTitle: true,
      ),
      body: Center(child: Text("CodeEditor")),
    );
  }
}