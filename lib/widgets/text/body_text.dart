import 'package:curriculum_vitae/globals.dart' as globals;
import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  const BodyText(this.data, {Key? key, this.textAlign}) : super(key: key);
  final String data;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    var defaultTextStyle = DefaultTextStyle.of(context);
    return Text(
      data,
      style: globals.bodyTextStyle(context),
      textAlign: textAlign ?? defaultTextStyle.textAlign ?? TextAlign.start,
    );
  }
}
