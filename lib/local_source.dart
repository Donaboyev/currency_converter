import 'package:shared_preferences/shared_preferences.dart';

class LocalSource {
  static SharedPreferences? _preferences;

  LocalSource._();

  static LocalSource? _localSource;

  static LocalSource instance = LocalSource._();

  static Future<LocalSource> getInstance() async {
    if (_localSource == null) {
      _localSource = LocalSource._();
      await _localSource!._init();
    }
    return _localSource!;
  }

  static Future<SharedPreferences> getSharedPreferences() async {
    if (_preferences == null) {
      _localSource = LocalSource._();
      await _localSource!._init();
    }
    return _preferences!;
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setLocaleCode({required String localeCode}) async {
    if (_preferences != null) {
      await _preferences!.setString('keyLocaleCode', localeCode);
    }
  }

  String getLocaleCode() => _preferences?.getString('keyLocaleCode') ?? 'en';

  Future<void> setLocaleScriptCode(String script) async =>
      await _preferences?.setString('keyLocaleScriptCode', script);

  String getScriptCode() => _preferences?.getString('keyLocaleScriptCode') ?? '';

  Future<void> clear() async {
    await _preferences!.clear();
  }
}
