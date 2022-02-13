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
        height: 40,
        width: 40,
        child: Stack(
          children: [
            Positioned(
              child: RotationTransition(
                turns: _animTurnR,
                child: Image(
                  image: AssetImage(widget._assets[0]),
                  width: 15,
                ),
              ),
              left: 10,
            ),
            Positioned(
                child: RotationTransition(
                  turns: _animTurnR,
                  child: Image(
                    image: AssetImage(widget._assets[1]),
                    width: 15,
                    height: 20,
                  ),
                ),
                top: 15),
            Positioned(
              child: RotationTransition(
                turns: _animTurnR,
                child: Image(
                  image: AssetImage(widget._assets[2]),
                  width: 15,
                ),
              ),
              top: 20,
              left: 20,
            )
          ],
        ),
      ),
    );
  }
}
