import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class firstterm_screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return firstterm_screenstate();
  }
}
class firstterm_screenstate extends State<firstterm_screen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        body: PageView(
    children: <Widget>[
    Container(
    decoration: BoxDecoration(
     image: new DecorationImage(
       fit:BoxFit.fill ,
         image: AssetImage(
             'assets/img/ess.jpg'
         )
     )
    ) ,

    ),
    Container(decoration: BoxDecoration(
        image: new DecorationImage(
            fit:BoxFit.fill ,
            image: AssetImage(
                'assets/img/ess1.jpg'
            )
        )
    ) ,

    ),
    Container(
      decoration: BoxDecoration(
          image: new DecorationImage(
              fit:BoxFit.fill ,
              image: AssetImage(
                  'assets/img/ess2.jpg'
              )
          )
      ) ,
    ),
      PageView.builder(
        itemBuilder: (context, position) {
          return Container(
            color: position % 2 == 0 ? Colors.pink : Colors.cyan,
          );
        },
      )

    ],
      )
    );
  }
}









