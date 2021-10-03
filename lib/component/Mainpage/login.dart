import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: HexColor("#151348"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  color:HexColor("#151348"),
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width,
                  child:const Align(
                    alignment: Alignment(-1, -1),
                    child: Image(
                    image: const AssetImage('lib/assets/login.png'),
                  ),
                  )
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.1,
                  width: MediaQuery.of(context).size.width,
                  child: ClipPath(
                    clipper: BackgroundClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.1,
                      color: HexColor("#151348"),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.3,
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
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Center(
                          child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
                          },
                          child: const Text('Submit'),
                        ),
                        )
                      ),
                    ],
                  ),
                ),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(padding: EdgeInsets.all(100)),
              Center(
              child: Align(
                alignment: Alignment(0, 1),
                child: Image(image: AssetImage('lib/assets/login_logo.png')),
              )
              )
            ],
          )
        ],
      )
        ),
    );
  }
}
class BackgroundClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path();
    path.lineTo(size.width,0);
    path.lineTo(0, size.height);
    return path;  
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
