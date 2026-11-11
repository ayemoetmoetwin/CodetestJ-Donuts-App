import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts_app/core/widgets/app_button.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/dob_wheels.dart';

import 'support/pump_app.dart';

void main() {
  testWidgets('register reaches home and then the coconut donut', (
    tester,
  ) async {
    await pumpJdonuts(tester);
    await tester.tap(find.text("LET'S GET STARTED"));
    await settle(tester);
    await typeInto(tester, find.byType(TextFormField), '09254135592');
    expect(
      tester
          .widget<AppButton>(find.byKey(const Key('continue-button')))
          .onPressed,
      isNotNull,
    );
    await tester.tap(find.byKey(const Key('continue-button')));
    await settle(tester);
    await tester.enterText(find.byKey(const Key('otp-field')), '123456');
    await settle(tester);
    await typeInto(
      tester,
      find.descendant(
        of: find.byKey(const Key('first-name')),
        matching: find.byType(TextFormField),
      ),
      'Ye Min',
    );
    await typeInto(
      tester,
      find.descendant(
        of: find.byKey(const Key('last-name')),
        matching: find.byType(TextFormField),
      ),
      'Phyo Win',
    );
    await tester.tap(find.byKey(const Key('continue-button')));
    await settle(tester);
    await tester.tap(find.byKey(const Key('dob-month')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    tester
        .state<DobWheelsState>(find.byType(DobWheels))
        .choose(month: 5, day: 1, year: 1980);
    await tester.tap(find.byKey(const Key('dob-done')));
    await settle(tester);
    await tester.tap(find.byKey(const Key('continue-button')));
    await settle(tester);
    await tester.tap(find.byKey(const Key('explore-button')));
    await settle(tester);

    expect(find.text('Ye Min Phyo Win'), findsOneWidget);
    await tester.binding.setSurfaceSize(const Size(900, 1800));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pump();
    await tester.ensureVisible(find.text('Coconut Donut'));
    await tester.pump();
    await tester.tap(find.text('Coconut Donut'));
    await settle(tester);
    expect(find.text('JD022123'), findsOneWidget);
    expect(find.textContaining('3,200 MMK'), findsWidgets);
  });
}
