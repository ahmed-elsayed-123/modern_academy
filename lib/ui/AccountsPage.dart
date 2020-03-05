import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountsPage extends StatefulWidget {
  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
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
    return Scaffold(
      backgroundColor: Color(0x2c3e50),
        appBar: AppBar(
          backgroundColor: Color(0x2c3e50),
          title: Text(
            "DOCTOR'S ACCOUNTS",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('Accounts').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null)
              return Container(color:Colors.white,
              child: new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return ListTile(
                    leading: InkWell(
                      child: Hero(
                        tag: document["Name"] + document["Subject"],
                        child: ClipOval(
                          child: Image.network(
                          document["image"],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        )
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return InfoPage(document["image"],
                              heroId: document["Name"] + document["Subject"]);
                        }));
                      },
                    ),
                    onTap: () {
                      if (document["Account"] != null)
                        _launchURL(document["Account"]);
                      else {
                        Toast.show("Account is not provided", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      }
                    
                    },
                    title: Text(
                      document["Name"],
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                    subtitle: Text(document["Subject"],
                        style: TextStyle(fontSize: 20)),
                  );
                }).toList(),
              )
            ,);
              
              else
              Center(
                child: CircularProgressIndicator(),
              );
          },
        ));
  }
}

class InfoPage extends StatelessWidget {
  final String heroId;
  final String imageWhichwillbeShowed;

  const InfoPage(
    this.imageWhichwillbeShowed, {
    this.heroId,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(backgroundColor: Colors.transparent,),
      body: Hero(
        tag: heroId,
        child: Image.network(
          
          imageWhichwillbeShowed,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
