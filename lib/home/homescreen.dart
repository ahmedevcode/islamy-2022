import 'package:flutter/material.dart';
import 'package:islamy2022/home/hades/HadesTab.dart';
import 'package:islamy2022/home/quran/Qurantab.dart';
import 'package:islamy2022/home/radio/RadioTab.dart';
import 'package:islamy2022/home/sebha/SebhaTab.dart';
import 'package:islamy2022/main.dart';

class homescreen extends StatefulWidget {
  static const String routename = 'homescreen';

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int currentstate = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: Image.asset(
          'assets/images/bg3.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        )),
        Scaffold(
          appBar: AppBar(
            title: Text('islamy'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentstate,
            onTap: (index) {
              currentstate = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: Mythemedata.primaryColor,
                icon: ImageIcon(AssetImage('assets/images/quran.png')),
                label: 'القرءان',
              ),
              BottomNavigationBarItem(
                backgroundColor: Mythemedata.primaryColor,
                icon: ImageIcon(
                    AssetImage('assets/images/quran-quran-svgrepo-com.png')),
                label: 'الاحاديث',
              ),
              BottomNavigationBarItem(
                backgroundColor: Mythemedata.primaryColor,
                icon: ImageIcon(AssetImage('assets/images/radio.png')),
                label: 'الراديو',
              ),
              BottomNavigationBarItem(
                backgroundColor: Mythemedata.primaryColor,
                icon: ImageIcon(AssetImage('assets/images/sebha_blue.png')),
                label: 'shebha',
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
  ];
}
