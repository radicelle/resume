import 'package:curriculum_vitae/widgets/tabs/education_tab.dart';
import 'package:curriculum_vitae/widgets/tabs/jobs_tab.dart';
import 'package:curriculum_vitae/widgets/tabs/language_tab.dart';
import 'package:curriculum_vitae/widgets/tabs/skills_tab.dart';
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

class _TabBarDemoState extends State<TabBarDemo> {
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
          body: const TabBarView(
            children: [
              JobsTab(),
              EducationTab(),
              LanguageTab(),
              SkillsTab(),
              Icon(Icons.sports),
            ],
          ),
        ),
      ),
    );
  }
}
