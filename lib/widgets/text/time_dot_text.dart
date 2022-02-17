import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeDotText extends StatelessWidget {
  const TimeDotText({
    Key? key,
    required this.year,
    required this.left,
    this.over = false,
  })  : assert(year > 1993),
        super(key: key);
  final double left;
  final bool over;
  final int year;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Text(year.toString(),
          style: GoogleFonts.aBeeZee(
              textStyle: Theme.of(context).textTheme.bodySmall,
              color: Colors.white)),
      top: over ? 10 : 35,
      left: left - 8,
    );
  }
}
