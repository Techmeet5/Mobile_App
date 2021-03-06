import 'dart:convert';

import 'package:flutter/material.dart';
import './../homepage/Homepage.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController _textcontroller1=TextEditingController();
    TextEditingController _textcontroller2=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: const Color(0xff151348),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child:Container(
            child: Column(
              children: [
                Container(
                    color: const Color(0xff151348),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: const Align(
                      alignment: Alignment(-1, -1),
                      child: Image(
                        image: const AssetImage('assets/login.png'),
                      ),
                    )),
                Stack(
                  children: [
                    Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: ClipPath(
                    clipper: BackgroundClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      color:const Color(0xff151348),
                    ),
                  ),
                ),
                Align(
                  alignment:Alignment(0,-0.1),
                  child: Image(image: AssetImage('assets/login_logo.png')),
                )
                  ],
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            controller:_textcontroller1,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsetsDirectional.all(10),
                              hintText: 'Enter your email',
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          const Padding(padding: EdgeInsetsDirectional.all(10)),
                          TextFormField(
                            controller:_textcontroller2,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsetsDirectional.all(10),
                              hintText: 'Enter your Password',
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 30.0),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                   funct(_textcontroller1,_textcontroller2);
                                  },
                                  child: const Text('Submit'),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }

  void funct(TextEditingController _textcontroller1,TextEditingController _textcontroller2) async {
    var url = Uri.parse('https://codeeditor-backend.herokuapp.com/api/login/');
    var response=await http.post(url,body:{"username":_textcontroller1.text,"password": _textcontroller2.text});
    final data = jsonDecode(response.body.toString());
    print(data);
    if (_formKey.currentState!.validate()){
      print(data["login"]);
      if(data["login"]=="true"){
        print(data);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage()));
      }
    }
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
