import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
                const Text(
                  'Valyutalar kursi',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(height: 20),
                _drawerItem(
                  FlutterRemix.google_play_line,
                  'Play marketda baholang',
                  () {
                    debugPrint('Play market tapped');
                    launchUrl(
                      Uri.parse(
                        'https://play.google.com/store/apps/details?id=uz.mobile.currencymvvm',
                      ),
                    );
                  },
                ),
                _drawerItem(
                  FlutterRemix.github_line,
                  'Dastur kodlari',
                  () {},
                ),
                _drawerItem(
                  FlutterRemix.telegram_line,
                  'Telegram kanalimiz',
                  () {},
                ),
                _drawerItem(
                  FlutterRemix.facebook_line,
                  'Biz Facebookda',
                  () {},
                ),
                _drawerItem(
                  FlutterRemix.twitter_line,
                  'Biz Twitterda',
                  () {},
                ),
                _drawerItem(
                  FlutterRemix.instagram_line,
                  'Biz Instagramda',
                  () {},
                ),
                _drawerItem(
                  FlutterRemix.chat_1_line,
                  'Fikr mulohaza',
                  () {},
                ),
                _drawerItem(
                  FlutterRemix.information_line,
                  'Dastur haqida',
                  () {},
                ),
              ],
            ),
            const Padding(
              padding: const EdgeInsets.only(bottom: 20),
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
