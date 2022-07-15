
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class I18nDemo extends StatefulWidget {
  const I18nDemo({Key? key}) : super(key: key);

  @override
  _I18nDemoState createState() => _I18nDemoState();
}

class _I18nDemoState extends State<I18nDemo> {

  @override
  Widget build(BuildContext context) {
    Locale  locale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("I18nDemo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locale.toString()),
            Text(Localizations.of(context, DemoLocalizations).title),
            Text(DemoLocalizations.of(context)?.title ?? "")
          ],
        ),
      ),
    );
  }
}

// Locale资源类
class DemoLocalizations{
  late  Locale locale;
  DemoLocalizations(this.locale);

  static DemoLocalizations? of(BuildContext context){
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String,Map<String,String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    }
  };

  String? get title {
    return _localized[locale.languageCode]!["title"];
  }
}

class DemoLocalizationsDelegate  extends LocalizationsDelegate<DemoLocalizations>{
  @override
  bool isSupported(Locale locale) {
     return ["en","zh"].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<DemoLocalizations> old) {
     return false;
  }

}