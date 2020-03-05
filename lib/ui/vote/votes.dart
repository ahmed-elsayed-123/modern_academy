import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class VoteDialog extends StatefulWidget {
  final DocumentSnapshot vote;

  int numberofcourse;

  List<bool> bools = new List<bool>();

  VoteDialog({Key key, this.vote}) : super(key: key) {
    for (var item in vote["choices"]) {
      bools.add(false);
    }
  }
  @override
  _VoteDialogState createState() => _VoteDialogState();
}

class _VoteDialogState extends State<VoteDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x2c3e50),
        body: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 15),
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Text(
                      widget.vote["question"],
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.vote["choices"].length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            CheckboxListTile(
                              title: new Text(
                                  widget.vote["choices"][index]["choice"],
                                  style: TextStyle(fontSize: 20)),
                              value: widget.bools[index],
                              onChanged: (bool value) {
                                setState(() {
                                  widget.bools[index] = !widget.bools[index];
                                });
                              },
                            ),
                            new LinearPercentIndicator(
                              lineHeight: 14.0,
                              percent: widget.vote["choices"][index]
                                      ["numbersOfUsers"] /
                                  widget.vote["allUsers"],
                              backgroundColor: Colors.grey,
                              progressColor: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 90.0),
              child: Container(
                width: 200,
                height: 50,
                child: RaisedButton(
                  onPressed: () async {
                    List<Map<String, dynamic>> maps = List<Map<String, dynamic>>();
                    for (var i = 0; i < widget.bools.length; i++) {
                      if (widget.bools[i]) {
                        maps.add({
                          "choice": widget.vote["choices"][i]["choice"],
                          "numbersOfUsers":
                              widget.vote["choices"][i]["numbersOfUsers"] + 1
                        });
                      } else {
                        maps.add({
                          "choice": widget.vote["choices"][i]["choice"],
                          "numbersOfUsers": widget.vote["choices"][i]
                              ["numbersOfUsers"]
                        });
                      }
                    }

                    await Firestore.instance
                        .collection("votes")
                        .document(widget.vote.documentID)
                        .updateData({
                      "allUsers": widget.vote["allUsers"] + 1,
                      "choices": maps
                    });
                    Navigator.pop(context);
                  },
                  color: Colors.cyan,
                  child: Text(
                    "Vote",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ));
  }
}
