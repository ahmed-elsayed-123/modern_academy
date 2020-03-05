import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Urllauncher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UrllauncherState();
  }
}

class _UrllauncherState extends State<Urllauncher> {


  void _launchURL(String url) async {
    // url = 'https://www.facebook.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch url';
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: SimpleClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: new LinearGradient(
                    colors: [Colors.cyan, Colors.cyan],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.6, 1.0],
                    tileMode: TileMode.clamp),
              ),
              height: 450,
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RaisedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("First year",style: TextStyle(fontSize: 25.0,color: Colors.cyan)),
                        ),
                        onPressed: () {_launchURL("https://www.facebook.com/groups/546881102517485/"); },
                        color: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RaisedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Second year",style: TextStyle(fontSize: 25.0,color: Colors.cyan)),
                        ),
                        onPressed: () { _launchURL("https://www.facebook.com/groups/263616444259304/");},
                        color: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RaisedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Third year",style: TextStyle(fontSize: 25.0,color: Colors.cyan)),
                        ),
                        onPressed: () {  _launchURL("https://www.facebook.com/groups/134015940571190/") ; },
                        color: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RaisedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Fourth year",style: TextStyle(fontSize: 25.0,color: Colors.cyan) ),
                        ),
                        onPressed: () {_launchURL("https://www.facebook.com/groups/134015940571190/");},
                        color: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),


      appBar: AppBar(
        title: Text("Links for groups ",style: TextStyle(fontSize: 30,color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
      ),

    );
  }
}
class SimpleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    // path start with (0.0, 0.0) point
    path.lineTo(0.0, size.height - 100);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
