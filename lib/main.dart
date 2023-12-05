

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxy/MainScreen.dart';
import 'package:galaxy/Providerclass.dart';
import 'package:galaxy/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences=await SharedPreferences.getInstance();
  bool isDark=preferences.getBool('AppTheme')??false;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: isDark?Brightness.dark:Brightness.light
  ));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>ThemeProvider(isDark: isDark))
  ],
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: (Provider.of<ThemeProvider>(context).isDark)? ThemeMode.dark:ThemeMode.light,
      home:SplashScreen()
    );
  }
}

