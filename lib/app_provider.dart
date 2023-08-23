import 'package:flutter/material.dart';

import 'local_source.dart';

class AppProvider extends ChangeNotifier {
  Locale? get locale {
    final String script = LocalSource.instance.getScriptCode();
    final String code = LocalSource.instance.getLocaleCode();
    if (script.isEmpty) {
      return Locale.fromSubtags(languageCode: code);
    } else {
      return Locale.fromSubtags(languageCode: code, scriptCode: script);
    }
  }

  void setLocale(String languageCode, String? scriptCode) {
    LocalSource.instance.setLocaleCode(localeCode: languageCode);
    LocalSource.instance.setLocaleScriptCode(scriptCode ?? '');
    notifyListeners();
  }

  void clearLocale() {
    LocalSource.instance.clear();
    notifyListeners();
  }
}
