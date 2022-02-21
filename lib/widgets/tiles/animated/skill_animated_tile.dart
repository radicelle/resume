import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/events.dart';
import 'package:signal_strength_indicator/signal_strength_indicator.dart';

class SkillAnimatedTile extends StatefulWidget {
  const SkillAnimatedTile(
      {required this.text, required this.size, required this.level, Key? key})
      : super(key: key);

  final String text;
  final double size;
  final int level;
  @override
  _SkillAnimatedTileState createState() => _SkillAnimatedTileState();
}

class _SkillAnimatedTileState extends State<SkillAnimatedTile>
    with SingleTickerProviderStateMixin {
  late int flip;

  @override
  void initState() {
    flip = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: animate,
      onExit: animate,
      child: AnimatedRotation(
        turns: -flip / 2,
        duration: const Duration(milliseconds: 300),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.size / 4),
          child: Container(
            color: randomColor(),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.text),
                SignalStrengthIndicator.bars(
                  value: widget.level / 10,
                  size: widget.size / 2 - widget.size * 0.2,
                  barCount: 6,
                  spacing: 0.2,
                )
              ],
            )),
          ),
        ),
      ),
    );
  }

  void animate(PointerEvent event) {
    setState(() {
      if (flip == 1) {
        flip = 0;
      } else {
        flip = 1;
      }
    });
  }

  randomColor() {
    var rng = Random();
    return Color.fromARGB(
        rng.nextInt(255), rng.nextInt(255), rng.nextInt(255), rng.nextInt(255));
  }
}
