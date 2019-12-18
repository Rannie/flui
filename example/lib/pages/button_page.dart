import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:example/style/style.dart';
import 'dart:math' as math;

class ButtonPage extends StatefulWidget {
  static const String routeName = '/button';
  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

const Color mainColor = Color(FLColors.primaryValue);

class _ButtonPageState extends State<ButtonPage> {
  FLPosition _iconPosFlat = FLPosition.bottom;
  FLPosition _iconPosRaised = FLPosition.bottom;
  bool _loading = false;
  bool _indiOnlyLoading = false;

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

  FLPosition _newIconPos(FLPosition iconPos) {
    if (iconPos == FLPosition.bottom) return FLPosition.left;
    if (iconPos == FLPosition.left) return FLPosition.top;
    if (iconPos == FLPosition.top) return FLPosition.right;
    if (iconPos == FLPosition.right) return FLPosition.bottom;
    return FLPosition.bottom;
  }

  Widget _flatButtonContent(double screenWidth) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          child: FLFlatButton(
            expanded: true,
            color: mainColor,
            textColor: Colors.white,
            child: Text('Extended Button', textAlign: TextAlign.center),
            onPressed: () => FLToast.info(text: 'Extended Button'),
          ),
        ),
        SizedBox(height: 10),
        FLFlatButton.icon(
              padding: const EdgeInsets.all(5),
              textColor: mainColor,
              onPressed: () => setState(() => _iconPosFlat = _newIconPos(_iconPosFlat)),
              icon: Icon(Icons.account_box, color: mainColor),
              label: Text('Click to change icon position'),
              spacing: 5,
              iconPosition: _iconPosFlat,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _raisedButtonContent(double screenWidth) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          child: FLRaisedButton(
            expanded: true,
            textColor: Colors.white,
            child: Text('Extended Button', textAlign: TextAlign.center),
            onPressed: () => FLToast.info(text: 'Extended Button'),
          ),
        ),
        SizedBox(height: 10),
        FLRaisedButton.icon(
          padding: const EdgeInsets.all(5),
          color: mainColor,
          textColor: Colors.white,
          onPressed: () => setState(() => _iconPosRaised = _newIconPos(_iconPosRaised)),
          icon: Icon(Icons.account_box, color:Colors.white),
          label: Text('Click to change icon position'),
          spacing: 5,
          iconPosition: _iconPosRaised,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _gradientButtonContent() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        FLGradientButton.linear(
          textColor: Colors.white,
          child: Text('Linear Gradient Button'),
          colors: [Colors.lightBlueAccent, mainColor],
          onPressed: () => FLToast.info(text: 'Linear Gradient Button'),
        ),
        SizedBox(height: 10),
        FLGradientButton.sweep(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          center: FractionalOffset.center,
          startAngle: 0.0,
          endAngle: math.pi * 2,
          colors: const <Color>[
            Color(0xFF4285F4), // blue
            Color(0xFF34A853), // green
            Color(0xFFFBBC05), // yellow
            Color(0xFFEA4335), // red
            Color(0xFF4285F4), // blue again to seamlessly transition to the start
          ],
          stops: const <double>[0.0, 0.25, 0.5, 0.75, 1.0],
          textColor: Colors.white,
          child: Text('Sweep Gradient Button'),
          onPressed: () => FLToast.info(text: 'Sweep Gradient Button'),
        ),
        SizedBox(height: 10),
        FLGradientButton.radial(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          center: const Alignment(0.7, -0.6), // near the top right
          radius: 0.2,
          colors: [
            const Color(0xFFFFFF00), // yellow sun
            const Color(0xFF0099FF), // blue sky
          ],
          stops: [0.4, 1.0],
          textColor: Colors.white,
          child: Text('Radial Gradient Button'),
          onPressed: () => FLToast.info(text: 'Radial Gradient Button'),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _loadingButtonContent() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        FLLoadingButton(
          child: Text('Login'),
          color: mainColor,
          disabledColor: mainColor,
          indicatorColor: Colors.white,
          disabledTextColor: Colors.grey.withAlpha(40),
          textColor: Colors.white,
          loading: _loading,
          minWidth: 200,
          onPressed: () {
            setState(() => _loading = true);
            Future.delayed(Duration(seconds: 3), () => setState(() => _loading = false));
          },
        ),
        SizedBox(height: 10),
        FLLoadingButton(
          child: Text('Login'),
          color: mainColor,
          disabledColor: mainColor,
          indicatorColor: Colors.white,
          textColor: Colors.white,
          loading: _indiOnlyLoading,
          minWidth: 200,
          indicatorOnly: true,
          onPressed: () {
            setState(() => _indiOnlyLoading = true);
            Future.delayed(Duration(seconds: 3), () => setState(() => _indiOnlyLoading = false));
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Buttons'),
          centerTitle: true,
    ),
        body: Container(
          color: Colors.white,
          width: screenWidth,
          height: screenHeight,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              _buildSection('Flat Button', _flatButtonContent(screenWidth)),
              _buildSection('Raised Button', _raisedButtonContent(screenWidth)),
              _buildSection('Gradient Button', _gradientButtonContent()),
              _buildSection('Loading Button', _loadingButtonContent()),
            ],
          ),
        )
    );
  }
}