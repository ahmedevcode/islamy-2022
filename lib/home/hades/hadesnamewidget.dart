import 'package:flutter/material.dart';
import 'package:islamy2022/home/hades/HadesTab.dart';
import 'package:islamy2022/home/hades/hadesscreendetails.dart';

class hadeswidget extends StatelessWidget {
  hadesitem item;

  hadeswidget(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, hadesdetails.routename, arguments: item);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Text(
          item.title,
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
