import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaintPad extends CustomPainter{
  Paint paintObject;
  List<Offset> points;

  PaintPad({@required this.paintObject,@required this.points}):
        assert(paintObject!=null&&points!=null);


  @override
  void paint(Canvas canvas, Size size) {
   canvas.drawPoints(PointMode.points, points, paintObject);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


}