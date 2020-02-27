import 'page_util.dart';
import 'package:flutter/material.dart';
import 'package:flui/flui.dart';

class AvatarPage extends StatefulWidget {
  static const String routeName = '/avatar';
  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  Widget _buildImageAvatars() {
    Widget inset = SizedBox(width: 20);
    return Container(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            children: <Widget>[
              inset,
              FLAvatar(
                image: Image.asset('assets/avatar.jpg'),
                width: 100,
                height: 100,
              ),
              inset,
              FLAvatar(
                image: Image.asset('assets/avatar.jpg', scale: 2),
                width: 75,
                height: 75,
                radius: 10,
              ),
              inset,
              FLAvatar(
                image: Image.asset('assets/avatar.jpg', scale: 2),
                width: 75,
                height: 75,
              ),
              inset,
              FLAvatar(
                image: Image.asset('assets/avatar.jpg', scale: 2.4),
                width: 50,
                height: 50,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildNameAvatars() {
    return Container(
      height: 500,
      child: GridView(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 1.0,
          ),
          children: <Widget>[
            Container(
              child: Center(
                child: FLAvatar(
                  color: Color(0xFFD13438),
                  width: 50,
                  height: 50,
                  text: 'CE',
                  textStyle: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            Container(
              child: Center(
                child: FLAvatar(
                  color: Color(0xFF498205),
                  width: 50,
                  height: 50,
                  text: 'CE',
                  textStyle: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            Container(
              child: Center(
                child: FLAvatar(
                  color: Color(0xFF0078D4),
                  width: 50,
                  height: 50,
                  text: 'CE',
                  textStyle: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            Container(
              child: Center(
                child: FLAvatar(
                  color: Color(0xFFC23983),
                  width: 50,
                  height: 50,
                  text: 'CE',
                  textStyle: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            Container(
              child: Center(
                child: FLAvatar(
                  color: Color(0xFF603D30),
                  width: 50,
                  height: 50,
                  text: 'CE',
                  textStyle: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            Container(
              child: Center(
                child: FLAvatar(
                  color: Color(0xFF567C73),
                  width: 50,
                  height: 50,
                  text: 'CE',
                  textStyle: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            Container(
              child: Center(
                child: FLAvatar(
                  color: Color(0xFFCA5010),
                  width: 50,
                  height: 50,
                  text: 'CE',
                  textStyle: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            Container(
              child: Center(
                child: FLAvatar(
                  color: Color(0xFF69797E),
                  width: 50,
                  height: 50,
                  text: 'CE',
                  textStyle: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            Container(
              child: Center(
                child: FLAvatar(
                  color: Color(0xFF4F6BED),
                  width: 50,
                  height: 50,
                  radius: 5,
                  text: 'CE',
                  textStyle: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            Container(
              child: Center(
                child: FLAvatar(
                  color: Color(0xFF881798),
                  width: 50,
                  height: 50,
                  radius: 5,
                  text: 'CE',
                  textStyle: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            PageUtil.buildSection(
                'Image Avatars', _buildImageAvatars(), context),
            PageUtil.buildSection('Name Avatars', _buildNameAvatars(), context),
          ],
        ),
      ),
    );
  }
}
