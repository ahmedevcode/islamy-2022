import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy2022/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class themebottomsheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppconfigProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.isDark()
                  ? getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.light, context)
                  : getSelectedItemWidget(
                      AppLocalizations.of(context)!.light, context)),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.isDark()
                  ? getSelectedItemWidget(
                      AppLocalizations.of(context)!.dark, context)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.dark, context))
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
