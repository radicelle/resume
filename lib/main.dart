import 'package:curriculum_vitae/globals.dart' as globals;
import 'package:curriculum_vitae/widgets/tabs/education_tab.dart';
import 'package:curriculum_vitae/widgets/tabs/hobby_tab.dart';
import 'package:curriculum_vitae/widgets/tabs/jobs_tab.dart';
import 'package:curriculum_vitae/widgets/tabs/language_tab.dart';
import 'package:curriculum_vitae/widgets/tabs/skills_tab.dart';
import 'package:curriculum_vitae/widgets/text/body_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late bool language = false;

  @override
  Widget build(BuildContext context) {
    const supportedLocales = [Locale('en', ''), Locale('fr', '')];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: supportedLocales,
      locale: supportedLocales[language ? 1 : 0],
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: globals.headerColor,
            foregroundColor: Colors.white,
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
            title: Stack(children: [
              const Center(
                child: Text(
                  'Curriculum vitæ',
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Row(
                  children: [
                    const BodyText(
                      'en',
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                      child: CupertinoSwitch(
                        value: language,
                        onChanged: _changeLanguage,
                      ),
                    ),
                    const BodyText('fr', color: Colors.white)
                  ],
                ),
              )
            ]),
          ),
          body: const TabBarView(
            children: [
              JobsTab(),
              EducationTab(),
              LanguageTab(),
              SkillsTab(),
              HobbyTab(),
            ],
          ),
        ),
      ),
    );
  }

  void _changeLanguage(bool value) {
    setState(() {
      language = value;
    });
  }
}
