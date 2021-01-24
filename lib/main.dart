import 'package:flutter/material.dart';
import 'package:news_app/Home_Tabs/homescreen.dart';
import 'package:news_app/screens/onborading.dart';
import 'package:news_app/utilites/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';



main() async {
    WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool( 'seen' );
  Widget _screen;
  if( seen == null || seen == false ){
    _screen = OnBorading();
  }else{
    _screen = HomeScreen();
  }
  runApp( NewsApp( _screen ) );
}

class NewsApp extends StatelessWidget {
  final Widget _screen;
  NewsApp(this._screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: this._screen,
    );
  }
}