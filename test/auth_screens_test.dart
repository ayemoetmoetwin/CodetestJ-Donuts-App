import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts_app/core/widgets/app_button.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/dob_wheels.dart';

import 'support/pump_app.dart';

void main() {
  testWidgets('invalid phone stays disabled and explains itself on blur', (
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

  testWidgets('the phone box keeps digits only', (tester) async {
    await pumpJdonuts(tester);
    await tester.tap(find.text("LET'S GET STARTED"));
    await settle(tester);
    await tester.enterText(find.byType(TextFormField), '09ab-25');
    await tester.pump();

    expect(find.text('0925'), findsOneWidget);
    expect(find.text('09ab-25'), findsNothing);
  });

  testWidgets('an unknown login shows a link to register', (tester) async {
    await pumpJdonuts(tester);
    await tester.tap(find.byKey(const Key('login-button')));
    await settle(tester);
    await typeInto(tester, find.byType(TextFormField), '09254135592');
    await tester.tap(find.byKey(const Key('continue-button')));
    await settle(tester);

    expect(find.textContaining('not registered'), findsOneWidget);
    expect(find.byKey(const Key('register-link')), findsOneWidget);
  });

  testWidgets('three wrong codes lock the OTP boxes', (tester) async {
    await pumpJdonuts(tester);
    await tester.tap(find.text("LET'S GET STARTED"));
    await settle(tester);
    await typeInto(tester, find.byType(TextFormField), '09254135592');
    await tester.tap(find.byKey(const Key('continue-button')));
    await settle(tester);

    for (var attempt = 0; attempt < 3; attempt++) {
      await tester.enterText(find.byKey(const Key('otp-field')), '000000');
      await settle(tester);
    }

    expect(find.textContaining('Too many tries'), findsOneWidget);
  });

  testWidgets('a digit in the first name is rejected', (tester) async {
    await _openName(tester);
    await _enter(tester, 'first-name', 'Ye1');
    await tester.tap(
      find.descendant(
        of: find.byKey(const Key('first-name')),
        matching: find.byType(TextFormField),
      ),
    );
    await tester.pump();
    await tester.tap(find.text("What's your name?"));
    await settle(tester);

    expect(find.text('Use letters and spaces only.'), findsOneWidget);
    final button = tester.widget<AppButton>(
      find.byKey(const Key('continue-button')),
    );
    expect(button.onPressed, isNull);
  });

  testWidgets('a birth date under 13 keeps continue disabled', (tester) async {
    await _openDob(tester);
    await tester.tap(find.byKey(const Key('dob-year')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    tester
        .state<DobWheelsState>(find.byType(DobWheels))
        .choose(month: 1, day: 1, year: 2016);
    await tester.tap(find.byKey(const Key('dob-done')));
    await settle(tester);

    expect(find.text('You need to be at least 13.'), findsOneWidget);
    final button = tester.widget<AppButton>(
      find.byKey(const Key('continue-button')),
    );
    expect(button.onPressed, isNull);
  });
}

Future<void> _openName(WidgetTester tester) async {
  await pumpJdonuts(tester);
  await tester.tap(find.text("LET'S GET STARTED"));
  await settle(tester);
  await typeInto(tester, find.byType(TextFormField), '09254135592');
  await tester.tap(find.byKey(const Key('continue-button')));
  await settle(tester);
  await tester.enterText(find.byKey(const Key('otp-field')), '123456');
  await settle(tester);
}

Future<void> _openDob(WidgetTester tester) async {
  await _openName(tester);
  await _enter(tester, 'first-name', 'Ye Min');
  await _enter(tester, 'last-name', 'Phyo Win');
  await tester.tap(find.byKey(const Key('continue-button')));
  await settle(tester);
}

Future<void> _enter(WidgetTester tester, String key, String value) {
  return typeInto(
    tester,
    find.descendant(
      of: find.byKey(Key(key)),
      matching: find.byType(TextFormField),
    ),
    value,
  );
}
