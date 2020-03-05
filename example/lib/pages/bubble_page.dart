import 'page_util.dart';
import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

class BubblePage extends StatefulWidget {
  static const String routeName = '/bubble';

  @override
  State<BubblePage> createState() => _BubblePageState();
}

class _BubblePageState extends State<BubblePage> {
  Widget _buildBubbleContent(double maxWidth) {
    Widget insetV = SizedBox(height: 20);
    Widget insetH = SizedBox(width: 4);
    double tWidth = maxWidth - 160;
    final TextStyle textStyle = _isDarkMode
        ? TextStyle(fontSize: 15, color: Colors.black)
        : TextStyle(fontSize: 15);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildRoundedAvatar('T'),
              insetH,
              FLBubble(
                  from: FLBubbleFrom.left,
                  backgroundColor: Colors.white,
                  child: Container(
                    width: tWidth,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: Text('Hi, I\'m Tomas Shelby, from England.',
                        style: textStyle, softWrap: true),
                  ))
            ],
          ),
          insetV,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FLBubble(
                  from: FLBubbleFrom.right,
                  backgroundColor: Color.fromRGBO(160, 231, 90, 1),
                  child: Container(
                    width: tWidth,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: Text(
                        'Hi, I\'m FLUI, a widget kit for Google Flutter.',
                        style: textStyle,
                        softWrap: true),
                  )),
              insetH,
              _buildRoundedAvatar('F'),
            ],
          ),
          insetV,
          Row(
            children: <Widget>[
              _buildRoundedAvatar('T'),
              insetH,
              FLBubble(
                  from: FLBubbleFrom.left,
                  backgroundColor: Colors.white,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: tWidth),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: Text(
                        'I know, Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
                        style: textStyle,
                        softWrap: true),
                  ))
            ],
          ),
          insetV,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FLBubble(
                  from: FLBubbleFrom.right,
                  backgroundColor: Color.fromRGBO(160, 231, 90, 1),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: tWidth),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: Text('Exactly!', style: textStyle, softWrap: true),
                  )),
              insetH,
              _buildRoundedAvatar('F'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoundedAvatar(String alpha) {
    return FLAvatar(
      text: alpha,
      textStyle: TextStyle(color: Colors.white, fontSize: 18),
      width: 50,
      height: 50,
      color: Color(0xFF4F6BED),
    );
  }

  Widget _buildBubbleMenuContent() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          FLBubbleMenuWidget(
            interaction: FLBubbleMenuInteraction.tap,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).primaryColor),
              width: 240,
              height: 40,
              child: Center(
                child: Text('Tap to show menu',
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
            ),
            itemBuilder: (BuildContext context) {
              return [
                FLBubbleMenuItem(
                  text: 'item 1',
                  value: 'item 1',
                ),
                FLBubbleMenuItem(
                  text: 'item 2',
                  value: 'item 2',
                ),
                FLBubbleMenuItem(
                  text: 'item 3',
                  value: 'item 3',
                ),
              ];
            },
            onSelected: (value) => FLToast.showText(
                text: 'Select - $value', position: FLToastPosition.bottom),
            onCancelled: () => FLToast.showText(
                text: 'Canceled', position: FLToastPosition.bottom),
          ),
          SizedBox(height: 20),
          FLBubbleMenuWidget(
            offset: Offset(100, 0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).primaryColor),
              width: 240,
              height: 40,
              child: Center(
                child: Text('Long press to show menu',
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
            ),
            itemBuilder: (BuildContext context) {
              return [
                FLBubbleMenuItem(
                  text: 'item 1',
                  value: 'item 1',
                ),
                FLBubbleMenuItem(
                  text: 'item 2',
                  value: 'item 2',
                ),
              ];
            },
            onSelected: (value) => FLToast.showText(
                text: 'Select - $value', position: FLToastPosition.bottom),
            onCancelled: () => FLToast.showText(
                text: 'Canceled', position: FLToastPosition.bottom),
          ),
        ],
      ),
    );
  }

  bool get _isDarkMode {
    return Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final double width = queryData.size.width;
    final bool isDarkMode = _isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bubble'),
      ),
      body: Container(
        color: isDarkMode ? Colors.transparent : Color(0xFFDEEEEEE),
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            PageUtil.buildSection(
                'Bubble', _buildBubbleContent(width), context),
            PageUtil.buildSection(
                'Bubble Menu', _buildBubbleMenuContent(), context),
          ],
        ),
      ),
    );
  }
}
