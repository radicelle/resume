import 'package:curriculum_vitae/widgets/tiles/wild_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../pages/detailed_resume_tile.dart';
import '../tiles/time_dot_separator.dart';

class JobsList extends StatelessWidget {
  const JobsList({
    Key? key,
    required this.tiles,
    required this.localization,
    required this.lineLeftShift,
  }) : super(key: key);

  final List<WildTile> tiles;
  final AppLocalizations localization;
  final double lineLeftShift;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        var item = tiles[index];
        return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailedResumeTile(item: item))),
            child: Tooltip(
                verticalOffset: 50,
                message: localization.tileTooltip,
                showDuration: const Duration(milliseconds: 300),
                waitDuration: const Duration(seconds: 1),
                child: Hero(tag: item, child: item)));
      },
      itemCount: tiles.length,
      separatorBuilder: (BuildContext context, int index) {
        return TimeDotSeparator(
            lineLeftShift: lineLeftShift,
            localization: localization,
            tile: tiles[index]);
      },
    );
  }
}
