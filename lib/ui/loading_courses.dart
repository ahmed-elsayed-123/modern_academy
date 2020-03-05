import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modern_academy/base/AppConfig.dart';
import 'package:modern_academy/ui/featureslist/model/Course.dart';
import 'package:modern_academy/ui/featureslist/payment/dialog.dart';

class LoadingCourrsesDialogScreen {
  static Future<void> showLoadingDialog(
      BuildContext context, String year) async {
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return _LoadingCoursesDialog(
          year: year,
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Color(0xaa0F98B7),
      transitionDuration: const Duration(milliseconds: 200),
    );
  }
}

class _LoadingCoursesDialog extends StatefulWidget {
  final String year;
  const _LoadingCoursesDialog({
    Key key,
    this.year,
  }) : super(key: key);
  @override
  _LoadingSuspendedDialogState createState() => _LoadingSuspendedDialogState();
}

class _LoadingSuspendedDialogState extends State<_LoadingCoursesDialog> {
  _LoadingSuspendedDialogState();
  @override
  Widget build(BuildContext context) {
    double gpa = AppComfig.userOnlineMap["GPA"];

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance
                .collection("settings")
                .document("semester")
                .snapshots(),
            builder: (context, semestersnapshot) {
              if (semestersnapshot.hasData && semestersnapshot.data != null) {
                if (widget.year == "1" &&
                    semestersnapshot.data["semester"] == "1") {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("1st_1")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 6,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else if (widget.year == "1" &&
                    semestersnapshot.data["semester"] == "2" &&
                    gpa >= 2) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("1st_2")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 6,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else if (widget.year == "1" &&
                    semestersnapshot.data["semester"] == "2" &&
                    gpa < 2) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("1st_2")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 4,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else if (widget.year == "2" &&
                    semestersnapshot.data["semester"] == "1" &&
                    gpa >= 2) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("2nd_1")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 6,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else if (widget.year == "2" &&
                    semestersnapshot.data["semester"] == "1" &&
                    gpa < 2) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("2nd_1")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 4,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else if (widget.year == "2" &&
                    semestersnapshot.data["semester"] == "2" &&
                    gpa >= 2) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("2nd_2")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 6,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else if (widget.year == "2" &&
                    semestersnapshot.data["semester"] == "2" &&
                    gpa < 2) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("2nd_2")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 4,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else if (widget.year == "3" &&
                    semestersnapshot.data["semester"] == "1" &&
                    gpa >= 2) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("3rd_1")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 6,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else if (widget.year == "3" &&
                    semestersnapshot.data["semester"] == "1" &&
                    gpa < 2) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("3rd_1")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 4,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else if (widget.year == "3" &&
                    semestersnapshot.data["semester"] == "2" &&
                    gpa >= 2) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("3rd_2")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 6,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else if (widget.year == "3" &&
                    semestersnapshot.data["semester"] == "2" &&
                    gpa < 2) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("3rd_2")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 4,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                }  else if (widget.year == "4" &&
                    semestersnapshot.data["semester"] == "1" &&
                    gpa >= 2) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("4th_1")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 6,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else if (widget.year == "4" &&
                    semestersnapshot.data["semester"] == "1" &&
                    gpa < 2) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("4th_1")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 4,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else if (widget.year == "4" &&
                    semestersnapshot.data["semester"] == "2" &&
                    gpa >= 2) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("4th_2")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 6,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else if (widget.year == "4" &&
                    semestersnapshot.data["semester"] == "2" &&
                    gpa < 2) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Courses')
                        .document("4th_2")
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<String> _courses = List<String>();
                        for (var doc in snapshot.data.documents)
                          _courses.add(doc["Name"]);
                        myCallback(() {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    _courses,
                                    numberofcourse: 4,
                                  ));
                        });
                        return Container(
                          width: 0.0,
                          height: 0.0,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                }else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  void myCallback(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
