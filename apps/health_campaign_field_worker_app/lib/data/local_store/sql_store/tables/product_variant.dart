// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class ProductVariant extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get productId => text()();
  TextColumn get sku => text()();
  TextColumn get variation => text()();
  IntColumn get rowVersion => integer()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}