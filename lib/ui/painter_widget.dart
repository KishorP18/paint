import 'package:flutter/material.dart';
import 'package:paint/dependency_injection.dart';
import 'package:paint/provider/paint_provider.dart';
import 'package:paint/provider/theme_provider.dart';
import 'package:paint/ui/paint_setting.dart';
import 'package:paint/ui/util/paint_pad.dart';
import 'package:provider/provider.dart';

class PainterWidget extends StatelessWidget {
  const PainterWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _themeProvider=Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar:AppBar(
        title: Text("Paint"),
        actions: [
          Switch(
              value: _themeProvider.isDarkThemeEnabled,
              onChanged: (bool val) => _themeProvider.setAppTheme())
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(left:40.0,right: 40.0,bottom: 40.0),
        scrollDirection: Axis.vertical,
        primary: false,
        children: [
          PaintSetting(),
          SizedBox(height: 20.0,),
          PaintPadWidget(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: RaisedButton(
          child: Text("Clear"),
          onPressed:()=>
              Provider.of<PaintProvider>(context, listen: false).clearPaint()),
    );
  }
}

class PaintPadWidget extends StatelessWidget {
  const PaintPadWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<PaintProvider>(
      builder: (context, _paintProvider, child) {
        return GestureDetector(
            onPanUpdate: (DragUpdateDetails pos) {
            _paintProvider.addPoints(pos);
            },
          child: Container(
              height: MediaQuery.of(context).size.height/1.2,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Theme.of(context).focusColor,width: 5.0)
              ),
              child: CustomPaint(painter: PaintPad(paintObject:_paintProvider.paint,
                  points: _paintProvider.points))),
        );
      },
    );
  }
}
