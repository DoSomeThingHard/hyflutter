import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'localizations.dart';

class HYLocalizationsDelegate extends LocalizationsDelegate<HYLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<HYLocalizations> old) {
    return false;
  }

  @override
  Future<HYLocalizations> load(Locale locale) {
    // 由于我们的数据是写死的，直接返回一个同步的Future就行了
    return SynchronousFuture(HYLocalizations(locale));
  }

  static HYLocalizationsDelegate delegate = HYLocalizationsDelegate();
}