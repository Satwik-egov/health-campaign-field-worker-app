// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Project extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get projectTypeId => text().nullable()();
  TextColumn get subProjectTypeId => text().nullable()();
  BoolColumn get isTaskEnabled => boolean().nullable()();
  TextColumn get parent => text().nullable()();
  TextColumn get department => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get referenceId => text().nullable()();
  TextColumn get projectHierarchy => text().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  IntColumn get rowVersion => integer()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}