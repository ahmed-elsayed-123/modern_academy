import 'package:flutter/material.dart';
import 'package:modern_academy/base/Admin.dart';
import 'package:modern_academy/base/AppConfig.dart';
import 'package:modern_academy/base/Student.dart';
import 'package:modern_academy/ui/login/LoginScreen.dart';

class OptionScreen extends StatefulWidget {
  @override
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: Container(
          width: double.infinity,
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('assets/img/modernacademy.jpg'),
                  fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildChoiceButton("Student", () {
                //spcify user type
                AppComfig.shared.setCurrentUser(new Student());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreenStateful()),
                );
              } ),
              buildChoiceButton("Graduates", () {
                AppComfig.shared.setCurrentUser(new Admin());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreenStateful()),
                );
              })
            ],
          ),
        ));
  }

  Widget buildChoiceButton(String Name, Function function) {
    return Container(
      height: 80.0,
      width: 320.0,
      child: FlatButton(
        onPressed: () {
          function();
        },
        color: Colors.cyan[600],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
        child: Text(
          Name,
          style: TextStyle(color: Colors.white
          , fontSize:20 , fontWeight: FontWeight.bold  ),
        ),
      ),
    );
  }
}
