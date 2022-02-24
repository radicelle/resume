import 'package:curriculum_vitae/extensions/string_casing_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../text/body_text.dart';

class LanguageTab extends StatelessWidget {
  const LanguageTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var imageWidth = constraints.maxWidth / 2;
      var imageHeight = constraints.maxHeight / 1.01;
      var sizeCondition = imageWidth < imageHeight;
      var realImageSize = sizeCondition ? imageWidth : imageHeight;
      var tr = AppLocalizations.of(context)!;

      return Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(child: Container()),
              ListTile(
                title: BodyText(tr.french.toCapitalized()),
                subtitle: BodyText(tr.mothertongue.toCapitalized()),
              ),
              Expanded(child: Container()),
              ListTile(
                title: BodyText(tr.english.toCapitalized()),
                subtitle: BodyText('${tr.fluent.toCapitalized()}: 820 TOEIC'),
              ),
              Expanded(child: Container()),
            ],
          )),
          ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Stack(
              children: [
                Container(
                  color: Colors.blue,
                  child: SizedBox(
                    width: realImageSize,
                    height: realImageSize,
                    child: Image.asset(
                      'assets/europe_cropped.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    top: realImageSize / 1.50,
                    left: realImageSize / 4,
                    child: const Icon(
                      Icons.flag_circle,
                      color: Colors.white,
                    )),
                Positioned(
                    top: realImageSize / 2,
                    left: realImageSize / 4.5,
                    child: const Icon(
                      Icons.flag_circle,
                      color: Colors.white,
                    )),
                Positioned(
                    top: realImageSize / 1.75,
                    left: realImageSize / 2.5,
                    child: const Icon(
                      Icons.flag_circle,
                      color: Colors.white,
                    )),
                Positioned(
                    bottom: realImageSize / 7,
                    left: realImageSize / 2,
                    child: const Icon(
                      Icons.flag_circle,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Expanded(child: Container()),
              ListTile(
                title: BodyText(
                  tr.italian.toCapitalized(),
                  textAlign: TextAlign.right,
                ),
                subtitle: BodyText(
                  '${tr.fluent.toCapitalized()}: ${tr.year(1)} ${tr.andAHalf} ${tr.livingIn(tr.italy.toCapitalized())}',
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(child: Container()),
              ListTile(
                title: BodyText(tr.german.toCapitalized(),
                    textAlign: TextAlign.right),
                subtitle: BodyText(
                    '${tr.beginner.toCapitalized()}: ${tr.month(6)} ${tr.internship} + ${tr.year(8)} ${tr.scholarship}',
                    textAlign: TextAlign.right),
              ),
              Expanded(child: Container()),
            ],
          ))
        ],
      );
    });
  }
}
