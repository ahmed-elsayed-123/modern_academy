import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modern_academy/ui/featureslist/model/Course.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  Dialogs dialogs = new Dialogs();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text(
          "COURSES",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 150,
              child: FlatButton(
                color: Colors.cyan[100],
                splashColor: Colors.pinkAccent,
                onPressed: () {
                  dialogs.information(context, "Courses", "1st_");
                },

                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "1St",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text("  Year", style: TextStyle(fontSize: 30))
                      ],
                    ),
                  ),
                ),

                //  ),
              ),
            ),
          ),
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 150,
              child: FlatButton(
                color: Colors.cyan[300],
                splashColor: Colors.pinkAccent,
                onPressed: () {
                  dialogs.information(context, "Courses", "2nd_");
                },

                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "2Nd",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text("  year", style: TextStyle(fontSize: 30))
                      ],
                    ),
                  ),
                ),

                //  ),
              ),
            ),
          ),
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 150,
              child: FlatButton(
                color: Colors.cyan[500],
                splashColor: Colors.pinkAccent,
                onPressed: () {
                  dialogs.information(context, "Courses", "3rd_");
                },

                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "3Rd",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text("  year", style: TextStyle(fontSize: 30))
                      ],
                    ),
                  ),
                ),

                //  ),
              ),
            ),
          ),
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 150,
              child: FlatButton(
                color: Colors.cyan[700],
                splashColor: Colors.pinkAccent,
                onPressed: () {
                  dialogs.information(context, "Courses", "4th_");
                },

                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "4Th",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text("  year", style: TextStyle(fontSize: 30))
                      ],
                    ),
                  ),
                ),

                //  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 9 / 10, size.height);
    var controllPoint = Offset(size.width * 9.5 / 10, size.height);
    // var endPoint = Offset(size.width/2, size.height-20);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, size.width, size.height - 50);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
     
    return true;
  }
}

class Dialogs {
  information(BuildContext context, String title, String courses) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CourseInformation(courses);
        });
  }
}

class CourseInformation extends StatelessWidget {
  final String courses_id;

  const CourseInformation(
    this.courses_id, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('Courses')
          .document(courses_id + "1")
          .collection("courses")
          .snapshots(),
      builder: (context, snapfirstterm) {
        if (snapfirstterm.hasData && snapfirstterm.data != null) {
          return StreamBuilder(
            stream: Firestore.instance
                .collection('Courses')
                .document(courses_id + "2")
                .collection("Courses")
                .snapshots(),
            builder: (context, snapshotsecondterm) {
              if (snapshotsecondterm.hasData &&
                  snapshotsecondterm.data != null) {
                List<String> courses = List<String>();
                 for( var document in snapfirstterm.data.documents) {
                   courses.add(document["Name"]);
                   print("object");
                 }
                 for( var document in snapshotsecondterm.data.documents) {
                   courses.add(document["Name"]);
                   print("object1");

                 }
                
                /* 
                snapfirstterm.data.forEach((k, v) {
                  courses.add(v["Name"]);
                });
                snapshotsecondterm.data.forEach((k, v) {
                  courses.add(v["Name"]);
                });
*/
                return Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(25),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: Center(
                            child: Text("COURSES",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                    color: Colors.cyan))),
                      ),
                      Container(
                        height: 300,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 60.0),
                                child: Text(
                                  courses[index],
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            );
                          },
                          itemCount: courses.length,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 200.0),
                        child: RaisedButton(
                          color: Colors.cyan,
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "OK",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
