import 'package:flutter/material.dart';
import 'package:islamy2022/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class languagebottomsheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppconfigProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage('en');
              },
              child: provider.AppLanguage == 'en'
                  ? getSelectedItemWidget('english', context)
                  : getUnSelectedItemWidget('english', context)),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.AppLanguage == 'ar'
                  ? getSelectedItemWidget('العربية', context)
                  : getUnSelectedItemWidget('العربية', context))
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Icon(
            Icons.check,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  Widget getUnSelectedItemWidget(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
