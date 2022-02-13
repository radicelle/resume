import 'package:flutter/material.dart';

class MovingTile extends StatefulWidget {
  const MovingTile(
      {Key? key,
      required this.height,
      required this.width,
      required this.top,
      required this.left})
      : super(key: key);

  final double height;
  final double width;
  final double top;
  final double left;

  @override
  _MovingTileState createState() => _MovingTileState(height, width, top, left);
}

class TileData {
  double _height;
  double _width;
  double _top;
  double _left;

  TileData(this._height, this._width, this._top, this._left);
}

class _MovingTileState extends State<MovingTile> {
  late TileData _data;

  _MovingTileState(double height, double width, double top, double left) {
    _data = TileData(height, width, top, left);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _data._left,
      top: _data._top,
      child: GestureDetector(
        child: SizedBox(
            width: _data._width,
            height: _data._height,
            child: Container(color: Colors.green)),
        onVerticalDragUpdate: _spin,
      ),
    );
  }

  _spin(DragUpdateDetails details) {
    rotate(details.delta);
  }

  void rotate(Offset delta) {
    setState(() {
      _data._top += delta.distance;
      _data._left += delta.distance;
    });
  }
}
