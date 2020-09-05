// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dbase.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class BloodPressureReading extends DataClass
    implements Insertable<BloodPressureReading> {
  final int id;
  final int upper;
  final int lower;
  final DateTime createdDate;
  BloodPressureReading(
      {@required this.id,
      @required this.upper,
      @required this.lower,
      @required this.createdDate});
  factory BloodPressureReading.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return BloodPressureReading(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      upper: intType.mapFromDatabaseResponse(data['${effectivePrefix}upper']),
      lower: intType.mapFromDatabaseResponse(data['${effectivePrefix}lower']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || upper != null) {
      map['upper'] = Variable<int>(upper);
    }
    if (!nullToAbsent || lower != null) {
      map['lower'] = Variable<int>(lower);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    return map;
  }

  BloodPressureReadingsCompanion toCompanion(bool nullToAbsent) {
    return BloodPressureReadingsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      upper:
          upper == null && nullToAbsent ? const Value.absent() : Value(upper),
      lower:
          lower == null && nullToAbsent ? const Value.absent() : Value(lower),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
    );
  }

  factory BloodPressureReading.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BloodPressureReading(
      id: serializer.fromJson<int>(json['id']),
      upper: serializer.fromJson<int>(json['upper']),
      lower: serializer.fromJson<int>(json['lower']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'upper': serializer.toJson<int>(upper),
      'lower': serializer.toJson<int>(lower),
      'createdDate': serializer.toJson<DateTime>(createdDate),
    };
  }

  BloodPressureReading copyWith(
          {int id, int upper, int lower, DateTime createdDate}) =>
      BloodPressureReading(
        id: id ?? this.id,
        upper: upper ?? this.upper,
        lower: lower ?? this.lower,
        createdDate: createdDate ?? this.createdDate,
      );
  @override
  String toString() {
    return (StringBuffer('BloodPressureReading(')
          ..write('id: $id, ')
          ..write('upper: $upper, ')
          ..write('lower: $lower, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(upper.hashCode, $mrjc(lower.hashCode, createdDate.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BloodPressureReading &&
          other.id == this.id &&
          other.upper == this.upper &&
          other.lower == this.lower &&
          other.createdDate == this.createdDate);
}

class BloodPressureReadingsCompanion
    extends UpdateCompanion<BloodPressureReading> {
  final Value<int> id;
  final Value<int> upper;
  final Value<int> lower;
  final Value<DateTime> createdDate;
  const BloodPressureReadingsCompanion({
    this.id = const Value.absent(),
    this.upper = const Value.absent(),
    this.lower = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  BloodPressureReadingsCompanion.insert({
    this.id = const Value.absent(),
    @required int upper,
    @required int lower,
    @required DateTime createdDate,
  })  : upper = Value(upper),
        lower = Value(lower),
        createdDate = Value(createdDate);
  static Insertable<BloodPressureReading> custom({
    Expression<int> id,
    Expression<int> upper,
    Expression<int> lower,
    Expression<DateTime> createdDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (upper != null) 'upper': upper,
      if (lower != null) 'lower': lower,
      if (createdDate != null) 'created_date': createdDate,
    });
  }

  BloodPressureReadingsCompanion copyWith(
      {Value<int> id,
      Value<int> upper,
      Value<int> lower,
      Value<DateTime> createdDate}) {
    return BloodPressureReadingsCompanion(
      id: id ?? this.id,
      upper: upper ?? this.upper,
      lower: lower ?? this.lower,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (upper.present) {
      map['upper'] = Variable<int>(upper.value);
    }
    if (lower.present) {
      map['lower'] = Variable<int>(lower.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BloodPressureReadingsCompanion(')
          ..write('id: $id, ')
          ..write('upper: $upper, ')
          ..write('lower: $lower, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }
}

class $BloodPressureReadingsTable extends BloodPressureReadings
    with TableInfo<$BloodPressureReadingsTable, BloodPressureReading> {
  final GeneratedDatabase _db;
  final String _alias;
  $BloodPressureReadingsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _upperMeta = const VerificationMeta('upper');
  GeneratedIntColumn _upper;
  @override
  GeneratedIntColumn get upper => _upper ??= _constructUpper();
  GeneratedIntColumn _constructUpper() {
    return GeneratedIntColumn(
      'upper',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lowerMeta = const VerificationMeta('lower');
  GeneratedIntColumn _lower;
  @override
  GeneratedIntColumn get lower => _lower ??= _constructLower();
  GeneratedIntColumn _constructLower() {
    return GeneratedIntColumn(
      'lower',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, upper, lower, createdDate];
  @override
  $BloodPressureReadingsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'blood_pressure_readings';
  @override
  final String actualTableName = 'blood_pressure_readings';
  @override
  VerificationContext validateIntegrity(
      Insertable<BloodPressureReading> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('upper')) {
      context.handle(
          _upperMeta, upper.isAcceptableOrUnknown(data['upper'], _upperMeta));
    } else if (isInserting) {
      context.missing(_upperMeta);
    }
    if (data.containsKey('lower')) {
      context.handle(
          _lowerMeta, lower.isAcceptableOrUnknown(data['lower'], _lowerMeta));
    } else if (isInserting) {
      context.missing(_lowerMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    } else if (isInserting) {
      context.missing(_createdDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BloodPressureReading map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BloodPressureReading.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BloodPressureReadingsTable createAlias(String alias) {
    return $BloodPressureReadingsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $BloodPressureReadingsTable _bloodPressureReadings;
  $BloodPressureReadingsTable get bloodPressureReadings =>
      _bloodPressureReadings ??= $BloodPressureReadingsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bloodPressureReadings];
}
