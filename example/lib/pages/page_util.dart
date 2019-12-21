import 'package:flutter/material.dart';

class PageUtil {
  static Widget buildSection(String title, Widget content) {
    return Column(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(246, 246, 246, 1),
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 56,
          child: Row(
            children: <Widget>[
              Text(title, style: TextStyle(color: Colors.blueGrey, fontSize: 17)),
            ],
          ),
        ),
        content
      ],
    );
  }
}