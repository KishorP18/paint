import 'package:flutter/material.dart';
import 'package:paint/dependency_injection.dart';
import 'package:paint/provider/paint_provider.dart';
import 'package:paint/provider/theme_provider.dart';
import 'package:paint/theme.dart';
import 'package:paint/ui/get_started.dart';
import 'package:provider/provider.dart';

import '../routes.dart';

class Home extends StatelessWidget {
  const Home({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
       ChangeNotifierProvider( create: (_)=>dependencyInjector<ThemeProvider>(),),
       ChangeNotifierProvider(create: (_) => dependencyInjector<PaintProvider>(),)

     ],
      child: Consumer<ThemeProvider>(builder: (_,themeProvider,child){
        return MaterialApp(
          title: "Paint",
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.generateRoute,
          theme: themeProvider.isDarkThemeEnabled?ThemeConst.darkThemeData:ThemeConst.lightThemeData,
          home:GetStarted(),
        );
      }),
    );
  }
}
