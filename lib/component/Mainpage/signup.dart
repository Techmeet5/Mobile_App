import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                              if (_formKey.currentState!.validate()) {}
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

        // Stack(
        //   children: [
        //     Container(
        //       child: Column(
        //         children: [
        //           Container(
        //               color: HexColor("#151348"),
        //               height: MediaQuery.of(context).size.height * 0.2,
        //               width: MediaQuery.of(context).size.width,
        //               child: const Align(
        //                 alignment: Alignment(-1, -1),
        //                 child: Image(
        //                   image: const AssetImage('assets/login.png'),
        //                 ),
        //               )),
        //           Container(
        //             height: MediaQuery.of(context).size.height * 0.1,
        //             width: MediaQuery.of(context).size.width,
        //             child: ClipPath(
        //               clipper: BackgroundClipper(),
        //               child: Container(
        //                 width: MediaQuery.of(context).size.width,
        //                 height: MediaQuery.of(context).size.height * 0.1,
        //                 color: HexColor("#151348"),
        //               ),
        //             ),
        //           ),
        //           Center(
        //             child: Container(
        //               width: MediaQuery.of(context).size.width * 0.8,
        //               height: MediaQuery.of(context).size.height * 0.3,
        //               child: Form(
        //                 key: _formKey,
        //                 child: SingleChildScrollView(
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: <Widget>[
        //                       TextFormField(
        //                         decoration: const InputDecoration(
        //                           contentPadding: EdgeInsetsDirectional.all(10),
        //                           hintText: 'Enter your First Name',
        //                         ),
        //                         validator: (String? value) {
        //                           if (value == null || value.isEmpty) {
        //                             return 'Please enter some text';
        //                           }
        //                           return null;
        //                         },
        //                       ),
        //                       const Padding(
        //                           padding: EdgeInsetsDirectional.all(10)),
        //                       TextFormField(
        //                         decoration: const InputDecoration(
        //                           contentPadding: EdgeInsetsDirectional.all(10),
        //                           hintText: 'Enter your Last Name',
        //                         ),
        //                         validator: (String? value) {
        //                           if (value == null || value.isEmpty) {
        //                             return 'Please enter some text';
        //                           }
        //                           return null;
        //                         },
        //                       ),
        //                       const Padding(
        //                           padding: EdgeInsetsDirectional.all(10)),
        //                       TextFormField(
        //                         decoration: const InputDecoration(
        //                           contentPadding: EdgeInsetsDirectional.all(10),
        //                           hintText: 'Enter your Email',
        //                         ),
        //                         validator: (String? value) {
        //                           if (value == null || value.isEmpty) {
        //                             return 'Please enter some text';
        //                           }
        //                           return null;
        //                         },
        //                       ),
        //                       TextFormField(
        //                         decoration: const InputDecoration(
        //                           contentPadding: EdgeInsetsDirectional.all(10),
        //                           hintText: 'Enter your Password',
        //                         ),
        //                         validator: (String? value) {
        //                           if (value == null || value.isEmpty) {
        //                             return 'Please enter some text';
        //                           }
        //                           return null;
        //                         },
        //                       ),
        //                       Padding(
        //                         padding:
        //                             const EdgeInsets.symmetric(vertical: 30.0),
        //                         child: ElevatedButton(
        //                           onPressed: () {
        //                             if (_formKey.currentState!.validate()) {}
        //                           },
        //                           child: const Text('Submit'),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //     )
        //   ],
        // ),
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
