import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy2022/home/hades/HadesTab.dart';
import 'package:islamy2022/home/quran/Qurantab.dart';
import 'package:islamy2022/home/radio/RadioTab.dart';
import 'package:islamy2022/home/sebha/SebhaTab.dart';
import 'package:islamy2022/home/setting/setting_tab.dart';
import 'package:islamy2022/main.dart';
import 'package:islamy2022/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class homescreen extends StatefulWidget {
  static const String routename = 'homescreen';

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int currentstate = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppconfigProvider>(context);
    return Stack(
      children: [
        Center(
            child: Image.asset(
          provider.isDark()
              ? 'assets/images/imagedark.png'
              : 'assets/images/bg3.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        )),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentstate,
            onTap: (index) {
              currentstate = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/quran.png')),
                label: AppLocalizations.of(context)!.quran,
              ),
              BottomNavigationBarItem(
                backgroundColor: Mythemedata.primaryColor,
                icon: ImageIcon(
                    AssetImage('assets/images/quran-quran-svgrepo-com.png')),
                label: AppLocalizations.of(context)!.hadeth,
              ),
              BottomNavigationBarItem(
                backgroundColor: Mythemedata.primaryColor,
                icon: ImageIcon(AssetImage('assets/images/radio.png')),
                label: AppLocalizations.of(context)!.radio,
              ),
              BottomNavigationBarItem(
                backgroundColor: Mythemedata.primaryColor,
                icon: ImageIcon(AssetImage('assets/images/sebha_blue.png')),
                label: AppLocalizations.of(context)!.sebha,
              ),
              BottomNavigationBarItem(
                backgroundColor: Mythemedata.primaryColor,
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.setting,
              ),
            ],
          ),
          body: Container(
            child: views[currentstate],
          ),
        ),
      ],
    );
  }
  List<Widget> views = [
    QuranTab(),
    HadesTab(),
    RadioTab(),
    SebhaTab(),
    settingtab(),
  ];
}
