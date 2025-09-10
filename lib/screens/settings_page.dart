import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'information_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

bool darkMode = false;
double readSize = 20;
String fontType = 'Plex';
Color textColor = Colors.black;
Color backgroundColor = Colors.white;

void dark() {
  if (darkMode == true) {
    textColor = Colors.white;
    backgroundColor = Colors.black;
    if (kDebugMode) {
      print('dark mode');
    }
  } else {
    textColor = Colors.black;
    backgroundColor = Colors.white;
    if (kDebugMode) {
      print('light mode');
    }
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'الإعدادات',
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
              const SizedBox(
                height: 20,
              ),
              SwitchListTile(
                title: Text(
                  'الوضع الليلي',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontFamily: 'changa',
                    fontWeight: FontWeight.w700,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                activeThumbColor: Colors.black87,
                value: darkMode,
                controlAffinity: ListTileControlAffinity.leading,
                secondary: const Icon(
                  FontAwesomeIcons.moon,
                  color: Colors.black54,
                ),
                onChanged: (val) async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setBool('Dark', val);
                  setState(() {
                    darkMode = val;
                  });
                },
              ),
              const Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 17, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'حجم خط القراءة',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20,
                        fontFamily: 'changa',
                        fontWeight: FontWeight.w700,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(width: 15),
                    const Icon(
                      FontAwesomeIcons.textHeight,
                      color: Colors.black54,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Slider(
                  value: readSize,
                  max: 40,
                  min: 20,
                  activeColor: Colors.grey,
                  inactiveColor: Colors.grey[400],
                  divisions: 4,
                  label: readSize.round().toString(),
                  onChanged: (value) async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setDouble('Size', value);
                    setState(() {
                      readSize = value;
                    });
                  },
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 17, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'نوع خط القراءة',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20,
                        fontFamily: 'changa',
                        fontWeight: FontWeight.w700,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(width: 15),
                    const Icon(
                      FontAwesomeIcons.font,
                      color: Colors.black54,
                    )
                  ],
                ),
              ),
              RadioGroup<String>(
                groupValue: fontType,
                onChanged: (value) async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString('Type', value.toString());
                  setState(() {
                    fontType = value.toString();
                  });
                },
                child: RadioListTile<String>(
                  activeColor: Colors.grey,
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Text(
                    'بليكس  (الخط الإفتراضي)',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontFamily: 'Plex',
                      fontWeight: FontWeight.w700,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  value: 'Plex',
                ),
              ),
              RadioGroup<String>(
                groupValue: fontType,
                onChanged: (value) async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString('Type', value.toString());
                  setState(() {
                    fontType = value.toString();
                  });
                },
                child: RadioListTile<String>(
                  activeColor: Colors.grey,
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Text(
                    'الخط الأمیري',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontFamily: 'amiri',
                      fontWeight: FontWeight.w700,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  value: 'amiri',
                ),
              ),
              RadioGroup<String>(
                groupValue: fontType,
                onChanged: (value) async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString('Type', value.toString());
                  setState(() {
                    fontType = value.toString();
                  });
                },
                child: RadioListTile<String>(
                  activeColor: Colors.grey,
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Text(
                    'خط كتيبة',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontFamily: 'katibeh',
                      fontWeight: FontWeight.w700,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  value: 'katibeh',
                ),
              ),
              RadioGroup<String>(
                groupValue: fontType,
                onChanged: (value) async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString('Type', value.toString());
                  setState(() {
                    fontType = value.toString();
                  });
                },
                child: RadioListTile<String>(
                  activeColor: Colors.grey,
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Text(
                    'خط نوتو كوفي',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontFamily: 'notokufi',
                      fontWeight: FontWeight.w700,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  value: 'notokufi',
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'مزيد من الاعدادات قريبا  ( نحن نمزح )',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,
                    fontFamily: 'changa',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
