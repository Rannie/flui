import 'package:example/empty.dart';
import 'package:flutter/material.dart';

class ImageHintsEmptyPage extends StatefulWidget {
  static const String routeName = '/image-hints-empty';
  @override
  State<ImageHintsEmptyPage> createState() => _ImageHintsEmptyPageState();
}

class _ImageHintsEmptyPageState extends State<ImageHintsEmptyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image & Hints'),
      ),
      body: FLEmptyContainer(
        image: Image.asset('assets/nodata.png'),
        title: 'No Data',
      ),
    );
  }
}