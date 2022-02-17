import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dot_navigation_notifier.dart';

class TimeDotButton extends StatefulWidget {
  const TimeDotButton({
    Key? key,
    required this.left,
  }) : super(key: key);

  final double left;

  @override
  State<TimeDotButton> createState() => _TimeDotButtonState();
}

class _TimeDotButtonState extends State<TimeDotButton> {
  @override
  Widget build(BuildContext context) {
    final navNotifier = Provider.of<DotNavigationNotifier>(context);
    return Positioned(
      left: widget.left - 8,
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
          onPressed: () => {navNotifier.dotOffset = widget.left},
        ),
      ),
    );
  }
}
