import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaintProvider with ChangeNotifier{

  List<Offset> _points=[];
  List<Offset> get points=>_points;

  Paint _paint=Paint()
    ..strokeWidth=5
    ..color=Colors.red
    ..strokeCap=StrokeCap.round
    ..style=PaintingStyle.fill;

  Paint get paint=>_paint;

 void addPoints(DragUpdateDetails dragUpdateDetails){
   _points.add(Offset(dragUpdateDetails.localPosition.dx, dragUpdateDetails.localPosition.dy));
   notifyListeners();
 }

  void clearPaint(){
    _points.clear();
     notifyListeners();
  }

  void setColor(Color _color){
   _paint..color=_color;
   notifyListeners();
  }

  void setStrokeWidth(double _strokeWidth){
    _paint..strokeWidth=_strokeWidth;
    notifyListeners();
  }


}