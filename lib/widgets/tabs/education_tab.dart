import 'package:curriculum_vitae/providers/dot_navigation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/globals.dart' as globals;
import '../../extensions/string_casing_extensions.dart';
import '../buttons/time_dot_button.dart';
import '../icons/animated/animated_dot.dart';
import '../pages/content/nav_rich_text.dart';
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
      double timeBarStart = constraints.maxWidth / 2.5;
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
                  left: navDot.dotOffset - 6,
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
                          'assets/IUT-de-Caen.jpg',
                          fit: BoxFit.contain,
                        )
                      ],
                      text: translations.entered('IUT Ifs'),
                    ),
                    NavRichText(
                      indexBottom: 0,
                      indexTop: 2,
                      text: translations.entered('ENSICAEN'),
                      images: [
                        Image.asset('assets/ensicaen.jpg', fit: BoxFit.contain)
                      ],
                    ),
                    NavRichText(
                      indexBottom: 1,
                      indexTop: 3,
                      text: translations.entered('UNISA'),
                      images: [
                        Image.asset('assets/logo_SalernoUniversity.png',
                            fit: BoxFit.contain)
                      ],
                    ),
                    NavRichText(
                      indexBottom: 2,
                      text:
                          '${translations.graduate("ENSICAEN").toCapitalized()} ${translations.and} ${translations.graduate("UNISA")}',
                      images: [
                        Image.asset('assets/ensicaen.jpg', fit: BoxFit.contain),
                        Image.asset('assets/logo_SalernoUniversity.png',
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
