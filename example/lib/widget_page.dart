import 'package:example/pin_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetPage extends StatefulWidget {
  static const String routeName = '/widget';

  @override
  State<StatefulWidget> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Widget Page'),
        ),
        body: Container(
            color: Colors.white,
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20),
                      FLPinCodeTextField(
                        controller: _pinController,
                        boxWidth: 45,
                        boxHeight: 45,
                        pinLength: 6,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (text) {
                          print('change -- $text');
                        },
                        onSubmitted: (text) {
                          print('submit -- $text');
                        },
                        onEditingComplete: () {
                          print('editing complete');
                        },
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(

                        )
                      )
                    ]
                )
            )
        )
    );
  }
}