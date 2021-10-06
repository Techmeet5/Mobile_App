import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import './../homepage/Homepage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: HexColor("#151348"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child:Container(
            child: Column(
              children: [
                Container(
                    color: HexColor("#151348"),
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
                      color: HexColor("#151348"),
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
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const HomePage()));
                                    }
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
