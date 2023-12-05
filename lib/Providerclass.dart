import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  bool isDark;

  ThemeProvider({required this.isDark});
  ChangeTheme()async{
    isDark=!isDark;
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setBool("AppTheme", isDark);
    notifyListeners();
  }
}
