import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "About us",
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.w900),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(

                children: <Widget>[
                  Text(
                      " * The Modern Academy for Engineering and Technology was founded in Nov. 2000 following the approval of the Ministry of Higher Education (decree No. 2003 dated 25/10/2000). ",style: TextStyle( fontSize: 22, fontWeight: FontWeight.w900,fontStyle: FontStyle.italic), ),
                  Text(" * Students are graduated in four engineering specializations  namely ",style: TextStyle( fontSize: 22, fontWeight: FontWeight.w700),),
                    Text ( "1- Computer Engineering and Information Technology.",style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),),
                    Text ("2- Electronics Engineering and Communication Technology. ",style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),),
                    Text (" 3- Manufacturing Engineering and Production Technology ",style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),),
                    Text ("4- Architectural Engineering and Building Technology.",style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),),
                    Text(" * Accordingly, the academy organization includes the following three educational departments :",style: TextStyle( fontSize: 24, fontWeight: FontWeight.w900,fontStyle: FontStyle.italic),),
                    Text("1- The Basic Science Department.",style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),),
                    Text("2- Computer Eng. & Information Technology Dept.",style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),),
                    Text("3- Electronic Eng. & Communication Technology Dept.",style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),),
                    Text("4- Manufacturing Eng. &Production Technology Dept.",style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),),
                    Text("5- Architectural Eng. & Building Technology Dept.",style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),),
                  Text("In the early stages of the academy establishment, huge efforts were made to recruit a distinguished group of full-time professors, characterized by high scientific background and long academic experience. In addition, a highly qualified management staff headed by the dean was appointed." ,style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),),

                    Text( " The architecture design of all buildings and the interior installations, facilities and furniture were carefully made to meet all the education process requirements. Elegance, proper luxuries and central air-conditioning added to the quality of the learning process.",style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),),

                    Text(" The courses taught include modern topics, properly selected to meet current market requirements and mostly supported by laboratory and experimental work.",style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),),

                    Text ( " In the opening academic year 2000/2001, only 80 students enrolled. In the following year 2001/2002, this number jumped to 1080 students. Ever since, the academy accepts more than 1200 freshmen each year. This reflects the high reputation deservedly earned by the newly-born academy and the great trust in its capabilities",style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),),





                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
