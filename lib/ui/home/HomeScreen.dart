import 'dart:ui' as prefix0;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_academy/base/AppConfig.dart';
import 'package:modern_academy/ui/AccountsPage.dart';
import 'package:modern_academy/ui/Courses.dart';
import 'package:modern_academy/ui/LocationScreen.dart';
import 'package:modern_academy/ui/aboutus.dart';
import 'package:modern_academy/ui/callus/CallUsScreen.dart';
import 'package:modern_academy/ui/featureslist/Features.dart';
import 'package:modern_academy/ui/login/LoginScreen.dart';
import 'package:modern_academy/ui/news/NewsScreen.dart';
import 'package:modern_academy/ui/profile/ProfileScreen.dart';
import 'package:modern_academy/ui/vote/VoteScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenStateful extends StatefulWidget {
  @override
  _HomeScreenStatefulState createState() => _HomeScreenStatefulState();
}

class _HomeScreenStatefulState extends State<HomeScreenStateful> {
  Future<String> getUserId() async {
    var sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.getString("student_id");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x2c3e50),
      appBar: new AppBar(
        backgroundColor: Color(0x2c3e50),
        title: new Text('Dashbourd'),
      ),
      drawer: FutureBuilder<String>(
        future: getUserId(),
        builder: (context, sharedData) {
          if (sharedData.hasData && sharedData.data != null) {
            return StreamBuilder<DocumentSnapshot>(
              stream: Firestore.instance
                  .collection('users')
                  .document(sharedData.data)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  AppComfig.userOnlineMap = snapshot.data;
                  return Drawer(
                      child: Container(
                    color: Colors.cyan,
                    child: ListView(
                      children: <Widget>[
                        FlatButton(
                          color: Colors.cyan,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProfileScreenStateful()),
                            );
                          },
                          child: Container(
                            height: 100,
                            child: DrawerHeader(
                              child: Row(
                                children: <Widget>[
                                  ClipOval(
                                    child: Image.network(
                                      snapshot.data["image"],
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  Text(snapshot.data["name"])
                                ],
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Dashbourd',
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                          leading: Icon(
                            Icons.home,
                            color: Colors.black,
                          ),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          },
                        ),
                        ListTile(
                          title: Text(
                            'News',
                            style: TextStyle(fontSize: 25.0),
                          ),
                          leading: Icon(
                            Icons.comment,
                            color: Colors.black,
                          ),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsScreenStateful()),
                            );
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Locations',
                            style: TextStyle(fontSize: 25.0),
                          ),
                          leading: Icon(
                            Icons.location_on,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LocationScreen()),
                            );

                            // Update the state of the app.
                            // ...
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Call Us',
                            style: TextStyle(fontSize: 25.0),
                          ),
                          leading: Icon(
                            Icons.call,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CallUsScreen()),
                            );
                            // Update the state of the app.
                            // ...
                          },
                        ),
                        ListTile(
                          title: Text('About Us',
                              style: TextStyle(
                                fontSize: 25.0,
                              )),
                          leading: Icon(
                            Icons.info_outline,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Aboutus()),
                            );

                            // Update the state of the app.
                            // ...
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Log out',
                            style: TextStyle(fontSize: 25.0),
                          ),
                          leading: Icon(
                            Icons.keyboard_return,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LoginScreenStateful()),
                                (Route<dynamic> route) => false);
                            // Update the state of the app.
                            // ...
                          },
                        ),
                      ],
                    ),
                  ));
                } else {
                  Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      ),
      body: FutureBuilder<String>(
        future: getUserId(),
        builder: (context, sharedData) {
          if (sharedData.hasData && sharedData.data != null) {
            return StreamBuilder<DocumentSnapshot>(
              stream: Firestore.instance
                  .collection('users')
                  .document(sharedData.data)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  AppComfig.userOnlineMap = snapshot.data;
                 return Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  child: Container(
                                      child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.beenhere,
                                        color: Colors.cyan,
                                        semanticLabel: "Vote",
                                        size: 70.0,
                                      ),
                                      Text(
                                        "Vote",
                                        style: TextStyle(
                                            color: Colors.cyan, fontSize: 25.0),
                                      )
                                    ],
                                  )),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VoteScreenStateful()),
                                    );
                                  },
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                ),
                                GestureDetector(
                                  child: Container(
                                      child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.collections_bookmark,
                                        color: Colors.cyan,
                                        semanticLabel: "Courses",
                                        size: 70.0,
                                      ),
                                      Text(
                                        "Courses",
                                        style: TextStyle(
                                            color: Colors.cyan, fontSize: 25.0),
                                      )
                                    ],
                                  )),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Courses()),
                                    );
                                  },
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  child: Container(
                                      child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.account_box,
                                        color: Colors.cyan,
                                        semanticLabel: "Accounts",
                                        size: 70.0,
                                      ),
                                      Text(
                                        "Accounts",
                                        style: TextStyle(
                                            color: Colors.cyan, fontSize: 25.0),
                                      )
                                    ],
                                  )),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AccountsPage()),
                                    );
                                  },
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                ),
                                GestureDetector(
                                  child: Container(
                                      child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.featured_play_list,
                                        color: Colors.cyan,
                                        semanticLabel: "Features",
                                        size: 70.0,
                                      ),
                                      Text(
                                        "Features",
                                        style: TextStyle(
                                            color: Colors.cyan, fontSize: 25.0),
                                      )
                                    ],
                                  )),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Features()),
                                    );
                                  },
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Container(
                                child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.chat,
                                  color: Colors.cyan,
                                  semanticLabel: "Chat",
                                  size: 70.0,
                                ),
                                Text(
                                  "Chat",
                                  style: TextStyle(
                                      color: Colors.cyan, fontSize: 25.0),
                                )
                              ],
                            )),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Features()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      ),
    );
  }
}
