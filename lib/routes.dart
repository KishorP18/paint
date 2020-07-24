import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paint/ui/get_started.dart';
import 'package:paint/ui/util/paint_pad.dart';
import 'package:paint/ui/painter_widget.dart';

import 'ui/home.dart';

class Routes{
  static const home="/home";
  static const getStarted="get_started";
  static const paintWidget="/paint_widget";

  static Route<dynamic> generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case home:
        return MaterialPageRoute(builder: (context)=>Home());
      case getStarted:
        return MaterialPageRoute(builder: (context)=>GetStarted());
      case paintWidget:
        return MaterialPageRoute(builder: (context)=>PainterWidget());
    }
  }
}