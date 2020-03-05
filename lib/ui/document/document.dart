import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_academy/ui/Document/dailog.dart';

class DocumentScreen extends StatefulWidget{
  _DocumentScreenStatefulState createState() => _DocumentScreenStatefulState();
}
class _DocumentScreenStatefulState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0x2c3e50),
      appBar: AppBar(
        backgroundColor: Color(0x2c3e50),
          title: new Text('Document',style: TextStyle())),
      body: Container(
        color: Color(0x2c3e50),
       // decoration: new BoxDecoration(image: new DecorationImage(image: AssetImage('assets/img/modernacademy.jpg'),fit: BoxFit.fill)),
        child: Column(
        children: <Widget>[

          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Container(
                        decoration: BoxDecoration(borderRadius:  BorderRadius.circular(12.0)),
                          height: 100,
                          width: 400,
                          padding: EdgeInsets.all(20.0),
                          child: RaisedButton(onPressed: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>CustomDialog( [" في حالة التقدم لادارة التجنيد او ادارة الجوزات  يقوم الطالب بتقديم الاستمارة 2 جند+ 6 جند او 7 جند(ذكور : يقدم الطالب بتأجيل التجنيد في مكتب التجنيد في الاكاديمية )"]

                                ));
                          },
                               color: Colors.cyan,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0)),
                              child: Text("شهاده القيد", style: TextStyle(fontSize: 30.0,color: Colors.black),))

                      ), Container(
                        decoration: BoxDecoration(borderRadius:  BorderRadius.circular(12.0)),
                          height: 100,
                          width: 400,
                          padding: EdgeInsets.all(20.0),
                          child: RaisedButton(onPressed: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => CustomDialog( [" 1- الاوليه للفرقه الرابعه  ", " توجد دورة شتويه في نصف العام و 3 دورات اخر العام بناء علي ما تحدده ادارة التجنيد  ", "2- يتم دفع رسوم الدورة قبلها بشهر تقريبا"]

                                ));
                          },
                              color: Colors.cyan,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0)),
                              child: Text("التربيه العسكريه", style: TextStyle(fontSize: 30.0,color: Colors.black),))

                      ), Container(
                        decoration: BoxDecoration(borderRadius:  BorderRadius.circular(12.0)),
                          height: 100,
                          width: 400,
                          padding: EdgeInsets.all(20.0),
                          child: RaisedButton(onPressed: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => CustomDialog( ["  بيسلم استمارة البطاقه في شئون الطلاب بدون رسوم والاستلام بعد اسبوع"]

                                ));
                          },
                              color: Colors.cyan,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0)),
                              child: Text("البطاقه", style: TextStyle(fontSize: 30.0,color: Colors.black),))

                      ), Container(
                        decoration: BoxDecoration(borderRadius:  BorderRadius.circular(12.0)),
                          height: 100,
                          width: 400,
                          padding: EdgeInsets.all(20.0),
                          child: RaisedButton(onPressed: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => CustomDialog( [" 1- سداد المصاريف ", " 2- استمارة المترو + 2 صورة ", " # الاستلام بعد اسبوع"]

                                ));
                          },
                              color: Colors.cyan,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0)),
                              child: Text("اشتراك المترو", style: TextStyle(fontSize: 30.0,color: Colors.black),))

                      ), Container(
                        decoration: BoxDecoration(borderRadius:  BorderRadius.circular(12.0)),
                          height: 100,
                          width: 400,
                          padding: EdgeInsets.all(20.0),
                          child: RaisedButton(onPressed: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => CustomDialog( [" يبداء في شهر 8 وينتهي في شهر 10 ", " التحويل من داخل الكلية: بيان حاله + بيان تقديرات + صورة شهاده الثانويه العامه ", " في حاله التحويل لنفس التخصص : بيان حالة فقط ","لتحويل تخصص مناظر : استخراج بيان حاله + بيان تقديرات + محتوي علمي "]

                                ));
                          },
                              color: Colors.cyan,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0)),
                              child: Text("تحويل من الجامعه", style: TextStyle(fontSize: 30.0,color: Colors.black),))

                      ),
                    ]
                ),
              ),

              ),
            ),
        ],
        ),
      ),

    );
  }
}