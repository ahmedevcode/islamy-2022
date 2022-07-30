import 'package:flutter/material.dart';
import 'package:islamy2022/home/homescreen.dart';
import 'package:islamy2022/home/quran/suradetailscreen.dart';

void main() {
  runApp(MainApplication());
}

class Mythemedata {
  static const Color primaryColor = Color.fromARGB(255, 169, 139, 95);
  static const Color secondColor = Color.fromARGB(255, 174, 175, 178);

  static final ThemeData lighttheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: Mythemedata.primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ));
  static final ThemeData darktheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: Mythemedata.primaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 30,
          )));
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'islamy',
      theme: Mythemedata.lighttheme,
      darkTheme: Mythemedata.darktheme,
      routes: {
        homescreen.routename: (buildContext) => homescreen(),
        suradetailsscreen.routename: (buildcontext) => suradetailsscreen(),
      },
      initialRoute: homescreen.routename,
    );
  }
}
