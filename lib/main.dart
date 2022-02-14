import 'package:curriculum_vitae/widgets/icons/triple_icon.dart';
import 'package:curriculum_vitae/widgets/pages/detailed_resume_tile.dart';
import 'package:curriculum_vitae/widgets/tiles/resume_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('en', ''), Locale('fr', '')],
      locale: const Locale('en', ''),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            bottom: const TabBar(
              indicatorColor: Colors.amberAccent,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4,
              tabs: [
                Tab(icon: Icon(Icons.work)),
                Tab(icon: Icon(Icons.school)),
                Tab(icon: Icon(Icons.language)),
                Tab(icon: Icon(Icons.computer)),
                Tab(icon: Icon(Icons.play_arrow_sharp)),
              ],
            ),
            title: const Center(
              child: Text(
                'Curriculum vitæ',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              var localization = AppLocalizations.of(context)!;
              late var tiles = <ResumeTile>[
                ResumeTile(
                  assetLocation: 'medium.png',
                  title: localization.radicelleTile1,
                  subtitle: localization.radicelleTile1Desc,
                  logo: const FlutterLogo(
                    size: 40,
                  ),
                  start: DateTime.utc(2021, 12, 01),
                ),
                ResumeTile(
                  assetLocation: 'medium.png',
                  title: localization.radicelleTile2,
                  subtitle: localization.radicelleTile2Desc,
                  logo: Image.asset(
                    "Kotlin_Icon.svg.png",
                    width: 30,
                  ),
                  start: DateTime.utc(2020, 12, 07),
                ),
                ResumeTile(
                  assetLocation: 'eurecia.jpg',
                  title: localization.eureciaTile,
                  subtitle: localization.eureciaTileDesc,
                  logo: TripleIcon(
                      controller: _controller,
                      assets: const <String>[
                        "vue-logo.png",
                        "logo-java.png",
                        "Kotlin_Icon.svg.png"
                      ]),
                  start: DateTime.utc(2018, 10, 15),
                ),
                ResumeTile(
                  assetLocation: 'logo-artal.png',
                  title: localization.artalTile,
                  subtitle: localization.artalTileDesc,
                  logo: TripleIcon(
                      controller: _controller,
                      assets: const <String>[
                        "eclipse.png",
                        "logo-java.png",
                        "hibernate-logo.png"
                      ]),
                  start: DateTime.utc(2021, 12, 01),
                ),
                ResumeTile(
                  assetLocation: 'ensicaen.jpg',
                  title: localization.internshipTile,
                  subtitle: localization.internshipTileDesc,
                  logo: TripleIcon(
                      controller: _controller,
                      assets: const <String>[
                        "eclipse.png",
                        "logo-java.png",
                        "xml.png"
                      ]),
                  start: DateTime.utc(2021, 12, 01),
                ),
              ];
              var lineLeftShift = constraints.maxWidth / 8;
              return Stack(
                children: [
                  Positioned(
                    left: lineLeftShift,
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    width: 1,
                    height: constraints.maxHeight - 35,
                    bottom: 0,
                  ),
                  TabBarView(
                    children: [
                      ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          var item = tiles[index];
                          return GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailedResumeTile(item: item))),
                              child: Tooltip(
                                  verticalOffset: 50,
                                  message: localization.tileTooltip,
                                  showDuration:
                                      const Duration(milliseconds: 300),
                                  waitDuration: const Duration(seconds: 1),
                                  child: Hero(tag: item, child: item)));
                        },
                        itemCount: tiles.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: lineLeftShift - 5),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Colors.grey.shade600,
                                      size: 12,
                                    ),
                                    Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Container(
                                            color: Colors.grey.shade300,
                                            width: 150,
                                            height: 30,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  RichText(
                                                      text: TextSpan(
                                                          text: localization
                                                              .sinceYearMonth(
                                                                  tiles[index]
                                                                      .start)),
                                                      textAlign:
                                                          TextAlign.left),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      const Icon(Icons.directions_transit),
                      const Icon(Icons.directions_bike),
                      const Icon(Icons.directions_bike),
                      const Icon(Icons.sports),
                    ],
                  ),
                  Positioned(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.access_time,
                        size: 30,
                        color: Colors.grey.shade600.withOpacity(1),
                      ),
                    ),
                    left: lineLeftShift - 19,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
