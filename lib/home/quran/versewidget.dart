import 'package:flutter/material.dart';

class versewidght extends StatelessWidget {
  String text;
  int index;

  versewidght(this.text, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text + '{${index + 1}}',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
