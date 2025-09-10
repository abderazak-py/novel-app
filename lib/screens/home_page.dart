import 'package:flutter/material.dart';
import 'package:novel/screens/characters_page.dart';
import 'package:novel/screens/information_page.dart';
import 'package:novel/screens/list_page.dart';
import 'package:novel/screens/settings_page.dart';
import 'package:novel/screens/world_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/select_page_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getSelectedPref();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'الصفحة الرئيسية',
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
                image: AssetImage("image/forest1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'image/main.jpg',
                          width: 330,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: const Text(
                          'Eternity Forest',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'josef',
                          ),
                        ),
                      ),
                      const SelectPageCard(
                        text: 'إقرأ الرواية',
                        icon: FontAwesomeIcons.book,
                        toPage: List(),
                      ),
                      const SelectPageCard(
                          text: 'تعرف على الشخصيات',
                          icon: FontAwesomeIcons.peopleGroup,
                          toPage: Character()),
                      const SelectPageCard(
                          text: 'العالم و تفاصيله',
                          icon: FontAwesomeIcons.earthAfrica,
                          toPage: World()), 
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getSelectedPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      darkMode = pref.getBool('Dark') ?? false;
      readSize = pref.getDouble('Size') ?? 20;
      fontType = pref.getString('Type') ?? 'Plex';
    });
  }
}
