import 'package:flutter/material.dart';

class DotNavigationNotifier extends ChangeNotifier {
  double _dotOffset = -100;

  DotNavigationNotifier({double? offset}) {
    dotOffset = offset ?? -100;
  }

  double get dotOffset => _dotOffset;
  set dotOffset(double offset) {
    _dotOffset = offset;
    notifyListeners();
  }
}
