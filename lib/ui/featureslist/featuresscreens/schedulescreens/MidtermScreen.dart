import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';


class MidtermScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MidtermScreenstate();
  }
}
class MidtermScreenstate extends State<MidtermScreen>{
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;
    Future<File> getFileFromUrl(String url) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/Mustafa Gamal abbas.pdf");

      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
          future: getFileFromUrl(
              "https://firebasestorage.googleapis.com/v0/b/modern-academy-bbc48.appspot.com/o/tech.pdf?alt=media&token=fa43970f-7a01-40e9-b28d-0c3afd08d213"),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null)
              return Stack(
                children: <Widget>[
                  PDFView(
                    filePath: snapshot.data.path,
                    autoSpacing: true,
                    enableSwipe: true,
                    pageSnap: true,
                    swipeHorizontal: false,
                    nightMode: false,
                    onError: (e) {
                      print(e);
                    },
                    onRender: (_pages) {
                      setState(() {
                        _totalPages = _pages;

                      });
                    },
                    onViewCreated: (PDFViewController vc) {
                      _pdfViewController = vc;
                    },
                    onPageChanged: (int page, int total) {
                      setState(() {});
                    },
                    onPageError: (page, e) {},
                  ),
                ],
              );
            else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              );
            }
          }),
    );
  
  }

}