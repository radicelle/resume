import 'package:curriculum_vitae/widgets/tiles/animated/skill_animated_tile.dart';
import 'package:flutter/material.dart';

class SkillsTab extends StatelessWidget {
  const SkillsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var largeScreen = constraints.maxWidth / constraints.maxHeight > 1;
      var tileSize =
          largeScreen ? constraints.maxWidth / 6 : constraints.maxHeight / 6;
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: tileSize,
              mainAxisExtent: tileSize,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 3 / 2),
          itemCount: indicesInOrder.length,
          itemBuilder: (context, index) {
            var tileName = indicesInOrder[index];
            return SkillAnimatedTile(
                text: tileName, size: tileSize, level: levelMap[tileName]);
          });
    });
  }

  static final tilesPro = [
    "Intellij",
    "Kotlin",
    "Java 8",
    "git",
    "MongoDB",
    "MariaDB",
    "Spring",
    "SQL",
    "REST"
  ];

  static final tilesAdvanced = [
    "Dart",
    "Flutter",
    "object design patterns",
    "C++/C",
    "Oracle",
    "subversion",
    "Jira",
    "JUnit",
    "LATEX",
    "VueJS",
    "HTML/CSS"
  ];
  static final tilesInter = [
    "Functional programing",
    "React.js",
    "Python",
    "PHP",
    "Java Script",
    "OpenCV",
    "DL4J",
    "J2EE",
    "C#",
    "Matlab",
    "Jenkin"
  ];
  static final tilesBasic = ["Golang", "TensorFlow", "NodeJS", "Unity"];

  static final levelMap = {}
    ..addEntries(mapSkill(tilesPro, 10))
    ..addEntries(mapSkill(tilesAdvanced, 8))
    ..addEntries(mapSkill(tilesInter, 6))
    ..addEntries(mapSkill(tilesBasic, 4));

  static final indicesInOrder = List.of(tilesPro)
    ..addAll(tilesAdvanced)
    ..addAll(tilesInter)
    ..addAll(tilesBasic);

  static Iterable<MapEntry<dynamic, dynamic>> mapSkill(
          Iterable<dynamic> values, dynamic value) =>
      values.map((e) => MapEntry(e, value));
}
