import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class accountpage extends StatefulWidget {
  const accountpage({ Key? key }) : super(key: key);

  @override
  _accountpageState createState() => _accountpageState();
}

class _accountpageState extends State<accountpage> {

  int _currentIndex=0;
  List<Widget> _children=[
    login(),
    signup(),
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: "Login",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_1),
            label: "SignUp",
          ),
        ],
      ),
    );
  }
}