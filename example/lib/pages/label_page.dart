import 'page_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flui/flui.dart';

class LabelPage extends StatefulWidget {
  static const String routeName = '/label';

  @override
  State<LabelPage> createState() => _LabelPageState();
}

class _LabelPageState extends State<LabelPage> {
  String _clipboardStr = '';

  Widget _buildCopyLabelContent() {
    String copyableStr = 'This is a copyable label';
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        FLCopyableLabel(
          copyData: copyableStr,
          showMenu: true,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(copyableStr, style: TextStyle(fontSize: 17)),
          ),
          afterCopyCallback: _showPasteBoardValue,
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text('Current clipboard text is \n $_clipboardStr',
              style: TextStyle(fontSize: 15)),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildMarqueeLabelContent() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            FLMarqueeLabel(
              text:
                  'Notice: For Flutter 1.9 or above, you can use SelectableText to support copy function',
            ),
            SizedBox(height: 10),
            FLMarqueeLabel(
              text: 'Notice: FLUI is a widget kit for Google Flutter',
              style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              velocity: 1,
              space: 150,
            ),
            SizedBox(height: 10),
            FLMarqueeLabel(
              text: 'Notice: This is a notification',
              style: TextStyle(color: Colors.lightGreen, fontSize: 16),
              loop: false,
              velocity: 0.7,
            ),
            SizedBox(height: 10),
          ],
        ));
  }

  void _showPasteBoardValue() {
    Clipboard.getData('text/plain').then((ClipboardData data) {
      setState(() => _clipboardStr = data.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Labels'),
          centerTitle: true,
        ),
        body: Container(
            width: screenWidth,
            height: screenHeight,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                PageUtil.buildSection(
                    'Copyable Label', _buildCopyLabelContent(), context),
                PageUtil.buildSection(
                    'Marquee Label', _buildMarqueeLabelContent(), context)
              ],
            )));
  }
}
