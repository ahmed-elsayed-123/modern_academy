import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class vote extends StatefulWidget {
  @override
  _voteState createState() => _voteState();
}

class _voteState extends State<vote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        "y shabab 7aflt hamkii wla tamora ?",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      CheckboxListTile(
                        title: new Text(" Firdst chpocaasdas ",
                            style: TextStyle(fontSize: 20)),
                        value: true,
                        onChanged: (bool value) {},
                      ),
                      new LinearPercentIndicator(
                        lineHeight: 14.0,
                        percent: 0.5,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                ),
              )
              /*,new ListView.builder(
                itemExtent: 80,
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
                            title: new Text(" Firdst chpocaasdas ",
                                style: TextStyle(fontSize: 20)),
                            value: true,
                            onChanged: (bool value) {},
                          ),
                          new LinearPercentIndicator(
                            lineHeight: 14.0,
                            percent: 0.5,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 4,
              )*/
            ],
          ),
        ));
  }
}

