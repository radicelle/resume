import 'package:flutter/material.dart';

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
