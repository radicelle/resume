import 'package:curriculum_vitae/globals.dart' as globals;
import 'package:flutter/material.dart';

class WildTile extends StatelessWidget {
  const WildTile(
      {required this.assetLocation,
      required this.title,
      required this.subtitle,
      required this.logo,
      required this.start,
      Key? key,
      this.end})
      : super(key: key);

  final String assetLocation;
  final String title;
  final String subtitle;
  final Widget logo;
  final DateTime start;
  final DateTime? end;

  @override
  Widget build(BuildContext context) {
    var tileHeight = MediaQuery.of(context).size.height / 3;
    var tileWidth = MediaQuery.of(context).size.width / 1.5;
    var headingWidth = tileWidth / 5;
    var imageHeight = tileHeight / 1.2;
    return Center(
      child: SizedBox(
          width: tileWidth,
          height: tileHeight,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  assetLocation,
                  height: imageHeight,
                  width: headingWidth,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Center(
                    child: Text(
                      title,
                      softWrap: true,
                      style: globals.headerTextStyle(context),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: logo,
              ),
            ],
          )),
    );
    ;
  }
}
