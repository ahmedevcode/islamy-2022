import 'package:flutter/material.dart';
import 'package:islamy2022/home/quran/suradetailscreen.dart';

class suranamewidget extends StatelessWidget {
  late String suraname;
  late int index;

  suranamewidget(this.suraname, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, suradetailsscreen.routename,
            arguments: suradetailarg(suraname, index));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          suraname,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
