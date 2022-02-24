import 'package:curriculum_vitae/widgets/tiles/wild_tile.dart';
import 'package:flutter/material.dart';

import '../text/body_text.dart';

class DetailedResumeTile extends StatelessWidget {
  const DetailedResumeTile({required this.item, Key? key}) : super(key: key);
  final WildTile item;
  @override
  Widget build(BuildContext context) {
    var title = item.title;
    var maxWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Scaffold(
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
                        child: BodyText(
                          item.subtitle,
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
