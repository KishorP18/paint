import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter{
  final double strokeWidth;
  LinePainter({@required this.strokeWidth}):assert(strokeWidth!=null);
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final _paint=Paint()
      ..strokeWidth=strokeWidth
      ..color=Colors.black
      ..style=PaintingStyle.fill;
    Offset _startingPoint=Offset(size.width, 0.0);
    Offset _endPoint=Offset(0.0, size.height);
    canvas.drawLine(_startingPoint, _endPoint, _paint);
  }
}