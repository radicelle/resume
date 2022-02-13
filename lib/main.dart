import 'package:curriculum_vitae/widgets/icons/triple_icon.dart';
import 'package:curriculum_vitae/widgets/pages/detailed_resume_tile.dart';
import 'package:curriculum_vitae/widgets/tiles/resume_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';

void main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en_US', supportedLocales: ['en_US', 'fr_FR']);
  runApp(LocalizedApp(delegate, const TabBarDemo()));
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
    var localizationDelegate = LocalizedApp.of(context).delegate;
    var tiles = <ResumeTile>[
      ResumeTile(
        assetLocation: 'medium.png',
        title: 'work.tiles.radicelle.1.title',
        subtitle: 'work.tiles.radicelle.1.subtitle',
        logo: const FlutterLogo(
          size: 40,
        ),
        start: DateTime.utc(2021, 12, 01),
      ),
      ResumeTile(
        assetLocation: 'medium.png',
        title: 'work.tiles.radicelle.2.title',
        subtitle: 'work.tiles.radicelle.2.subtitle',
        logo: Image.asset(
          "Kotlin_Icon.svg.png",
          width: 30,
        ),
        start: DateTime.utc(2021, 12, 01),
      ),
      ResumeTile(
        assetLocation: 'eurecia.jpg',
        title: 'work.tiles.eurecia.title',
        subtitle: 'work.tiles.eurecia.subtitle',
        logo: TripleIcon(controller: _controller, assets: const <String>[
          "vue-logo.png",
          "logo-java.png",
          "Kotlin_Icon.svg.png"
        ]),
        start: DateTime.utc(2021, 12, 01),
      ),
    ];
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          localizationDelegate
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        home: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
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
                return TabBarView(
                  children: [
                    ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        var item = tiles[index];
                        return GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailedResumeTile(item: item))),
                            child: Hero(tag: item, child: item));
                      },
                      itemCount: tiles.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                    Icon(Icons.directions_bike),
                    Icon(Icons.sports),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
