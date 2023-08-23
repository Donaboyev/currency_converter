import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00D0CE),
              Color(0xFF82E5BA),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/currency.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 20),
                Text(
                  '${translate?.currencyConverter}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                _drawerItem(
                  FlutterRemix.google_play_line,
                  '${translate?.rateOnPlayMarket}',
                  () {
                    launchUrl(
                      Uri.parse(
                        'https://play.google.com/store/apps/details?id=uz.mobile.currencymvvm',
                      ),
                    );
                  },
                ),
                _drawerItem(
                  FlutterRemix.github_line,
                  '${translate?.sourceCode}',
                  () {
                    launchUrl(
                      Uri.parse(
                        'https://github.com/Donaboyev/currency_converter',
                      ),
                    );
                  },
                ),
                _drawerItem(
                  FlutterRemix.telegram_line,
                  '${translate?.telegramChannel}',
                  () {
                    launchUrl(
                      Uri.parse(
                        'https://t.me/android_projects',
                      ),
                    );
                  },
                ),
                _drawerItem(
                  FlutterRemix.facebook_line,
                  '${translate?.facebook}',
                  () {
                    launchUrl(
                      Uri.parse(
                        'https://www.facebook.com/abbos.donaboyev.3',
                      ),
                    );
                  },
                ),
                _drawerItem(
                  FlutterRemix.twitter_line,
                  '${translate?.twitter}',
                  () {
                    launchUrl(
                      Uri.parse(
                        'https://twitter.com/abbosdonaboyev',
                      ),
                    );
                  },
                ),
                _drawerItem(
                  FlutterRemix.instagram_line,
                  '${translate?.instagram}',
                  () {
                    launchUrl(
                      Uri.parse(
                        'https://www.instagram.com/abbos_donaboyev/',
                      ),
                    );
                  },
                ),
                _drawerItem(
                  FlutterRemix.chat_1_line,
                  '${translate?.feedback}',
                  () {
                    launchUrl(
                      Uri.parse(
                        'https://t.me/abbosdonaboyev',
                      ),
                    );
                  },
                ),
                _drawerItem(
                  FlutterRemix.information_line,
                  '${translate?.about}',
                  () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF00D0CE),
                                  Color(0xFF82E5BA),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Valyutalar kursi',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'v1.0.0',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text:
                                        'O\'zbekiston Respublikasi Markaziy banki',
                                    style: const TextStyle(
                                      color: Color(0xFF007C70),
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        launchUrl(Uri.parse('https://cbu.uz'));
                                      },
                                    children: [
                                      const TextSpan(
                                        text:
                                            ' ochiq ma\'lumotlari asosida tayyorlangan. Dastur ochiq kodli bo\'lib, ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Apache License',
                                        style: const TextStyle(
                                          color: Color(0xFF007C70),
                                          fontSize: 16,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            launchUrl(Uri.parse(
                                                'https://www.apache.org'));
                                          },
                                      ),
                                      const TextSpan(
                                        text: ' asosida tarqatiladi.',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                const Text(
                                  '© Abbos Donaboyev',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: const Color(0xFF81D6C3),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                '©ABBOS',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(IconData iconData, String title, Function() onPressed) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(iconData, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
