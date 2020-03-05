import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_academy/ui/featureslist/featuresscreens/schedulescreens/FinalexamScreen.dart';
import 'package:modern_academy/ui/featureslist/featuresscreens/schedulescreens/FirsttermScreen.dart';
import 'package:modern_academy/ui/featureslist/featuresscreens/schedulescreens/MidtermScreen.dart';
import 'package:modern_academy/ui/featureslist/featuresscreens/schedulescreens/SecondtermScreen.dart';

class scheduleScreen extends StatefulWidget {
  @override
  _scheduleScreenState createState() => _scheduleScreenState();
}

class _scheduleScreenState extends State<scheduleScreen>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2, // Added
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            title: Text('Schedule'),
            bottom: new TabBar(tabs: [
              Tab(
                text: "Schedule ",
              ),
              Tab(

                text: "Timeplan " ,
              ),
            ]),
          ),

          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: TabBarView(
            children: [
              Schedule(),
              TimePlan(),
            ],
          ),
        ),
      ),
    );
  }
}

class TimePlan extends StatelessWidget {
  final String text;

  const TimePlan({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87  ,

    );
  }
}

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  int _selectedIndex = 0;

      _ScheduleState();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: Colors.black ,

      tabBuilder: (BuildContext context, int i ) {
        if( i ==0 ){
          return MidtermScreen() ;

        }
        else if( i ==1 ){
          return FirsttermScreen() ;
        }
        else if( i ==2 ){
          return SecondermScreen();
        }
        return FinalexamScreen();
      },
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:
               Icon(Icons.book),

            title: Text('Midtermexam',style: TextStyle(
              fontSize: 15
            )  ,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_1),
            title: Text('Firstterm' ,style: TextStyle(
                fontSize: 15
            )  ,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_2),
            title: Text('Secondterm',style: TextStyle(
                fontSize: 15
            )  ,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Finalexam',style: TextStyle(
                fontSize: 15
            )  ,),
          ),

        ],
      ),
    );
  }
}
