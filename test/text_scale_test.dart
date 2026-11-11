import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/dob_wheels.dart';

import 'support/pump_app.dart';

void main() {
  testWidgets('a 4.7 inch phone at text scale 1.3 does not overflow', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(375, 667);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 1.3;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

    await pumpJdonuts(tester);
    expect(find.text("LET'S GET STARTED"), findsOneWidget);
    await tester.tap(find.text("LET'S GET STARTED"));
    await settle(tester);
    await typeInto(tester, find.byType(TextFormField), '09254135592');
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

    expect(find.text('Ye Min'), findsOneWidget);
    await tester.tap(find.bySemanticsLabel('Reward'));
    await settle(tester);
    expect(find.text("J' Donuts Rewards"), findsOneWidget);
    await tester.tap(find.bySemanticsLabel('Home'));
    await settle(tester);
    final home = find.byType(CustomScrollView);
    for (var step = 0; step < 8; step++) {
      if (find.text('Coconut Donut').evaluate().isNotEmpty) {
        break;
      }
      await tester.drag(home, const Offset(0, -280));
      await tester.pump();
    }
    await tester.ensureVisible(find.text('Coconut Donut'));
    await tester.pump();
    await tester.tap(find.text('Coconut Donut'));
    await settle(tester);
    expect(find.text('JD022123'), findsOneWidget);
    final detail = find.byType(ListView);
    for (var step = 0; step < 6; step++) {
      if (find.textContaining('ADD TO CART').evaluate().isNotEmpty) {
        break;
      }
      await tester.drag(detail, const Offset(0, -240));
      await tester.pump();
    }
    await tester.ensureVisible(find.textContaining('ADD TO CART'));
    await tester.pump();
    await tester.tap(find.textContaining('ADD TO CART'));
    await settle(tester);
    await tester.tap(find.text('View cart'));
    await settle(tester);
    expect(find.text('Your cart'), findsOneWidget);
    expect(find.text('Coconut Donut'), findsWidgets);
    Navigator.of(tester.element(find.text('Your cart'))).pop();
    await settle(tester);
    Navigator.of(tester.element(find.text('JD022123'))).pop();
    await settle(tester);
    await tester.tap(find.bySemanticsLabel('Settings'));
    await settle(tester);
    expect(find.text('Log out'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
