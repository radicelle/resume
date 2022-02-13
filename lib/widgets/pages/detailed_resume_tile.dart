import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../tiles/resume_tile.dart';

class DetailedResumeTile extends StatelessWidget {
  const DetailedResumeTile({required this.item, Key? key}) : super(key: key);
  final ResumeTile item;
  @override
  Widget build(BuildContext context) {
    var title = translate(item.title);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(child: Text(title)),
        ),
        body: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Hero(
              tag: item,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 6,
                      child: Image.asset(item.assetLocation),
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: RichText(
                          softWrap: true,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: translate(item.subtitle),
                            )
                          ]),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
