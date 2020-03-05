import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:modern_academy/ui/featureslist/model/Course.dart';

class CustomDialog extends StatefulWidget {
  List<String> courses, allCourses = List<String>();

  int numberofcourse;
  Map<String, bool> values = new HashMap();

  CustomDialog(
    this.courses, {
    this.numberofcourse = 6,
    Key key,
  }) : super(key: key) {
    for (var course in courses) {
      values[course] = false;
      allCourses.add(course);
    }
  }

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            child: new ListView.builder(
              itemBuilder: (context, index) {
                return new CheckboxListTile(
                  title: new Text(widget.courses[index],
                      style: TextStyle(fontSize: 20)),
                  value: widget.values[widget.courses[index]],
                  onChanged: (bool value) {
                    setState(() {
                      widget.values[widget.courses[index]] = value;
                      widget.numberofcourse = value
                          ? widget.numberofcourse - 1
                          : widget.numberofcourse + 1;
                      print(widget.numberofcourse);

                      if (widget.numberofcourse == 0) {
                        print("asd");
                        widget.courses = removeUncheckedCourses(widget.courses);
                      } else {
                        widget.courses = [];
                        for (var course in widget.allCourses) {
                          widget.courses.add(course);
                        }
                      }
                    });
                  },
                );
              },
              itemCount: widget.courses.length,
            ),
            width: 500,
            height: 500,
            color: Colors.white,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              child: Text("ok", style: TextStyle(fontSize: 25.0)),
              onPressed: () {
                List<String> selectedCourses = List();

                widget.values.forEach((k, v) {
                  if (v == true) selectedCourses.add(k);
                });
                Navigator.of(context).pop<List<String>>(selectedCourses);
              },
            ),
          ),
        ],
      ),
    );
  }

  List<String> removeUncheckedCourses(List<String> courses) {
    for (var index = 0; index < courses.length; index++) {
      if (widget.values[courses[index]] == false) {
        print("removed");
        courses.remove(courses[index]);
        index--;
      }
    }
    return courses;
  }
}
  /*
  List<Course> fun (List<Course>List){
    for(var item in list ){
      if(Item is not selected){
        list.remove(item);
      }

    }
    return list;
  }
  */
