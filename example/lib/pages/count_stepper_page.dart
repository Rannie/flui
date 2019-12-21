import 'package:example/pages/page_util.dart';
import 'package:flutter/material.dart';
import 'package:flui/widgets/count_stepper.dart';

class CountStepperPage extends StatefulWidget {
  static const String routeName = '/count-stepper';
  @override
  State<CountStepperPage> createState() => _CountStepperPageState();
}

class _CountStepperPageState extends State<CountStepperPage> {
  bool _disabled = false;
  FLCountStepperController _controller = FLCountStepperController();

  Widget _buildNormalStepper() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: FLCountStepper(
            disabled: _disabled,
            controller: _controller,
            disableInput: false,
            onChanged: (value) {
              print('update $value');
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingStepper() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count Stepper'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            PageUtil.buildSection('Normal Count Stepper', _buildNormalStepper()),
            PageUtil.buildSection('Floating Stepper', _buildFloatingStepper())
          ],
        ),
      ),
    );
  }
}