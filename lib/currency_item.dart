import 'package:currency_converter/app_helpers.dart';
import 'package:currency_converter/converter_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'currency.dart';

class CurrencyItem extends StatelessWidget {
  final Currency currency;
  final String locale;
  final DateTime selectedDate;

  const CurrencyItem({
    super.key,
    required this.currency,
    required this.locale,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ConverterPage(
              currency: currency,
              locale: locale,
              selectedDate: selectedDate,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white.withOpacity(0.3),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                AppHelpers.getCurrencyTitleByLocale(currency, locale),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  NumberFormat.currency(symbol: 'UZS')
                      .format(double.tryParse('${currency.rate}')),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  '${(currency.diff?.startsWith('-') ?? false) ? currency.diff : '+${currency.diff}'}',
                  style: TextStyle(
                    color: (currency.diff?.startsWith('-') ?? false)
                        ? Colors.red
                        : Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 10),
                (currency.diff?.startsWith('-') ?? false)
                    ? const Icon(
                        Icons.south_east,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.north_east,
                        color: Colors.green,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
