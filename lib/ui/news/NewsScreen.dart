import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsScreenStateful extends StatefulWidget {
  @override
  _NewsScreenStatefulState createState() => _NewsScreenStatefulState();
}

class _NewsScreenStatefulState extends State<NewsScreenStateful> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color(0x2c3e50),
        appBar: new AppBar(
          backgroundColor: Color(0x2c3e50),
          title: Text("News"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('news').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          color: Colors.white,
                          height: 100,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: <Widget>[
                                Image.network(
                                  document["image"],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Column(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                            Text(
                                            document["date"],
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          Text(
                                            document["title"],
                                            style: TextStyle(fontSize: 30.0),
                                          ),
                                          Text(
                                            document["details"],
                                            style: TextStyle(fontSize: 12.0),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ]))));
                }).toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
