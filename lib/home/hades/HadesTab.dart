import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy2022/home/hades/hadesnamewidget.dart';

class HadesTab extends StatefulWidget {
  @override
  State<HadesTab> createState() => _HadesTabState();
}

class _HadesTabState extends State<HadesTab> {
  @override
  Widget build(BuildContext context) {
    if (allhadesitems.isEmpty) loadhadesfile();
    return Column(
      children: [
        Expanded(flex: 1, child: Image.asset('assets/images/hades.png')),
        Expanded(
            flex: 3,
            child: allhadesitems.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemBuilder: (buildContext, index) {
                      return hadeswidget(allhadesitems[index]);
                    },
                    itemCount: allhadesitems.length,
                    separatorBuilder: (buildContext, index) {
                      return Container(
                        color: Theme.of(context).primaryColor,
                        height: 1,
                        margin: EdgeInsets.symmetric(vertical: 24),
                      );
                    },
                  )),
      ],
    );
  }

  List<hadesitem> allhadesitems = [];

  void loadhadesfile() async {
    List<hadesitem> allhadesdata = [];
    String filecontent = await rootBundle.loadString('assets/file/ahadeth.txt');
    List<String> allHades = filecontent.split('#\r\n');
    for (int i = 0; i < allHades.length; i++) {
      List<String> singlehadethContent = allHades[i].split('\n');
      String title = singlehadethContent[0];
      String content = '';
      for (int j = 1; j < singlehadethContent.length; j++) {
        content += singlehadethContent[j] + '';
      }
      hadesitem item = hadesitem(title, content);
      allhadesdata.add(item);
    }
    allhadesitems = allhadesdata;
    setState(() {});
  }
}

class hadesitem {
  String title;
  String content;

  hadesitem(this.title, this.content);
}
