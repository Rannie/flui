import 'package:example/bubble.dart';
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
              FLBubbleWidget(
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
              FLBubbleWidget(
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
              FLBubbleWidget(
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
              FLBubbleWidget(
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
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      child: Container(
        width: 50,
        height: 50,
        color: Color(0xFF4F6BED),
        child: Center(
          child: Text(alpha, style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
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
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _buildSection('Bubble', _buildBubbleContent(width)),
          ],
        ),
      ),
    );
  }
}