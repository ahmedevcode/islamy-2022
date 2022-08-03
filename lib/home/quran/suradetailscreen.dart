import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy2022/home/quran/versewidget.dart';

class suradetailsscreen extends StatefulWidget {
  static const String routename = 'suradetails';

  @override
  State<suradetailsscreen> createState() => _suradetailsscreenState();
}

class _suradetailsscreenState extends State<suradetailsscreen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as suradetailarg;
    if (ayat.isEmpty) readsura(arg.index);
    return Stack(children: [
      Center(
          child: Image.asset(
        'assets/images/bg3.png',
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      )),
      Scaffold(
        appBar: AppBar(
          title: Text(arg.suraname),
        ),
        body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            padding: EdgeInsets.all(15),
            child: ayat.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemBuilder: (buildContext, index) {
                      return versewidght(ayat[index], index);
                    },
                    itemCount: ayat.length,
                    separatorBuilder: (buildContext, index) {
                      return Container(
                        height: 1,
                        color: Theme.of(context).primaryColor,
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                      );
                    },
                  )),
      )
    ]);
  }

  void readsura(int index) async {
    String filename = 'assets/file/${index + 1}.txt';
    String fileContent = await rootBundle.loadString(filename);
    List<String> verses = fileContent.split('\n');
    ayat = verses;
    setState(() {});
  }
}
class suradetailarg {
  String suraname;
  int index;

  suradetailarg(this.suraname, this.index);
}
