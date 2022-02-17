import 'package:curriculum_vitae/providers/dot_navigation_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      create: (context) =>
          DotNavigationNotifier(offset: timeBarLength + timeBarStart),
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
          TimeDotButton(left: timeBarStart),
          TimeDotButton(left: timeBarStart + timeBarLength / 3),
          TimeDotButton(left: timeBarStart + timeBarLength / 1.5),
          TimeDotButton(left: timeBarStart + timeBarLength),
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
          const AnimatedDot(
            left: timeBarStart,
          ),
          Positioned(
              top: headerHeight,
              left: 0,
              bottom: 0,
              right: 0,
              child: LayoutBuilder(
                  builder: (context, constraints) => ListView(
                        itemExtent: constraints.maxHeight,
                        children: [
                          Row(
                            children: [
                              Image.asset('ensicaen.jpg'),
                              Column(
                                children: [
                                  Expanded(
                                      child: RichText(
                                    textAlign: TextAlign.center,
                                    text:
                                        const TextSpan(text: 'Double diploma'),
                                  )),
                                  IconButton(
                                      onPressed: () => {},
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down))
                                ],
                              ),
                              Image.asset('logo_SalernoUniversity.png')
                            ],
                          ),
                          Container(
                            color: Colors.blue,
                          )
                        ],
                      )))
        ],
      ),
    );
  }
}
