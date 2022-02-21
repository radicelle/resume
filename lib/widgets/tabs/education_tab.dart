import 'package:curriculum_vitae/providers/dot_navigation_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/globals.dart' as globals;
import '../../extensions/StringCasingExtensions.dart';
import '../buttons/time_dot_button.dart';
import '../icons/animated/animated_dot.dart';
import '../text/time_dot_text.dart';

class EducationTab extends StatefulWidget {
  const EducationTab({
    Key? key,
  }) : super(key: key);

  @override
  State<EducationTab> createState() => _EducationTabState();
}

class _EducationTabState extends State<EducationTab>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var timeBarLength = constraints.maxWidth / 2;
      double timeBarStart = constraints.maxWidth / 3;
      const double headerHeight = 60;
      final displayExploreBottom = constraints.maxWidth < 850;
      return ChangeNotifierProvider(
        create: (context) => DotNavigationNotifier(
            offset: timeBarLength + timeBarStart,
            index: 3,
            offsets: [
              timeBarStart,
              timeBarStart + timeBarLength / 3,
              timeBarStart + timeBarLength / 1.5,
              timeBarStart + timeBarLength
            ]),
        child: Stack(
          children: [
            SizedBox(
              width: constraints.maxWidth,
              height: headerHeight,
              child: Container(
                color: globals.headerColor,
              ),
            ),
            Positioned(
              child: Text('Education',
                  style: GoogleFonts.aBeeZee(
                      textStyle: Theme.of(context).textTheme.headline5,
                      color: Colors.white)),
              left: constraints.maxWidth / 12,
              top: 15,
            ),
            Positioned(
              child: Text('Explore',
                  style: GoogleFonts.aBeeZee(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      color: Colors.white.withOpacity(0.5))),
              left: constraints.maxWidth / 4.7,
              top: displayExploreBottom ? 40 : 20,
            ),
            Positioned(
              child: SizedBox(
                  width: timeBarLength,
                  height: 1,
                  child: Container(
                    color: Colors.white,
                  )),
              top: 30,
              left: timeBarStart,
            ),
            const TimeDotButton(index: 0),
            const TimeDotButton(index: 1),
            const TimeDotButton(index: 2),
            const TimeDotButton(index: 3),
            TimeDotText(left: timeBarStart, year: 2011),
            TimeDotText(
              left: timeBarStart + timeBarLength / 3,
              year: 2013,
              over: true,
            ),
            TimeDotText(
              left: timeBarStart + timeBarLength / 1.5,
              year: 2015,
            ),
            TimeDotText(
              left: timeBarStart + timeBarLength,
              year: 2017,
              over: true,
            ),
            Consumer<DotNavigationNotifier>(builder: (context, navDot, _) {
              return AnimatedPositioned(
                  duration: const Duration(milliseconds: 800),
                  child: const AnimatedDot(),
                  left: navDot.dotOffset - 4,
                  top: 22);
            }),
            Positioned(
                top: headerHeight,
                left: 0,
                bottom: 0,
                right: 0,
                child: Builder(builder: (context) {
                  var translations = AppLocalizations.of(context)!;
                  var educationPages = [
                    NavRichText(
                      indexTop: 1,
                      images: [
                        Image.asset(
                          'IUT-de-Caen.jpg',
                          fit: BoxFit.contain,
                        )
                      ],
                      text: const TextSpan(text: 'Start IUT Ifs'),
                    ),
                    NavRichText(
                      indexBottom: 0,
                      indexTop: 2,
                      text: const TextSpan(text: 'Start ENSICAEN'),
                      images: [
                        Image.asset('ensicaen.jpg', fit: BoxFit.contain)
                      ],
                    ),
                    NavRichText(
                      indexBottom: 1,
                      indexTop: 3,
                      text: const TextSpan(text: 'Start UNISA'),
                      images: [
                        Image.asset('logo_SalernoUniversity.png',
                            fit: BoxFit.contain)
                      ],
                    ),
                    NavRichText(
                      indexBottom: 2,
                      text: TextSpan(
                        text:
                            "${translations.graduate("ENSICAEN").toCapitalized()} ${translations.and} ${translations.graduate("UNISA")}",
                      ),
                      images: [
                        Image.asset('ensicaen.jpg', fit: BoxFit.contain),
                        Image.asset('logo_SalernoUniversity.png',
                            fit: BoxFit.contain)
                      ],
                    )
                  ];

                  return Consumer<DotNavigationNotifier>(
                      builder: (context, consumer, _) =>
                          educationPages[consumer.index]);
                }))
          ],
        ),
      );
    });
  }
}

class NavRichText extends StatefulWidget {
  const NavRichText({
    Key? key,
    this.indexTop,
    this.indexBottom,
    required this.images,
    required this.text,
  })  : assert(indexTop != null || indexBottom != null),
        super(key: key);

  final int? indexTop;
  final int? indexBottom;
  final TextSpan text;
  final List<Widget> images;

  @override
  State<NavRichText> createState() => _NavRichTextState();
}

class _NavRichTextState extends State<NavRichText> {
  @override
  Widget build(BuildContext context) {
    final navNotifier = Provider.of<DotNavigationNotifier>(context);
    return LayoutBuilder(builder: (context, constraints) {
      var buttonsStart = constraints.maxWidth / 10;
      double buttonSize = buttonsStart;
      var imagesStartTop = constraints.maxHeight / 9;
      var imagesStartLeft = buttonsStart + buttonSize + 10;
      var imagesHeight = constraints.maxHeight / 4;
      var imagesWidth = constraints.maxWidth - imagesStartLeft * 2;
      return Stack(
        children: [
          if (widget.indexBottom != null)
            Positioned(
              top: constraints.maxHeight / 2,
              left: buttonsStart,
              child: FloatingActionButton(
                  backgroundColor: globals.headerColor,
                  onPressed: () =>
                      changeEducationPage(navNotifier, widget.indexBottom!),
                  child: const Icon(
                    Icons.keyboard_arrow_left,
                  )),
            ),
          Positioned(
            top: imagesStartTop,
            left: imagesStartLeft,
            child: SizedBox(
              width: imagesWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...widget.images.map((w) {
                    const double imagePadding = 20;
                    return Padding(
                      padding: const EdgeInsetsDirectional.all(imagePadding),
                      child: SizedBox(
                          width: (imagesWidth / widget.images.length) -
                              imagePadding * 2 * widget.images.length,
                          height: imagesHeight,
                          child: w),
                    );
                  })
                ],
              ),
            ),
          ),
          Positioned(
            top: imagesStartTop + imagesHeight + imagesStartTop,
            left: imagesStartLeft,
            child: SizedBox(
              width: imagesWidth,
              child: RichText(
                textAlign: TextAlign.center,
                text: widget.text,
              ),
            ),
          ),
          if (widget.indexTop != null)
            Positioned(
              top: constraints.maxHeight / 2,
              right: buttonsStart,
              child: FloatingActionButton(
                  backgroundColor: globals.headerColor,
                  onPressed: () =>
                      changeEducationPage(navNotifier, widget.indexTop!),
                  child: const Icon(Icons.keyboard_arrow_right)),
            ),
        ],
      );
    });
  }

  void changeEducationPage(DotNavigationNotifier navNotifier, int index) {
    navNotifier.index = index;
  }
}
