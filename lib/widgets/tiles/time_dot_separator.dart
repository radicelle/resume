import 'package:curriculum_vitae/widgets/tiles/resume_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TimeDotSeparator extends StatelessWidget {
  const TimeDotSeparator({
    Key? key,
    required this.lineLeftShift,
    required this.localization,
    required this.tile,
  }) : super(key: key);

  final double lineLeftShift;
  final AppLocalizations localization;
  final ResumeTile tile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: lineLeftShift - 5),
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
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      color: Colors.grey.shade300,
                      width: 150,
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: localization
                                        .sinceYearMonth(tile.start)),
                                textAlign: TextAlign.left),
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
  }
}
