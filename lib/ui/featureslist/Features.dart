import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_academy/ui/document/dailog.dart';
import 'package:modern_academy/ui/document/document.dart';
import 'package:modern_academy/ui/featureslist/featuresscreens/ResultsScreen.dart';
import 'package:modern_academy/ui/featureslist/featuresscreens/scheduleScreen.dart';
import 'package:modern_academy/ui/featureslist/payment/payment.dart';

import 'FeatureItem.dart';
import 'FeaturesModel.dart';
import 'featuresscreens/links/links.dart';

class Features extends StatefulWidget {
  @override
  _FeaturesState createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView.builder(
          itemCount: featureList.length,
          itemBuilder: (BuildContext context, int index) {
            return FeatureItem(featureList[index],
                (Featuresmodel featuresmodel) {
              if (featuresmodel.featuresName == "Links") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Urllauncher()),
                );
              } else if (featuresmodel.featuresName == "Results") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultsScreen()),
                );
              } else if (featuresmodel.featuresName == "Payments") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Payment()),
                );
              } else if (featuresmodel.featuresName == "Documents") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DocumentScreen()),
                );
              } else if (featuresmodel.featuresName == "Schedule") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => scheduleScreen()),
                );
              }
              //;
            });
          },
        ),
      ),
    );
  }
}
