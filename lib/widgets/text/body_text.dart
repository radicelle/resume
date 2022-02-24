import 'package:curriculum_vitae/globals.dart' as globals;
import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  const BodyText(this.data, {Key? key, this.textAlign, this.color})
      : super(key: key);
  final String data;
  final TextAlign? textAlign;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    var defaultTextStyle = DefaultTextStyle.of(context);
    return Text(
      data,
      style: globals.bodyTextStyle(context, color: color),
      textAlign: textAlign ?? defaultTextStyle.textAlign ?? TextAlign.start,
    );
  }
}
