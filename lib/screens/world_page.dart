import 'package:flutter/material.dart';
import 'package:novel/screens/settings_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'information_page.dart';

class World extends StatelessWidget {
  const World({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'العالم و تفاصيله',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'changa',
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.grey[900],
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    'أسرار غابة الخلود',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'changa',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'تابعنا على فيسبوك',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontFamily: 'changa',
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                trailing: const Icon(FontAwesomeIcons.facebook),
                onTap: () {
                  facebook();
                },
              ),
              ListTile(
                trailing: const Icon(FontAwesomeIcons.instagram),
                title: Text(
                  'تابعنا على إنستجرام',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontFamily: 'changa',
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                onTap: () {
                  instagram();
                },
              ),
              ListTile(
                trailing: const Icon(
                  FontAwesomeIcons.sliders,
                ),
                title: Text(
                  'الإعدادات',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontFamily: 'changa',
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) {
                      return const Settings();
                    },
                  ),
                ),
              ),
              ListTile(
                trailing: const Icon(FontAwesomeIcons.circleInfo),
                title: Text(
                  'حول العمل',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontFamily: 'changa',
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) {
                      return const Info();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'حول العالم',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'changa',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                alignment: Alignment.topCenter,
                child: const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
                  child: SingleChildScrollView(
                    child: Text(
                      'قريبا...',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Plex',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final Uri _url = Uri.parse('https://www.facebook.com/abderazak0');
void facebook() async {
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $_url';
  }
}

final Uri _url1 = Uri.parse('https://www.instagram.com/abderazak_achour/');
void instagram() async {
  if (!await launchUrl(_url1, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $_url1';
  }
}
