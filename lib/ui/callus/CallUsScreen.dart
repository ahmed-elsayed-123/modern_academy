import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallUsScreen extends StatefulWidget {
  _CallUsScreenStatefulState createState() => _CallUsScreenStatefulState();
}

class _CallUsScreenStatefulState extends State<CallUsScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0x2c3e50),
      appBar: AppBar(
        backgroundColor: Color(0x2c3e50),
        title: new Text('Call Us',
            style: TextStyle(color: Colors.cyan, fontSize: 20)),
      ),
      body: ClipPath(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 550,
          color: Colors.cyan,
          child: Container(
            height: 100,

            child: Column(

              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                    children: <Widget>[
                      ClipOval(
                          child: Container(
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.call,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ))),
                      RaisedButton(
                        onPressed: (){},

                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            "0227029850",
                            style: TextStyle(fontSize: 30,color: Colors.cyan),
                          ),
                        ),

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),

                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                    children: <Widget>[
                      ClipOval(
                          child: Container(
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.call,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ))),
                      RaisedButton(
                        onPressed: (){},

                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            "0227036231",
                            style: TextStyle(fontSize: 30,color: Colors.cyan),
                          ),
                        ),

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),

                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                    children: <Widget>[
                      ClipOval(
                          child: Container(
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.call,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ))),
                      RaisedButton(
                        onPressed: (){},

                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            "01099918624",
                            style: TextStyle(fontSize: 30,color: Colors.cyan),
                          ),
                        ),

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),

                      ),
                    ]),
              ),


            ],),
          ),
        ),
        clipper: CustomClipPath(),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
