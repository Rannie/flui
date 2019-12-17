import 'package:example/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  Widget _headerView() {
    return Column(
      children: <Widget>[
        SizedBox(height: 60),
        Image.asset('assets/logop.png'),
        SizedBox(height: 20),
        Text('version: 0.7.0', style: TextStyle(fontSize: 16, color: Colors.black.withAlpha(160)), textAlign: TextAlign.center),
        SizedBox(height: 40),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.separated(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _headerView();
            }
            else if (index == 1) {
              return FLListTile(
                title: Text('Site'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  const siteUrl = 'https://www.flui.xin/en/';
                  canLaunch(siteUrl).then((canOpen) {
                    launch(siteUrl);
                  });
                },
              );
            }
            else if (index == 2) {
              return FLListTile(
                title: Text('GitHub'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  const siteUrl = 'https://github.com/Rannie/flui';
                  canLaunch(siteUrl).then((canOpen) {
                    launch(siteUrl);
                  });
                },
              );
            }
            return null;
          },
          separatorBuilder: (context, index) {
            return Divider(height: 1);
          }
        ),
      ),
    );
  }
}
