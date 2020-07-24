import 'package:paint/shared_pref_const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  bool _isDarkThemeEnabled=true;
  bool get isDarkThemeEnabled=>_isDarkThemeEnabled;

  ThemeProvider(){
    getAppTheme();
  }

  Future<void> setAppTheme()async{
     SharedPreferences _sharedPreferences=await SharedPreferences.getInstance();
     _isDarkThemeEnabled^=true;
   await  _sharedPreferences.setBool(SharedPrefConst.isDarkThemeEnabled, _isDarkThemeEnabled);
   await  getAppTheme();
  }


  Future<void> getAppTheme()async{
    SharedPreferences _sharedPreferences=await SharedPreferences.getInstance();
    _isDarkThemeEnabled=_sharedPreferences.getBool(SharedPrefConst.isDarkThemeEnabled)??false;
    notifyListeners();
  }


}