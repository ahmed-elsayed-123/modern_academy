import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_academy/ui/vote/votes.dart';

class VoteScreenStateful extends StatefulWidget {
  @override
  _VoteScreenStatefulState createState() => _VoteScreenStatefulState();
}

class _VoteScreenStatefulState extends State<VoteScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x2c3e50),
        appBar: new AppBar(
          backgroundColor: Color(0x2c3e50),
          title: new Text('Votes'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("votes").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VoteDialog(vote: document,)),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      color: Colors.cyan,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 25.0),
                        child: Row(children: <Widget>[
                          Icon(Icons.beenhere),
                          Text(
                            document["question"],
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style:
                                TextStyle(fontSize: 19.0, color: Colors.black),
                          ),
                        ]),
                      ),
                    ),
                  ),
                );
              }).toList());
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
