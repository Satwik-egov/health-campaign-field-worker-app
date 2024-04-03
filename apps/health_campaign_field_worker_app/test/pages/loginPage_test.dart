import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../testing_helper.dart';

void loginTest1() {
  testWidgets("Form validation Test", (widgetTester) async {
    TestHelper.tester = widgetTester;
    await TestHelper.pumpApp();
    await widgetTester.tap(find.text('Login'));
    await widgetTester.pumpAndSettle();

    expect("Unable to login user", findsOneWidget);
  });
}

void main() async {
  try {
    await initializeTest();
    FlutterError.onError = (details) => print(details.exceptionAsString());
  } catch (ex) {
    print(ex.toString());
  }
}

Future<void> initializeTest() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  // await DB.instance().initialize();

  group("Login Page Test", () {
    loginTest1();
  });
}
