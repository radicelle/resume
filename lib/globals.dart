library curriculum_vitae.globals;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color headerColor = Colors.teal.withOpacity(0.7);
bodyTextStyle(context, {Color? color}) {
  return GoogleFonts.aBeeZee(
      textStyle: Theme.of(context).textTheme.bodyMedium,
      color: color ?? Colors.black);
}

headerTextStyle(context) {
  return GoogleFonts.aBeeZee(
      textStyle: Theme.of(context).textTheme.headline5,
      color: Colors.black.withOpacity(0.5));
}
