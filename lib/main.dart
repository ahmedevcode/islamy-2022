import 'package:flutter/material.dart';
import 'package:islamy2022/homescreen.dart';

void main() {}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'islamy',
      routes: {
        homescreen.routename: (buildContext) => homescreen(),
      },
      initialRoute: homescreen.routename,
    );
  }
}
