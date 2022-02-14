import 'package:flutter/material.dart';

class TripleIcon extends StatefulWidget {
  const TripleIcon({
    Key? key,
    required Animation<double> controller,
    required List<String> assets,
  })  : assert(assets.length == 3),
        _controller = controller,
        _assets = assets,
        super(key: key);
  final Animation<double> _controller;
  final List<String> _assets;
  @override
  State<TripleIcon> createState() => _TripleIconState();
}

class _TripleIconState extends State<TripleIcon> {
  late final Animation<double> _animation;
  late final Animation<double> _animTurnR;

  @override
  void initState() {
    super.initState();
    _animation = CurvedAnimation(
      parent: widget._controller,
      curve: Curves.linear,
    );
    _animTurnR =
        Tween<double>(begin: 0.0, end: -1.0).animate(widget._controller);
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: SizedBox(
        height: 60,
        width: 60,
        child: Stack(
          children: [
            MiniIcon(
              animTurnR: _animTurnR,
              assetLocation: widget._assets[0],
              left: 20,
              top: 5,
            ),
            MiniIcon(
              animTurnR: _animTurnR,
              assetLocation: widget._assets[1],
              left: 5,
              top: 35,
            ),
            MiniIcon(
              animTurnR: _animTurnR,
              assetLocation: widget._assets[2],
              left: 35,
              top: 35,
            ),
          ],
        ),
      ),
    );
  }
}

class MiniIcon extends StatelessWidget {
  const MiniIcon({
    Key? key,
    required Animation<double> animTurnR,
    required this.assetLocation,
    required this.left,
    required this.top,
    this.right,
  })  : _animTurnR = animTurnR,
        super(key: key);

  final Animation<double> _animTurnR;
  final String assetLocation;
  final double left;
  final double top;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: RotationTransition(
          turns: _animTurnR,
          child: SizedBox(
              child: Image.asset(
            assetLocation,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          )),
        ),
        left: left,
        top: top);
  }
}
