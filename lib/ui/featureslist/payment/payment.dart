import 'package:flutter/material.dart';
import 'package:modern_academy/base/AppConfig.dart';
import 'package:modern_academy/ui/featureslist/model/Course.dart';
import 'package:modern_academy/ui/featureslist/payment/dialog.dart';
import 'package:modern_academy/ui/loading_courses.dart';

class Payment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PaymentState();
  }
}

class _PaymentState extends State<Payment> {
  Map<String, bool> values = {
    'foo': false,
    'bar': false,
  };
  List<bool> years = new List<bool>();
  @override
  void initState() {
    // TODO: implement initState

    years.add(false);
    years.add(false);
    years.add(false);
    years.add(false);
    years[AppComfig.userOnlineMap["year"] - 1] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x2c3e50),
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text("Payments",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)),
          )),
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              color: Colors.cyan,
            ),
            clipper: CustomClipPath(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Visibility(
                    visible: true,
                    child: RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("First year",
                            style:
                                TextStyle(fontSize: 28.0, color: Colors.cyan)),
                      ),
                      onPressed: () async {
                        // TODO update the course based on user case
                        if (years[0])
                          LoadingCourrsesDialogScreen.showLoadingDialog(
                              context, "1");
                        // var selectedList  = await showDialog(
                        //     context: context,
                        //     builder: (BuildContext context) => CustomDialog(
                        //       courses,numberofcourse: 4,
                        //     ));
                        ///  TODO push to online database
                      },
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Second year",
                            style:
                                TextStyle(fontSize: 28.0, color: Colors.cyan)),
                      ),
                      onPressed: () async {
                        if (years[1])
                          LoadingCourrsesDialogScreen.showLoadingDialog(
                              context, "2");
                        //TODO update the course based on user case
                        /* var selectedList  = await showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog(
                            courses
                        ),
                      );*/
                      },
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Third year",
                            style:
                                TextStyle(fontSize: 28.0, color: Colors.cyan)),
                      ),
                      onPressed: () async {
                        if (years[2])
                          LoadingCourrsesDialogScreen.showLoadingDialog(
                              context, "3");
                        //TODO update the course based on user case
                        /*var selectedList  = await  showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog(
                            courses
                        ),
                      );*/
                      },
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Fourth year",
                            style:
                                TextStyle(fontSize: 28.0, color: Colors.cyan)),
                      ),
                      onPressed: () async {
                        if (years[3])
                          LoadingCourrsesDialogScreen.showLoadingDialog(
                              context, "4");
                        //TODO update the course based on user case
                        /* var selectedList  = await showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog(
                            courses
                        ),
                      );*/
                      },
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  //var radius=10.0;
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
