import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String _locale = 'uz';

  Locale get locale => Locale(_locale);

  void setLocale(String locale) {
    _locale = locale;
    notifyListeners();
  }
}
