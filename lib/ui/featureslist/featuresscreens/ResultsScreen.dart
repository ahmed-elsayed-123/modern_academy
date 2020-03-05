
import 'package:flutter/material.dart';
import 'package:modern_academy/ui/featureslist/featuresscreens/results_screen/firstterm_screen.dart';
import 'package:modern_academy/ui/featureslist/featuresscreens/results_screen/midterm_screen.dart';
import 'package:modern_academy/ui/featureslist/featuresscreens/results_screen/secondterm_screen.dart';

class ResultsScreen extends StatefulWidget {

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3 ,
      child: Scaffold(
       backgroundColor: Colors.black ,
        appBar: AppBar (
          title: Text ('Results') ,
          bottom: TabBar(

            tabs: <Widget>[
              Tab(
                /*child: RaisedButton(
                  onPressed:() {  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => midterm_screen())
                  );
                  },
                ),*/
                text: 'Midterm' ,
              ),


              Tab(

                text: 'Firstterm',
              ),


              Tab(
                text: 'Secondterm',
              ),

            ],
          ) ,
        ) ,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    body: TabBarView(
    children: [
    firstterm_screen(),
    midterm_screen(),
    secondterm_screen(),
    ],
      ) ,




    ),
    );


  }



}









