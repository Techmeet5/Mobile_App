import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController _textcontroller1 = TextEditingController();
    final TextEditingController _textcontroller2 = TextEditingController();
    final TextEditingController _textcontroller3 = TextEditingController();
    final TextEditingController _textcontroller4 = TextEditingController();
    final TextEditingController _textcontroller5 = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text("SignUp"),
          backgroundColor:const Color(0xff151348),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color(0xff151348),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: const Align(
                  alignment: Alignment(-1, -1),
                  child: Image(
                    image: AssetImage('assets/login.png'),
                  ),
                ),
              ),
              Stack(
                  children: [
                    SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: ClipPath(
                    clipper: BackgroundClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      color: const Color(0xff151348),
                    ),
                  ),
                ),
                const Align(
                  alignment:Alignment(0,0),
                  child: Image(image: AssetImage('assets/login_logo.png')),
                )
                  ],
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _textcontroller1,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsetsDirectional.all(10),
                            hintText: 'Enter your First Name',
                          ),
                          
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _textcontroller2,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsetsDirectional.all(10),
                            hintText: 'Enter your Last Name',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          controller: _textcontroller3,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsetsDirectional.all(10),
                            hintText: 'Enter your UserName',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          controller: _textcontroller4,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsetsDirectional.all(10),
                            hintText: 'Enter your Email',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          controller: _textcontroller5,
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
                        const SizedBox(height: 25.0),
                        SizedBox(
                          width: 160.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(letterSpacing: 1.2),
                                ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                funct(_textcontroller1.text,_textcontroller2.text,_textcontroller3.text,_textcontroller4.text,_textcontroller5.text);
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      );
  }
  
  void funct(String textcontroller1,String textcontroller2,String textcontroller3,String textcontroller4,String textcontroller5,) async {
    var url = Uri.parse('https://codeeditor-backend.herokuapp.com/api/add/');
    var response=await http.post(url,body:{"username":textcontroller1,"password":textcontroller2,"first_name":textcontroller3,"email":textcontroller4,"last_name":textcontroller5});
    final data = jsonDecode(response.body.toString());
    print(data);
    if (_formKey.currentState!.validate()){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Login()));
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
