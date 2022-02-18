import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dot_navigation_notifier.dart';

class TimeDotButton extends StatefulWidget {
  const TimeDotButton({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<TimeDotButton> createState() => _TimeDotButtonState();
}

class _TimeDotButtonState extends State<TimeDotButton> {
  Future scrollMultiItem(GlobalKey key) async {
    await Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    final navNotifier = Provider.of<DotNavigationNotifier>(context);

    return Positioned(
      left: navNotifier.offsets[widget.index] - 8,
      top: 18,
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
          onPressed: () => _buttonPressed(navNotifier),
        ),
      ),
    );
  }

  void _buttonPressed(DotNavigationNotifier navNotifier) {
    navNotifier.index = widget.index;
  }
}
