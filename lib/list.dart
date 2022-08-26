import 'package:flutter/material.dart';
import 'package:hello/banner%20ad%20model.dart';
import 'package:hello/settings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ListCard.dart';
import 'data.dart';
import 'info.dart';
import 'home.dart';

class List extends StatelessWidget {
  const List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text(
                      'قائمة الفصول',
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
                  body: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("image/forest2.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [...allChapter.map((e) => ListCard(room: e))],
                            ),
                          ),
                          const AdBanner(),
                        ],
                      )),
                )));
  }
}
