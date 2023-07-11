import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalization extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get appLocal => _locale;

  getLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _locale = const Locale('en');
      return Null;
    }
    _locale = Locale(prefs.getString('language_code') ?? "");
    return Null;
  }

  void updateLocale(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_locale == type) {
      return;
    }
    if (type == const Locale("es")) {
      _locale = const Locale("es");
      await prefs.setString('language_code', 'es');
      await prefs.setString('country_code', '');
    } else {
      _locale = const Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('country_code', 'US');
    }
    notifyListeners();
  }
}
