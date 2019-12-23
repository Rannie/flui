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
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Image img = isDarkMode
        ? Image.asset(
            'assets/no_data_dark.png',
            scale: 1.7,
          )
        : Image.asset('assets/nodata.png');

    return Scaffold(
      appBar: AppBar(
        title: Text('Image & Hints'),
      ),
      body: FLEmptyContainer(
        image: img,
        title: 'No Data',
      ),
    );
  }
}
