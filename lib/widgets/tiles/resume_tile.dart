import 'package:flutter/material.dart';

class ResumeTile extends StatefulWidget {
  const ResumeTile(
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
  _ResumeTileState createState() => _ResumeTileState();
}

class _ResumeTileState extends State<ResumeTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                  widget.assetLocation,
                  height: imageHeight,
                  width: headingWidth,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Center(
                    child: RichText(
                      softWrap: true,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: widget.title,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black.withOpacity(0.5))),
                      ]),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: widget.logo,
              ),
            ],
          )),
    );
  }
}
