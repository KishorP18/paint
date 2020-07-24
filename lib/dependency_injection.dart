import 'package:get_it/get_it.dart';
import 'package:paint/provider/paint_provider.dart';
import 'package:paint/provider/theme_provider.dart';

GetIt dependencyInjector=GetIt.instance;

/// This method sets up the objects
/// using [GetIt] so that the instance of the
/// of object listed can be accessed throughout the app.
void setupLocator(){
   dependencyInjector.registerSingleton<ThemeProvider>(ThemeProvider());
   dependencyInjector.registerSingleton<PaintProvider>(PaintProvider());
}