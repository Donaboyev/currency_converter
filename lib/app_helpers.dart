import 'currency.dart';

class AppHelpers {
  static String getFormattedDate(DateTime date) {
    return '${date.year}-${date.month > 9 ? date.month : "0${date.month}"}-${date.day > 9 ? date.day : "0${date.day}"}';
  }

  static String getCurrencyTitleByLocale(Currency currency, String locale) {
    switch(locale) {
      case 'en':
        return '${currency.ccyNmEN}';
      case 'ru':
        return '${currency.ccyNmRU}';
      default:
        return '${currency.ccyNmUZ}';
    }
  }
}
