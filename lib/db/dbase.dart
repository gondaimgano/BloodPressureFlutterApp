// These imports are only needed to open the database
import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;


part 'dbase.g.dart'; //should be the same name as your dart file

// @DataClassName
class BloodPressureReadings extends Table {

  IntColumn get id => integer().autoIncrement()();
  IntColumn get upper => integer()();
  IntColumn get lower => integer()();
  DateTimeColumn get createdDate => dateTime()();
}

@UseMoor(tables: [BloodPressureReadings],
 )
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 2;


Future<List<BloodPressureReading>> get allReadingEntries=>(select(bloodPressureReadings)..orderBy([(t) => OrderingTerm(expression: t.createdDate,mode: OrderingMode.desc)])).get();

Future insertReading(BloodPressureReading tbl) => into(bloodPressureReadings).insert(tbl);

Future updateReading(BloodPressureReading tbl) => update(bloodPressureReadings).replace(tbl);

Future deleteReading(BloodPressureReading tbl) => delete(bloodPressureReadings).delete(tbl);

}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'bpdb.sqlite'));
    return VmDatabase(file);
  });
}


