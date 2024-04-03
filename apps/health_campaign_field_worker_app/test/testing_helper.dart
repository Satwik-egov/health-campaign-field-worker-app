import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/app.dart';
import 'package:health_campaign_field_worker_app/data/local_store/sql_store/sql_store.dart';
import 'package:health_campaign_field_worker_app/data/remote_client.dart';
import 'package:health_campaign_field_worker_app/router/app_router.dart';
import 'package:health_campaign_field_worker_app/utils/constants.dart';
import 'package:isar/isar.dart';

class TestHelper {
  static late WidgetTester tester;

  static late Isar _isar;
  static late Dio _dio;
  static late LocalSqlDataStore _sql;

  Future<void> init() async {
    _isar = await Constants().isar;
    _dio = DioClient().dio;
    _sql = LocalSqlDataStore();
  }

  static Future<void> pumpApp() async {
    await tester.pumpWidget(MainApplication(
      isar: TestHelper._isar,
      client: _dio,
      appRouter: AppRouter(),
      sql: _sql,
    ));
    await tester.pumpAndSettle(const Duration(seconds: 4));
  }

  static Future<void> enterDataInTextField(
      {String name = '',
      required String data,
      Finder? finder,
      int at = 0}) async {
    try {
      var textfield = finder ?? find.widgetWithText(TextField, name).at(at);
      await tester.ensureVisible(textfield);
      await tester.pumpAndSettle();
      await tester.tap(textfield, warnIfMissed: false);
      await tester.enterText(textfield, data);
      await tester.pumpAndSettle();
    } catch (ex) {
      print(ex.toString());
    }
  }
}
