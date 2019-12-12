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
  
  Widget _buildPinInputsContent() {
    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        FLPinCodeTextField(
          controller: _pinController,
          boxWidth: 45,
          boxHeight: 60,
          pinLength: 6,
          minSpace: 20,
          autofocus: false,
          textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: UnderlineInputBorder(),
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
        SizedBox(height: 30),
        FLPinCodeTextField(
          controller: _pinController,
          boxWidth: 55,
          boxHeight: 55,
          pinLength: 4,
          minSpace: 20,
          autofocus: false,
          textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 15, 17, 22),
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
        SizedBox(height: 30),
      ],
    );
  }
  
  Widget _buildAutoComplete() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
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
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Input'),
        ),
        body: Container(
            color: Colors.white,
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _buildSection('Auto Complete', _buildAutoComplete()),
                      _buildSection('Pin Input', _buildPinInputsContent())
                    ]
                )
            )
        )
    );
  }
}