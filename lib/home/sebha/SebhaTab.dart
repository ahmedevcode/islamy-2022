import 'dart:math' as maths;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy2022/main.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  List<String> tasbehlist = [
    'سبحان الله',
    'الحمد لله ',
    'الله اكبر ',
    'استغفر الله العظيم '
  ];
  int currentindex = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              InkWell(
                onTap: clickshephacounter,
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1),
                  child: Transform.rotate(
                      angle: maths.pi / 180 * angle,
                      child:
                          Image.asset('assets/images/body of seb7a-logo.png')),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.06),
                child: Image.asset('assets/images/head of seb7a_logo.png'),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'عدد التسبيحات',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Mythemedata.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Mythemedata.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tasbehlist[currentindex],
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void clickshephacounter() {
    setState(() {
      counter++;
      angle += 30;
      if (counter % 33 == 0) {
        if (currentindex == 3) {
          currentindex = 0;
        }
        currentindex++;
      }
    });
  }
}
