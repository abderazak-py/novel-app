import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screens/home_page.dart';

final Uri fbUrl = Uri.parse('https://www.facebook.com/abderazak0');
final Uri igUrl = Uri.parse('https://www.instagram.com/abderazak_achour/');

void main() {
  runApp(const Home());
}



Future<void> facebook() async {
  await launchUrl(fbUrl, mode: LaunchMode.externalApplication);
}

Future<void> instagram() async {
  await launchUrl(igUrl, mode: LaunchMode.externalApplication);
}

//flutter run -d chrome --web-renderer canvaskit