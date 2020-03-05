
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;


class FirsttermScreen extends StatefulWidget {
  final String path;

  const FirsttermScreen({Key key, this.path}) : super(key: key);
  @override
  _FirsttermScreenState createState() => _FirsttermScreenState();
}

class _FirsttermScreenState extends State<FirsttermScreen> {
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
    return Scaffold(
      body: FutureBuilder(
          future: getFileFromUrl(
              "https://firebasestorage.googleapis.com/v0/b/modern-acdemy.appspot.com/o/__4.pdf?alt=media&token=a44f0e69-e856-459f-a76a-c6bdbfadc996"),
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