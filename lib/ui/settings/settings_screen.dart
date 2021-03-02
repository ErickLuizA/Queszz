import 'package:Queszz/presentation/controllers/language_controller.dart';
import 'package:Queszz/presentation/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: FlatButton(
                color: Theme.of(context).accentColor,
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                onPressed: Provider.of<ThemeController>(context).toggleTheme,
                child: Row(
                  children: [
                    Icon(
                      Icons.brightness_4,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    SizedBox(width: 10),
                    Text(
                      AppLocalizations.of(context).theme,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: FlatButton(
                color: Theme.of(context).accentColor,
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                onPressed: () {
                  PopupMenuButton(
                    onSelected: (Locale selected) {
                      Provider.of<LanguageController>(context)
                          .setLocale(selected);
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("PT-BR"),
                        value: Locale("pt", "BR"),
                      ),
                      PopupMenuItem(
                        child: Text("EN-US"),
                        value: Locale("en", "US"),
                      ),
                    ],
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    SizedBox(width: 10),
                    Text(
                      AppLocalizations.of(context).language,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}