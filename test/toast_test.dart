import 'package:flui/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'test_common.dart';

class ToastApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FLToastProvider(
      defaults: FLToastDefaults(),
      child: TestContainer(
        child: ToastDes()
      ),
    );
  }
}

class ToastDes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    expect(Overlay.of(context).runtimeType, OverlayState);
    return Container();
  }
}

void main() {
  testWidgets('Toast Test', (WidgetTester tester) async {
    await tester.pumpWidget(ToastApp());
  });
}