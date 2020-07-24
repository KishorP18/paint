import 'package:flutter/material.dart';
import 'package:paint/provider/paint_provider.dart';
import 'package:paint/ui/util/line_painter.dart';
import 'package:provider/provider.dart';


class PaintSetting extends StatelessWidget {
  const PaintSetting({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Row(
     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,
          height: 40,
          child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(2.0),
              shrinkWrap: true,
              crossAxisCount: 12,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              children:<Widget>[
                ColorBox(color: Colors.blue),
                ColorBox(color: Colors.red),
                ColorBox(color: Colors.green),
                ColorBox( color: Colors.yellow),
                ColorBox( color: Colors.deepOrange),
                ColorBox(color: Colors.deepPurple),
                ColorBox( color: Colors.brown),
                ColorBox(color: Colors.pink),
                ColorBox( color: Colors.amber),
                ColorBox(color: Colors.black),
                ColorBox(color: Colors.black12),
                ColorBox(color: Colors.black45),
                ColorBox(color: Colors.blueAccent),
                ColorBox( color: Colors.redAccent),
                ColorBox(color: Colors.greenAccent),
                ColorBox(color: Colors.yellowAccent),
                ColorBox(color: Colors.deepOrangeAccent),
                ColorBox(color: Colors.deepPurpleAccent),
                ColorBox(color: Colors.brown.withOpacity(0.2)),
                ColorBox(color: Colors.pinkAccent),
                ColorBox(color: Colors.amberAccent),
                ColorBox(color: Colors.black26),
                ColorBox(color: Colors.black38),
                ColorBox(color: Colors.black54),
              ]),
        ),

        SizedBox(
          width: 20,
        ),
        SizedBox(
          height: 40.0,
          width: 50.0,
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(2.0),
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: [
              StrokeWidth(strokeWidth: 1.0),
              StrokeWidth(strokeWidth: 2.0),
              StrokeWidth(strokeWidth: 4.0),
              StrokeWidth(strokeWidth: 6.0),
              StrokeWidth(strokeWidth: 8.0),
              StrokeWidth(strokeWidth: 10.0),

            ],
          )
        ),
        SizedBox(width: 40,),
      ],
    );
  }
}

class ColorBox extends StatelessWidget {
  final  Color color;
  const ColorBox({Key key,@required this.color}):assert(color!=null)
  ,super(key:key);
  @override
  Widget build(BuildContext context) {
    return Consumer<PaintProvider>(
      builder: (_,_paintProvider,child){
        return InkWell(
          onTap:()=>_paintProvider.setColor(color),
          child: child,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        height: 4,
        width: 4,
        decoration: BoxDecoration(
          color:color,
          border: Border.all(color:Theme.of(context).cardColor)
        ),

      ),
    );
  }
}

class StrokeWidth extends StatelessWidget {
  final double strokeWidth;
  const StrokeWidth({Key key,@required this.strokeWidth}):assert(strokeWidth!=null)
  ,super(key:key);
  @override
  Widget build(BuildContext context) {
    return Consumer<PaintProvider>(
      builder: (_,_paintProvider,child){
        return InkWell(
          onTap:()=>_paintProvider.setStrokeWidth(strokeWidth),
          child: child,
        );
      },
      child: CustomPaint(
        child: Container(
          padding: const EdgeInsets.all(2),
          height: 16,
          width: 16,
          child:CustomPaint(
            painter: LinePainter(strokeWidth: strokeWidth),
          ),
          decoration: BoxDecoration(
              color:Colors.white,
              border: Border.all(color:Theme.of(context).cardColor)
          ),

        ),
      ),
    );
  }
}





