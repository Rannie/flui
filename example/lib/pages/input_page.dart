import 'package:example/auto_complete.dart';
import 'package:example/pin_input.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  static const String routeName = '/inputs';

  @override
  State<StatefulWidget> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _pinController = TextEditingController();
  final GlobalKey<FLAutoCompleteState> _key = GlobalKey<FLAutoCompleteState>();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Input Page'),
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
                      FLAutoComplete(
                        key: _key,
                        focusNode: _focusNode,
                        itemBuilder: (context, suggestion) => Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(suggestion),
                          ),
                        ),
                        onSelectedSuggestion: (suggestion) {
                          print('select $suggestion');
                        },
                        child: TextField(
                          focusNode: _focusNode,
                          onChanged: (text) {
                            print(text.split(''));
                            _key.currentState.updateSuggestionList(text.split(''));
                          },
                        ),
                      )
                    ]
                )
            )
        )
    );
  }
}