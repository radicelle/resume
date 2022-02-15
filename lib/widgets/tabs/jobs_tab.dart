import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../icons/triple_icon.dart';
import '../lists/jobs_list.dart';
import '../tiles/resume_tile.dart';

class JobsTab extends StatefulWidget {
  const JobsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<JobsTab> createState() => _JobsTabState();
}

class _JobsTabState extends State<JobsTab> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat();

  @override
  Widget build(BuildContext context) {
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
        logo: TripleIcon(controller: _controller, assets: const <String>[
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
        logo: TripleIcon(controller: _controller, assets: const <String>[
          "eclipse.png",
          "logo-java.png",
          "hibernate-logo.png"
        ]),
        start: DateTime.utc(2017, 07, 01),
      ),
      ResumeTile(
        assetLocation: 'ensicaen.jpg',
        title: localization.internshipTile,
        subtitle: localization.internshipTileDesc,
        logo: TripleIcon(
            controller: _controller,
            assets: const <String>["eclipse.png", "logo-java.png", "xml.png"]),
        start: DateTime.utc(2021, 12, 01),
      ),
    ];
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
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
            JobsList(
                tiles: tiles,
                localization: localization,
                lineLeftShift: lineLeftShift),
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
    );
  }
}
