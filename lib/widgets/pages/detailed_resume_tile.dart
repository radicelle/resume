import 'package:flutter/material.dart';

import '../tiles/resume_tile.dart';

class DetailedResumeTile extends StatelessWidget {
  const DetailedResumeTile({required this.item, Key? key}) : super(key: key);
  final ResumeTile item;
  @override
  Widget build(BuildContext context) {
    var title = item.title;
    var maxWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Center(child: Text(title)),
          ),
          body: Hero(
              tag: item,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: maxWidth / 6,
                      child: Image.asset(item.assetLocation),
                    ),
                    Center(
                      child: SizedBox(
                        width: maxWidth > 500 ? 450 : (9 / 10) * maxWidth,
                        child: Text(
                          item.subtitle,
                          softWrap: true,
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
