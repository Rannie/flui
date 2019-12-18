import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flui/flui.dart';

class AppBarPage extends StatefulWidget {
  static const String routeName = '/appbar';
  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  String _barTitle = 'AppBar';
  String _subTitle = '(subtitle)';
  FLAppBarTitleLayout _barLayout = FLAppBarTitleLayout.horizontal;
  bool _showLoading = false;
  FLAppBarPosition _loadingPos = FLAppBarPosition.right;
  Widget _accessoryWidget = Icon(Icons.keyboard_arrow_down, color: Colors.white);
  FLAppBarPosition _accessoryPos = FLAppBarPosition.right;
  bool _showSubTitle = false;
  bool _showAccessory = false;

  @override
  Widget build(BuildContext context) {
    Widget inset = SizedBox(height: 10);
    String subStr = _showSubTitle ? 'Hide subtitle' : 'Show subtitle';
    String loadStr = _showLoading ? 'Hide loading' : 'Show loading';
    String accStr = _showAccessory ? 'Hide accessory widget' : 'Show accessory widget';

    final Map<FLAppBarTitleLayout, Widget> layoutSegs = const <FLAppBarTitleLayout, Widget>{
      FLAppBarTitleLayout.horizontal: Text('Horizontal'),
      FLAppBarTitleLayout.vertical: Text('Vertical'),
    };

    final Map<FLAppBarPosition, Widget> loadingSegs = const <FLAppBarPosition, Widget>{
      FLAppBarPosition.right: Text('Right'),
      FLAppBarPosition.left: Text('Left')
    };

    final Map<FLAppBarPosition, Widget> accSegs = const <FLAppBarPosition, Widget>{
      FLAppBarPosition.right: Text('Right'),
      FLAppBarPosition.left: Text('Left')
    };

    return Scaffold(
      appBar: AppBar(
        title: FLAppBarTitle(
          title: _barTitle,
          layout: _barLayout,
          showLoading: _showLoading,
          loadingPosition: _loadingPos,
          subtitle: _showSubTitle ? _subTitle : null,
          customAccessoryWidget: _showAccessory ? _accessoryWidget : null,
          accessoryPosition: _accessoryPos,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            inset,
            FLRaisedButton(
              textColor: Colors.white,
              child: Text(subStr),
              onPressed: () => setState(() => _showSubTitle = !_showSubTitle),
            ),
            inset,
            FLRaisedButton(
              textColor: Colors.white,
              child: Text(loadStr),
              onPressed: () => setState(() => _showLoading = !_showLoading),
            ),
            inset,
            FLRaisedButton(
              textColor: Colors.white,
              child: Text(accStr),
              onPressed: () => setState(() => _showAccessory = !_showAccessory),
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 30),
                  width: 120,
                  child: Text('Bar Layout: '),
                ),
                SizedBox(
                  width: 250,
                  child: CupertinoSegmentedControl<FLAppBarTitleLayout>(
                    children: layoutSegs,
                    onValueChanged: (newValue) => setState(() => _barLayout = newValue),
                    groupValue: _barLayout,
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 30),
                  width: 120,
                  child: Text('Loading Position: '),
                ),
                SizedBox(
                  width: 250,
                  child: CupertinoSegmentedControl<FLAppBarPosition>(
                    children: loadingSegs,
                    onValueChanged: (newValue) => setState(() => _loadingPos = newValue),
                    groupValue: _loadingPos,
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 30),
                  width: 120,
                  child: Text('Accessory Position: '),
                ),
                SizedBox(
                  width: 250,
                  child: CupertinoSegmentedControl<FLAppBarPosition>(
                    children: accSegs,
                    onValueChanged: (newValue) => setState(() => _accessoryPos = newValue),
                    groupValue: _accessoryPos,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}