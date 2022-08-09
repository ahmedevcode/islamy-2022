import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy2022/home/hades/hadesscreendetails.dart';
import 'package:islamy2022/home/homescreen.dart';
import 'package:islamy2022/home/quran/suradetailscreen.dart';
import 'package:islamy2022/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) {
        return AppconfigProvider();
      },
      child: MainApplication()));
}

class Mythemedata {
  static const Color primaryColor = Color.fromARGB(255, 169, 139, 95);
  static const Color darkColor = Color.fromARGB(255, 17, 23, 40);
  static const Color accentcolor = Color.fromARGB(255, 250, 204, 29);

  static final ThemeData lighttheme = ThemeData(
      primaryTextTheme:
          TextTheme(headline4: TextStyle(color: Colors.black, fontSize: 24)),
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
      primaryTextTheme:
          TextTheme(headline4: TextStyle(color: Colors.white, fontSize: 24)),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: Mythemedata.darkColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Mythemedata.accentcolor,
        unselectedItemColor: Colors.white,
      ));
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var provider = Provider.of<AppconfigProvider>(context);
    return MaterialApp(
      title: 'islamy',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.AppLanguage),
      theme: Mythemedata.lighttheme,
      themeMode: provider.Apptheme,
      darkTheme: Mythemedata.darktheme,
      routes: {
        homescreen.routename: (buildContext) => homescreen(),
        suradetailsscreen.routename: (buildcontext) => suradetailsscreen(),
        hadesdetails.routename: (buildContext) => hadesdetails(),
      },
      initialRoute: homescreen.routename,
    );
  }
}
