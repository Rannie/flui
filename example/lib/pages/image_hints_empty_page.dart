import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

class ImageHintsEmptyPage extends StatefulWidget {
  static const String routeName = '/image-hints-empty';
  @override
  State<ImageHintsEmptyPage> createState() => _ImageHintsEmptyPageState();
}

class _ImageHintsEmptyPageState extends State<ImageHintsEmptyPage> {
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final String imgPath = isDarkMode ? 'assets/no_data_dark.png' : 'assets/nodata.png';
    return Scaffold(
      appBar: AppBar(
        title: Text('Image & Hints'),
      ),
      body: FLEmptyContainer(
        image: Image.asset(imgPath),
        title: 'No Data',
      ),
    );
  }
}