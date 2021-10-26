// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


class CodeEditor extends StatefulWidget {
  const CodeEditor({Key? key}) : super(key: key);

  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  String res = "";
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://codeeditor-backend.herokuapp.com/ws/code/'),
  );
  final TextEditingController _textcontroller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  bool _isBackPressedOrTouchedOutSide = false,
      _isDropDownOpened = false,
      _isPanDown = false;
  late List<String> _list;
  String _selectedItem = '';

  void initState() {
    _list = ["C++", "Java", "Python"];
    _selectedItem = 'Python';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String lang = "C++";
    return Container(
      color: Colors.grey[700],
      child: SafeArea(
          child: Scaffold(
        body: StreamBuilder(
            stream: _channel.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = jsonDecode(snapshot.data.toString());
              _textcontroller.text = data["code"];
              String output = data["output"] ?? "";
              _selectedItem = data["lang"];
              print(data);
              _textcontroller.selection = TextSelection.fromPosition(
                  TextPosition(offset: _textcontroller.text.length));
              return Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.09,
                    child: Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: AwesomeDropDown(
                                isPanDown: _isPanDown,
                                dropDownList: _list,
                                isBackPressedOrTouchedOutSide:
                                    _isBackPressedOrTouchedOutSide,
                                selectedItem: _selectedItem,
                                onDropDownItemClick: (selectedItem) {
                                  //print(selectedItem);
                                  final Map<String, String> val = {
                                    "code": data["code"],
                                    "lang": selectedItem,
                                  };
                                  _channel.sink.add(jsonEncode(val));
                                  _selectedItem = selectedItem;
                                },
                                dropStateChanged: (isOpened) {
                                  _isDropDownOpened = isOpened;
                                  if (!isOpened) {
                                    _isBackPressedOrTouchedOutSide = false;
                                  }
                                })),
                        Padding(
                            padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * 0.2)),
                        Column(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            ElevatedButton(
                             onPressed:() {
                               print("data");
                               final Map<String, String> val = {
                                "code": data["code"],
                                "lang": "compile",
                              };
                              _channel.sink.add(jsonEncode(val));
                             },
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(3),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.grey[500]),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)))),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: const Center(
                                  child: Text(
                                    "Run",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(5, 5),
                            blurRadius: 10.0,
                            spreadRadius: 2.0),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 0),
                          blurRadius: 0,
                          spreadRadius: 0,
                        )
                      ]),
                      child: TextFormField(
                        minLines: 1,
                        maxLines:
                            null, // allow user to enter 5 line in textfield
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            final Map<String, String> val = {
                              "code": value,
                              "lang": "null"
                            };
                            _channel.sink.add(jsonEncode(val));
                          }
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        autofocus: true,
                        focusNode: _focusNode,
                        keyboardType: TextInputType
                            .multiline, // user keyboard will have a button to move cursor to next line
                        controller: _textcontroller,
                      ),
                      // child: StreamBuilder(
                      //   stream: _channel.stream,
                      //   builder: (context, snapshot){
                      //     if(snapshot.connectionState== ConnectionState.waiting){
                      //       return const Center(child: CircularProgressIndicator(),);
                      //     }
                      //     print(snapshot.data);
                      //     final data=jsonDecode(snapshot.data.toString());
                      //     _textcontroller.text=data["code"];
                      //     _textcontroller.selection = TextSelection.fromPosition(TextPosition(offset: _textcontroller.text.length));
                      //     return TextFormField(
                      //       minLines: 1,
                      //       maxLines: null, // allow user to enter 5 line in textfield
                      //       onChanged: (value){
                      //         if (value.isNotEmpty){
                      //           final Map< String,String> val ={"code" : value ,"lang":"null"};
                      //           _channel.sink.add(jsonEncode(val));
                      //         }
                      //       },
                      //       decoration:const InputDecoration(
                      //         border: InputBorder.none,
                      //       ),
                      //       autofocus: true,
                      //       focusNode: _focusNode,
                      //       keyboardType: TextInputType.multiline, // user keyboard will have a button to move cursor to next line
                      //       controller: _textcontroller,
                      //     );
                      //   }
                      // ),
                    ),
                  )),
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 8)),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width - 16,
                        child: Row(
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 10)),
                            SingleChildScrollView(child: Text(output)),
                            const Padding(padding: EdgeInsets.only(right: 10)),
                          ],
                        ),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(5, 5),
                                blurRadius: 10.0,
                                spreadRadius: 2.0),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0, 0),
                              blurRadius: 0,
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 8)),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                ],
              );
            }),
      )),
    );
  }

  _outputChange() {
    setState(() {
      //inval=_textcontroller.text;
    });
  }
}
