import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationTab extends StatelessWidget {
  const EducationTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeBarLength = MediaQuery.of(context).size.width / 2;
    double timeBarStart = 345;
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
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
            TimeDotButton(left: timeBarStart, year: 2011),
            TimeDotButton(left: timeBarStart + timeBarLength / 1.5, year: 2013),
            TimeDotButton(left: timeBarStart + timeBarLength / 3, year: 2015),
            TimeDotButton(left: timeBarStart + timeBarLength, year: 2017),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 40.0),
              child: EducationTile('logo_SalernoUniversity.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox.fromSize(
                size: const Size(1, 120),
                child: Container(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: EducationTile('ensicaen.jpg'),
            )
          ],
        ),
      ],
    );
  }
}

class TimeDotButton extends StatelessWidget {
  const TimeDotButton({
    Key? key,
    required this.left,
    required this.year,
  })  : assert(year > 1993),
        super(key: key);

  final double left;
  final int year;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: IconButton(
          iconSize: 8,
          constraints: const BoxConstraints(maxHeight: 30),
          splashRadius: 15,
          hoverColor: Colors.black.withOpacity(0.8),
          icon: const Icon(
            Icons.circle,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      top: 18,
      left: left - 8,
    );
  }
}

class EducationTile extends StatelessWidget {
  const EducationTile(
    this.assetName, {
    Key? key,
  }) : super(key: key);
  final String assetName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(assetName),
      height: 200,
    );
  }
}
