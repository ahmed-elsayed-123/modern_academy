import 'package:flutter/material.dart';

import 'FeaturesModel.dart';

class FeatureItem extends StatefulWidget {
  Featuresmodel _featuresmodel;
  Function function;

  FeatureItem(this._featuresmodel, this.function);

  @override
  _FeatureItemState createState() => _FeatureItemState();
}

class _FeatureItemState extends State<FeatureItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.function(widget._featuresmodel);
      },
      child: Padding(

        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          height: 100,
          decoration: new BoxDecoration(
              color: Colors.cyan,
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.all(
                  const Radius.circular(40.0),
              )),


          child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Center(
              child: Text(widget._featuresmodel.featuresName,
                  style: TextStyle(
                    fontSize: 25,
                  )),
            ),
          ),

        ),),);



  }
}
