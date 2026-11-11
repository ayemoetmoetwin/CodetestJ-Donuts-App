import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts_app/core/widgets/app_button.dart';

import 'support/pump_app.dart';

void main() {
  testWidgets('an invalid phone stays disabled and explains itself on blur', (
    tester,
  ) async {
    await pumpJdonuts(tester);
    await tester.tap(find.text("LET'S GET STARTED"));
    await settle(tester);
    await typeInto(tester, find.byType(TextFormField), '12345');
    await tester.tap(find.byType(TextFormField));
    await tester.pump();
    await tester.tap(find.text('Enter your phone number'));
    await settle(tester);

    expect(find.text('Enter a valid mobile number.'), findsOneWidget);
    final button = tester.widget<AppButton>(
      find.byKey(const Key('continue-button')),
    );
    expect(button.onPressed, isNull);
  });
}
