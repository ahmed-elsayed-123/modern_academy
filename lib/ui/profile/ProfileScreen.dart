import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_academy/base/AppConfig.dart';

class ProfileScreenStateful extends StatefulWidget {
  @override
  _ProfileScreenStatefulState createState() => _ProfileScreenStatefulState();
}

class _ProfileScreenStatefulState extends State<ProfileScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x2c3e50),
        appBar: new AppBar(
          backgroundColor: Color(0x2c3e50),
          title: new Text('Profile'),
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance
                .collection('users')
                .document(AppComfig.userOnlineMap.documentID)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null)
                return Stack(children: <Widget>[
                  Container(
                    child: ClipPath(
                      clipper: SimpleClipper(),
                      child: Container(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [Colors.cyanAccent, Colors.cyan],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: [0.6, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          height: 300,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16.0),
                    constraints: BoxConstraints(maxHeight: 200),
                    child: Row(
                      children: <Widget>[
                        ClipOval(
                          child: Image.network(
                            snapshot.data["image"],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 80.0, left: 15.0),
                          child: Column(
                            children: <Widget>[
                              Text(snapshot.data["name"],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold)),
                              Text(snapshot.data["id"].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 250.0),
                    child: Text(
                      "Student Info.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 300, left: 16),
                    child: ListView(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 10,
                              height: 10,
                              color: Colors.red,
                            ),
                            Text(
                              "  Name : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                            Text(
                              snapshot.data["name"],
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 10,
                              height: 10,
                              color: Colors.green,
                            ),
                            Text(
                              "  Email : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                            Text(
                              snapshot.data["email"],
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 10,
                              height: 10,
                              color: Colors.amber,
                            ),
                            Text(
                              "  Mobile : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                            Text(
                              snapshot.data["phone"].toString(),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                       Row(
                          children: <Widget>[
                            Container(
                              width: 10,
                              height: 10,
                              color: Colors.pink,
                            ),
                            Text(
                              "  National ID : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                            Text(
                              // TODO there is no called "National ID" in your database 
                              snapshot.data["national id"],
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 10,
                              height: 10,
                              color: Colors.teal,
                            ),
                            Text(
                              "  Gender : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                            Text(
                              snapshot.data["gender"],
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 10,
                              height: 10,
                              color: Colors.orange,
                            ),
                            Text(
                              "  BirthDate : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                            Text(
                             snapshot.data["birthday"],
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 10,
                              height: 10,
                              color: Colors.purpleAccent,
                            ),
                            Text(
                              "  Address : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                            Text(
                               snapshot.data["address"],
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ]);
              else
                return Center(
                  child: CircularProgressIndicator(),
                );
            }));
  }
}

class SimpleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    // path start with (0.0, 0.0) point
    path.lineTo(0.0, size.height - 100);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
