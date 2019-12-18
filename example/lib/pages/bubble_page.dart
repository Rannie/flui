import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

class BubblePage extends StatefulWidget {
  static const String routeName = '/bubble';

  @override
  State<BubblePage> createState() => _BubblePageState();
}

class _BubblePageState extends State<BubblePage> {
  Widget _buildSection(String title, Widget content) {
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

  Widget _buildBubbleContent(double maxWidth) {
    Widget insetV = SizedBox(height: 20);
    Widget insetH = SizedBox(width: 4);
    double tWidth = maxWidth - 160;
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
                  child: Text('Hi, I\'m Tomas Shelby, from England.', style: TextStyle(fontSize: 15), softWrap: true),
                )
              )
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
                    child: Text('Hi, I\'m FLUI, a widget kit for Google Flutter.', style: TextStyle(fontSize: 15), softWrap: true),
                  )
              ),
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
                    child: Text('I know, Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.', style: TextStyle(fontSize: 15), softWrap: true),
                  )
              )
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
                    child: Text('Exactly!', style: TextStyle(fontSize: 15), softWrap: true),
                  )
              ),
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
                  color: Color(0xFF0F4C81)
              ),
              width: 240,
              height: 40,
              child: Center(
                child: Text('Tap to show menu', style: TextStyle(fontSize: 17, color: Colors.white)),
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
            onSelected: (value) => FLToast.showText(text: 'Select - $value', position: FLToastPosition.bottom),
            onCanceled: () => FLToast.showText(text: 'Canceled', position: FLToastPosition.bottom),
          ),
          SizedBox(height: 20),
          FLBubbleMenuWidget(
            offset: Offset(100, 0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xFF0F4C81)
              ),
              width: 240,
              height: 40,
              child: Center(
                child: Text('Long press to show menu', style: TextStyle(fontSize: 17, color: Colors.white)),
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
            onSelected: (value) => FLToast.showText(text: 'Select - $value', position: FLToastPosition.bottom),
            onCanceled: () => FLToast.showText(text: 'Canceled', position: FLToastPosition.bottom),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bubble'),
      ),
      body: Container(
        color: Color(0xFFDEEEEEE),
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _buildSection('Bubble', _buildBubbleContent(width)),
            _buildSection('Bubble Menu', _buildBubbleMenuContent()),
          ],
        ),
      ),
    );
  }
}