import 'package:flutter/material.dart';
import 'package:modern_academy/ui/options/OptionsScreen.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(
        decoration: new BoxDecoration(image: new DecorationImage(image: AssetImage('assets/img/images.jpg'),fit: BoxFit.fill)),
        child: Center(


          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(

                height: 70.0,
                width: 270.0,
                child: FlatButton(
                  color: Colors.cyan,
                  splashColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  // shape: Border.all(width: 3.0, color: Colors.black),

                  padding: EdgeInsets.all(20.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OptionScreen()),
                    );
                  },

                  child: Text(
                    "COMPUTER SCIENCE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              Container(
                height: 70.0,
                width: 270.0,
                child: FlatButton(
                  color: Colors.cyan,
                  splashColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  // shape: Border.all(width: 3.0, color: Colors.black),

                  padding: EdgeInsets.all(20.0),
                  onPressed: () {



                  },

                  child: Text(
                    "ENGINEERING",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              Container(
                height: 70.0,
                width: 270.0,
                child: FlatButton(

                  color: Colors.cyan,
                  splashColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  padding: EdgeInsets.all(20.0),
                  onPressed: () {},
                  child: Text(
                    "BUSINESS",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
