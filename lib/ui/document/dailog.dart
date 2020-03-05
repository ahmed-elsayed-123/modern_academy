import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final List<String> documents;

  const CustomDialog(this.documents , {Key key, }) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState(documents);
}

class _CustomDialogState extends State<CustomDialog> {
  final List<String> documents;

  _CustomDialogState(this.documents);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(25),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 500,
                   color: Colors.white,
                  child: Center(
                    child: Text(
                      documents[index],
                      style: TextStyle(fontSize: 25.0),

                    ),

                  ),


                );
              },
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top:200.0),
                  child: RaisedButton(
                    child: Text("OK",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    onPressed: ()=> Navigator.pop(context),
                    color: Colors.cyan,

                  ),
                ))
          ],
        ),
      ),
    );
  }
}
