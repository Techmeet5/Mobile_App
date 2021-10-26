// ignore_for_file: file_names

import 'dart:convert';
import './userlist.dart';
import './../Room/vidConf.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(
      const MaterialApp(
        home: Room(),
      ),
    );

class Room extends StatefulWidget {
  const Room({Key? key}) : super(key: key);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  final TextEditingController searchcontroller = TextEditingController();
	final roomname=TextEditingController();
  List<User> users = [];
  String? _searchKeyword;
  var data;
	String room="";

  bool _searching = false;

  final _searchController = TextEditingController();
  bool loading = false;

  @override
  void dispose() {
    _searchController.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchcontroller = TextEditingController();
    bool searchlist = false;
    Future<Object> list;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Create Room"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
								Padding(
									padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 14.0,
                  ),
									child: TextField(
										controller: roomname,
										decoration: InputDecoration(
											border:OutlineInputBorder(
												borderRadius: BorderRadius.circular(5),
											),
											hintText: "Room Name",
											suffixIcon: (roomname.text.isNotEmpty)?
												InkWell(
													onTap: (){
														setState(() {
														  room=roomname.text;
														});
													},
													child:const Icon(Icons.done_rounded),
												):null
											
										),
									),
								),
		
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 14.0,
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        print(value);
                        if (value.isNotEmpty) {
                          _searchKeyword = value;
                          _searching = true;
                        } else {
                          _searching = false;
                          _searchKeyword = null;
                        }
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search your todos',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      suffixIcon: _searching
                          ? InkWell(
                              onTap: () {
                                _searchController.clear();
                                setState(() {
                                  _searching = false;
                                  _searchKeyword = null;
                                });
                              },
                              child: const Icon(Icons.clear),
                            )
                          : const Icon(
                              Icons.search,
                              color: Colors.green,
                            ),
                    ),
                  ),
                ),
                if (_searchKeyword != null && _searchKeyword != '')
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Expanded(
                        child: FutureBuilder<List<User?>>(
                            future: getUserdata(_searchKeyword!),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return ListView.builder(
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) {
                                    final user = snapshot.data?[index];
                                    return ListTile(
                                      title: Text(user?.name ?? ""),
                                    );
                                  });
                            })),
                  ),
                Row(
									mainAxisAlignment: MainAxisAlignment.spaceEvenly,
									children:[
										const ElevatedButton(
											onPressed: null, 
											child: Text("Schedule")
										),
										ElevatedButton(
											onPressed: (){
												Navigator.push(context, MaterialPageRoute(
													builder:(context)=>const Room(),
													),
												);
											},
											child:const Text("Start")
										),
									],
								)
              ],
            ),
          ),
        ),
      ),
    );
  }

  getdata(String value) async {
    print(value);
    setState(() {
      loading = true;
      searchcontroller.text = value;
    });
    List<User> listdata = [];
    var url = Uri.parse('https://codeeditor-backend.herokuapp.com/api/list/');
    var response = await http.post(url, body: {
      "username": value,
    });
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body) ?? [];
      for (var element in data) {
        listdata.add(User.fromMap(element));
      }
      setState(() {
        loading = false;
        users = listdata;
        searchcontroller.text = value;
      });
    }
    //print(response.body);
    // setState(() {
    //   data=response.body;
    // });
  }

  Future<List<User?>> getUserdata(String value) async {
    print(value);
    try {
      List<User?> users = [];
      var url = Uri.parse('https://codeeditor-backend.herokuapp.com/api/list/');
      var response = await http.post(url, body: {
        "username": value,
      });

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body) ?? [];
        for (var element in data) {
          users.add(User.fromMap(element));
        }
      }
      return users;
    } catch (error) {
      print('Error getting users ${error.toString()}');
      rethrow;
    }
  }
}
