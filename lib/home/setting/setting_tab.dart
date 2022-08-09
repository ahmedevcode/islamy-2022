import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy2022/home/setting/languagebottom_sheet.dart';
import 'package:islamy2022/home/setting/themebottom_sheet.dart';
import 'package:islamy2022/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class settingtab extends StatefulWidget {
  @override
  State<settingtab> createState() => _settingtabState();
}

class _settingtabState extends State<settingtab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppconfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.theme),
          InkWell(
            onTap: () {
              showthemdebottomsheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.Apptheme == AppLocalizations.of(context)!.light
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark),
                  Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          ),
          Text(AppLocalizations.of(context)!.language),
          InkWell(
            onTap: () {
              showlanguagebottomsheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.AppLanguage == 'en' ? 'English' : ' العربيه'),
                  Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showlanguagebottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return languagebottomsheet();
        });
  }

  void showthemdebottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return themebottomsheet();
        });
  }
}
