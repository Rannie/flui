import 'package:flutter/material.dart';

class PageUtil {
  static Widget buildSection(
      String title, Widget content, BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final bool isDarkMode = brightness == Brightness.dark;
    final Color backgroundColor =
        isDarkMode ? Color(0xFF323135) : Color.fromRGBO(246, 246, 246, 1);
    final Color textColor = isDarkMode ? Colors.white : Colors.blueGrey;
    return Column(
      children: <Widget>[
        Container(
          color: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 56,
          child: Row(
            children: <Widget>[
              Text(title, style: TextStyle(color: textColor, fontSize: 17)),
            ],
          ),
        ),
        content
      ],
    );
  }
}
