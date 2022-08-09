import 'package:flutter/material.dart';
import 'package:islamy2022/home/hades/HadesTab.dart';

class hadesdetails extends StatelessWidget {
  static const String routename = 'hadesdetails';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as hadesitem;
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
          title: Text(args.title),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(vertical: 40, horizontal: 48),
          child: SingleChildScrollView(child: Text(args.content)),
        ),
      ),
    ]);
  }
}
