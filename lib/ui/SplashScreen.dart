import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_academy/main.dart';
import 'package:modern_academy/ui/landing/LandingPage.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void InitState() {
    super.initState();
    const duration = Duration(seconds: 5);

    // startTimer();
    // timer.
    //Timer(Duration(seconds: 5,()=> LandingPage), handleTimeout);
  }

  @override
  void didChangeDependencies() {
    startTimer();
  }

  Timer _timer;
  int _start = 10;
  void startTimer() {
    const oneSec = const Duration(seconds: 4);
    _timer = new Timer(oneSec, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    });
  }

  void handleTimeout() {
    // callback function
    print("handleTimeout");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            //  decoration: BoxDecoration (color: Colors.redAccent),
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: AssetImage('assets/img/modernacademy.jpg'),
                    fit: BoxFit.fill)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 70,
                        child: Icon(
                          Icons.account_balance,
                          color: Colors.blueAccent,
                          size: 70,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "MODERN ACADEMY",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //  CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                        "welcome",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: LinearProgressIndicator(),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}







