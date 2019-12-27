import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flui/src/widgets/auto_complete.dart';
import 'test_common.dart';

void main() {
  testWidgets('Auto Complete Test', (WidgetTester tester) async {
    GlobalKey textFieldKey = GlobalKey();
    GlobalKey<FLAutoCompleteState> autoKey = GlobalKey<FLAutoCompleteState>();
    await tester.pumpWidget(TestContainer(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: FLAutoComplete(
            key: autoKey,
            itemBuilder: (context, suggest) {
              expect(suggest, 'Hi');
              expect(Overlay.of(context) != null, true);
              return ListTile(title: Text(suggest));
            },
            child: Container(
              width: 100,
              height: 40,
              child: TextField(
                  key: textFieldKey,
                  onChanged: (text) =>
                      autoKey.currentState.updateSuggestionList(['Hi'])),
            )),
      ),
    ));

    await tester.enterText(find.byKey(textFieldKey), 'auto complete');
    await tester.pumpAndSettle();
  });
}
