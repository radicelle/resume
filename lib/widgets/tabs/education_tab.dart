import 'package:curriculum_vitae/providers/dot_navigation_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    var timeBarLength = MediaQuery.of(context).size.width / 2;
    const double timeBarStart = 345;
    const double headerHeight = 60;

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
            width: MediaQuery.of(context).size.width,
            height: headerHeight,
            child: Container(
              color: Colors.teal.withOpacity(0.7),
            ),
          ),
          Positioned(
            child: Text('Education',
                style: GoogleFonts.aBeeZee(
                    textStyle: Theme.of(context).textTheme.headline5,
                    color: Colors.white)),
            left: 100,
            top: 15,
          ),
          Positioned(
            child: Text('Explore',
                style: GoogleFonts.aBeeZee(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    color: Colors.white.withOpacity(0.5))),
            left: 250,
            top: 20,
          ),
          Positioned(
            child: SizedBox(
                width: timeBarLength,
                height: 1,
                child: Container(
                  color: Colors.white,
                )),
            top: 30,
            left: 350,
          ),
          const TimeDotButton(index: 0),
          const TimeDotButton(index: 1),
          const TimeDotButton(index: 2),
          const TimeDotButton(index: 3),
          const TimeDotText(left: timeBarStart, year: 2011),
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
              child: LayoutBuilder(builder: (context, constraints) {
                var translations = AppLocalizations.of(context)!;
                var educationPages = [
                  Row(
                    children: [
                      Image.asset('ensicaen.jpg'),
                      const NavRichText(
                        indexTop: 1,
                        text: TextSpan(
                            text: '',
                            children: [TextSpan(text: 'All gradution')]),
                      ),
                      Image.asset('logo_SalernoUniversity.png')
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('ensicaen.jpg'),
                      const NavRichText(
                        indexBottom: 0,
                        indexTop: 2,
                        text: TextSpan(text: 'Start UNISA', children: [
                          TextSpan(text: 'Università delgi studi di Salerno')
                        ]),
                      ),
                      Image.asset('logo_SalernoUniversity.png')
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('ensicaen.jpg'),
                      const NavRichText(
                        indexBottom: 1,
                        indexTop: 3,
                        text: TextSpan(text: 'Start ENSICAEN', children: [
                          TextSpan(
                              text:
                                  'Ecole Nationale superieur d\'ingénieur de Caen')
                        ]),
                      ),
                      Image.asset('logo_SalernoUniversity.png')
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('ensicaen.jpg'),
                      NavRichText(
                        indexBottom: 2,
                        text: TextSpan(
                            text:
                                "${translations.graduate("ENSICAEN")} ${translations.and} ${translations.graduate("UNISA")}",
                            children: [
                              TextSpan(
                                  text:
                                      'Diplome universitaire et technologique de Ifs'),
                            ]),
                      ),
                      Image.asset('logo_SalernoUniversity.png')
                    ],
                  )
                ];
                return Consumer<DotNavigationNotifier>(
                    builder: (context, consumer, _) => AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        child: educationPages[consumer.index]));
              }))
        ],
      ),
    );
  }
}

class NavRichText extends StatefulWidget {
  const NavRichText({
    Key? key,
    this.indexTop,
    this.indexBottom,
    required this.text,
  })  : assert(indexTop != null || indexBottom != null),
        super(key: key);

  final int? indexTop;
  final int? indexBottom;
  final TextSpan text;

  @override
  State<NavRichText> createState() => _NavRichTextState();
}

class _NavRichTextState extends State<NavRichText> {
  @override
  Widget build(BuildContext context) {
    final navNotifier = Provider.of<DotNavigationNotifier>(context);
    return Expanded(
      child: Column(
        children: [
          if (widget.indexTop != null)
            IconButton(
                onPressed: () =>
                    changeEducationPage(navNotifier, widget.indexTop!),
                icon: const Icon(Icons.keyboard_arrow_up)),
          RichText(
            textAlign: TextAlign.center,
            text: widget.text,
          ),
          Expanded(child: Container()),
          if (widget.indexBottom != null)
            IconButton(
                onPressed: () =>
                    changeEducationPage(navNotifier, widget.indexBottom!),
                icon: const Icon(Icons.keyboard_arrow_down)),
        ],
      ),
    );
  }

  void changeEducationPage(DotNavigationNotifier navNotifier, int index) {
    navNotifier.index = index;
  }
}
