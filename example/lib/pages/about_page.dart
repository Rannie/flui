import 'package:flutter/material.dart';
import 'package:flui/flui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:example/util.dart';

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  Widget _headerView() {
    return Column(
      children: <Widget>[
        SizedBox(height: 60),
        Image.asset('assets/logo_trans.png', scale: 3.4),
        SizedBox(height: 10),
        Text('FLUI',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w500, letterSpacing: 6)),
        SizedBox(height: 45),
        Text('version: 0.8.0',
            style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
        SizedBox(height: 40),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeMode themeMode = Util.themeMode;
    bool isDarkMode;
    if (themeMode == ThemeMode.light || themeMode == ThemeMode.dark) {
      isDarkMode = themeMode == ThemeMode.dark;
    } else {
      isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    }
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
      appBar: AppBar(
        title: Text('About', style: TextStyle(letterSpacing: 2)),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.separated(
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return _headerView();
              } else if (index == 1) {
                return FLListTile(
                  title: Text('Dark Mode'),
                  trailing: Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      if (value == true)
                        Util.setThemeMode(ThemeMode.dark);
                      else
                        Util.setThemeMode(ThemeMode.light);
                      Util.eventBus.fire('theme');
                      setState(() {});
                    },
                  ),
                );
              } else if (index == 2) {
                return FLListTile(
                  title: Text('Force RTL'),
                  trailing: Switch(
                    value: isRtl,
                    onChanged: (value) {
                      if (value == true)
                        Util.setTextDirection(TextDirection.rtl);
                      else
                        Util.setTextDirection(TextDirection.ltr);
                      Util.eventBus.fire('direction');
                      setState(() {});
                    },
                  ),
                );
              } else if (index == 3) {
                return FLListTile(
                  title: Text('Site'),
                  trailing: Icon(isRtl
                      ? Icons.keyboard_arrow_left
                      : Icons.keyboard_arrow_right),
                  onTap: () {
                    const siteUrl = 'https://www.flui.xin/en/';
                    canLaunch(siteUrl).then((canOpen) {
                      launch(siteUrl, forceSafariVC: false);
                    });
                  },
                );
              } else if (index == 4) {
                return FLListTile(
                  title: Text('GitHub'),
                  trailing: Icon(isRtl
                      ? Icons.keyboard_arrow_left
                      : Icons.keyboard_arrow_right),
                  onTap: () {
                    const siteUrl = 'https://github.com/Rannie/flui';
                    canLaunch(siteUrl).then((canOpen) {
                      launch(siteUrl, forceSafariVC: false);
                    });
                  },
                );
              }
              return null;
            },
            separatorBuilder: (context, index) {
              return Divider(height: 1);
            }),
      ),
    );
  }
}
