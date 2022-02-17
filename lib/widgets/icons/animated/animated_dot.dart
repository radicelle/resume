import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/dot_navigation_notifier.dart';

class AnimatedDot extends StatefulWidget {
  const AnimatedDot({
    required this.left,
    Key? key,
  }) : super(key: key);
  final double left;

  @override
  State<AnimatedDot> createState() => AnimatedDotState();
}

class AnimatedDotState extends State<AnimatedDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowAnimationController;
  late Animation _glowAnimation;

  @override
  void initState() {
    _glowAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);

    _glowAnimation =
        CurvedAnimation(parent: _glowAnimationController, curve: Curves.linear);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Consumer<DotNavigationNotifier>(builder: (context, navDot, _) {
          return Transform.translate(
            offset: Offset(navDot.dotOffset - 4, 22),
            child: Opacity(opacity: _glowAnimation.value, child: child!),
          );
        });
      },
      animation: _glowAnimation,
      child: const Icon(
        Icons.circle,
        color: Colors.white,
        size: 16,
      ),
    );
  }

  @override
  void dispose() {
    _glowAnimationController.dispose();
    super.dispose();
  }
}
