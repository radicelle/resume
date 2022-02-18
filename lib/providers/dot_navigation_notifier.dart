import 'package:flutter/material.dart';

class DotNavigationNotifier extends ChangeNotifier {
  late List<double> _offsets;
  late int _index;

  DotNavigationNotifier(
      {required double offset, required int index, required offsets}) {
    _offsets = List.from(offsets);
    _index = index;
  }

  double get dotOffset => _offsets[_index];
  int get index => _index;
  List<double> get offsets => _offsets;

  set index(int index) {
    _index = index;
    notifyListeners();
  }
}
