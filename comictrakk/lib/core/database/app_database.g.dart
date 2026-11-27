// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SeriesTypeTable extends SeriesType
    with TableInfo<$SeriesTypeTable, SeriesTypeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeriesTypeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'series_type';
  @override
  VerificationContext validateIntegrity(
    Insertable<SeriesTypeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SeriesTypeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SeriesTypeData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $SeriesTypeTable createAlias(String alias) {
    return $SeriesTypeTable(attachedDatabase, alias);
  }
}

class SeriesTypeData extends DataClass implements Insertable<SeriesTypeData> {
  final int id;
  final String name;
  const SeriesTypeData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  SeriesTypeCompanion toCompanion(bool nullToAbsent) {
    return SeriesTypeCompanion(id: Value(id), name: Value(name));
  }

  factory SeriesTypeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SeriesTypeData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  SeriesTypeData copyWith({int? id, String? name}) =>
      SeriesTypeData(id: id ?? this.id, name: name ?? this.name);
  SeriesTypeData copyWithCompanion(SeriesTypeCompanion data) {
    return SeriesTypeData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SeriesTypeData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SeriesTypeData &&
          other.id == this.id &&
          other.name == this.name);
}

class SeriesTypeCompanion extends UpdateCompanion<SeriesTypeData> {
  final Value<int> id;
  final Value<String> name;
  const SeriesTypeCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  SeriesTypeCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<SeriesTypeData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  SeriesTypeCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return SeriesTypeCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesTypeCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SeriesTTable extends SeriesT with TableInfo<$SeriesTTable, Series> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeriesTTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedColumn<int> volume = GeneratedColumn<int>(
    'volume',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yearBeganMeta = const VerificationMeta(
    'yearBegan',
  );
  @override
  late final GeneratedColumn<int> yearBegan = GeneratedColumn<int>(
    'year_began',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yearEndMeta = const VerificationMeta(
    'yearEnd',
  );
  @override
  late final GeneratedColumn<int> yearEnd = GeneratedColumn<int>(
    'year_end',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _issueCountMeta = const VerificationMeta(
    'issueCount',
  );
  @override
  late final GeneratedColumn<int> issueCount = GeneratedColumn<int>(
    'issue_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seriesTypeIdMeta = const VerificationMeta(
    'seriesTypeId',
  );
  @override
  late final GeneratedColumn<int> seriesTypeId = GeneratedColumn<int>(
    'series_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES series_type (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    volume,
    yearBegan,
    yearEnd,
    issueCount,
    seriesTypeId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'series';
  @override
  VerificationContext validateIntegrity(
    Insertable<Series> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('volume')) {
      context.handle(
        _volumeMeta,
        volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta),
      );
    } else if (isInserting) {
      context.missing(_volumeMeta);
    }
    if (data.containsKey('year_began')) {
      context.handle(
        _yearBeganMeta,
        yearBegan.isAcceptableOrUnknown(data['year_began']!, _yearBeganMeta),
      );
    } else if (isInserting) {
      context.missing(_yearBeganMeta);
    }
    if (data.containsKey('year_end')) {
      context.handle(
        _yearEndMeta,
        yearEnd.isAcceptableOrUnknown(data['year_end']!, _yearEndMeta),
      );
    } else if (isInserting) {
      context.missing(_yearEndMeta);
    }
    if (data.containsKey('issue_count')) {
      context.handle(
        _issueCountMeta,
        issueCount.isAcceptableOrUnknown(data['issue_count']!, _issueCountMeta),
      );
    } else if (isInserting) {
      context.missing(_issueCountMeta);
    }
    if (data.containsKey('series_type_id')) {
      context.handle(
        _seriesTypeIdMeta,
        seriesTypeId.isAcceptableOrUnknown(
          data['series_type_id']!,
          _seriesTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_seriesTypeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Series map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Series(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      volume: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}volume'],
      )!,
      yearBegan: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year_began'],
      )!,
      yearEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year_end'],
      )!,
      issueCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}issue_count'],
      )!,
      seriesTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}series_type_id'],
      )!,
    );
  }

  @override
  $SeriesTTable createAlias(String alias) {
    return $SeriesTTable(attachedDatabase, alias);
  }
}

class Series extends DataClass implements Insertable<Series> {
  final int id;
  final String name;
  final int volume;
  final int yearBegan;
  final int yearEnd;
  final int issueCount;
  final int seriesTypeId;
  const Series({
    required this.id,
    required this.name,
    required this.volume,
    required this.yearBegan,
    required this.yearEnd,
    required this.issueCount,
    required this.seriesTypeId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['volume'] = Variable<int>(volume);
    map['year_began'] = Variable<int>(yearBegan);
    map['year_end'] = Variable<int>(yearEnd);
    map['issue_count'] = Variable<int>(issueCount);
    map['series_type_id'] = Variable<int>(seriesTypeId);
    return map;
  }

  SeriesTCompanion toCompanion(bool nullToAbsent) {
    return SeriesTCompanion(
      id: Value(id),
      name: Value(name),
      volume: Value(volume),
      yearBegan: Value(yearBegan),
      yearEnd: Value(yearEnd),
      issueCount: Value(issueCount),
      seriesTypeId: Value(seriesTypeId),
    );
  }

  factory Series.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Series(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      volume: serializer.fromJson<int>(json['volume']),
      yearBegan: serializer.fromJson<int>(json['yearBegan']),
      yearEnd: serializer.fromJson<int>(json['yearEnd']),
      issueCount: serializer.fromJson<int>(json['issueCount']),
      seriesTypeId: serializer.fromJson<int>(json['seriesTypeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'volume': serializer.toJson<int>(volume),
      'yearBegan': serializer.toJson<int>(yearBegan),
      'yearEnd': serializer.toJson<int>(yearEnd),
      'issueCount': serializer.toJson<int>(issueCount),
      'seriesTypeId': serializer.toJson<int>(seriesTypeId),
    };
  }

  Series copyWith({
    int? id,
    String? name,
    int? volume,
    int? yearBegan,
    int? yearEnd,
    int? issueCount,
    int? seriesTypeId,
  }) => Series(
    id: id ?? this.id,
    name: name ?? this.name,
    volume: volume ?? this.volume,
    yearBegan: yearBegan ?? this.yearBegan,
    yearEnd: yearEnd ?? this.yearEnd,
    issueCount: issueCount ?? this.issueCount,
    seriesTypeId: seriesTypeId ?? this.seriesTypeId,
  );
  Series copyWithCompanion(SeriesTCompanion data) {
    return Series(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      volume: data.volume.present ? data.volume.value : this.volume,
      yearBegan: data.yearBegan.present ? data.yearBegan.value : this.yearBegan,
      yearEnd: data.yearEnd.present ? data.yearEnd.value : this.yearEnd,
      issueCount: data.issueCount.present
          ? data.issueCount.value
          : this.issueCount,
      seriesTypeId: data.seriesTypeId.present
          ? data.seriesTypeId.value
          : this.seriesTypeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Series(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('volume: $volume, ')
          ..write('yearBegan: $yearBegan, ')
          ..write('yearEnd: $yearEnd, ')
          ..write('issueCount: $issueCount, ')
          ..write('seriesTypeId: $seriesTypeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    volume,
    yearBegan,
    yearEnd,
    issueCount,
    seriesTypeId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Series &&
          other.id == this.id &&
          other.name == this.name &&
          other.volume == this.volume &&
          other.yearBegan == this.yearBegan &&
          other.yearEnd == this.yearEnd &&
          other.issueCount == this.issueCount &&
          other.seriesTypeId == this.seriesTypeId);
}

class SeriesTCompanion extends UpdateCompanion<Series> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> volume;
  final Value<int> yearBegan;
  final Value<int> yearEnd;
  final Value<int> issueCount;
  final Value<int> seriesTypeId;
  const SeriesTCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.volume = const Value.absent(),
    this.yearBegan = const Value.absent(),
    this.yearEnd = const Value.absent(),
    this.issueCount = const Value.absent(),
    this.seriesTypeId = const Value.absent(),
  });
  SeriesTCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int volume,
    required int yearBegan,
    required int yearEnd,
    required int issueCount,
    required int seriesTypeId,
  }) : name = Value(name),
       volume = Value(volume),
       yearBegan = Value(yearBegan),
       yearEnd = Value(yearEnd),
       issueCount = Value(issueCount),
       seriesTypeId = Value(seriesTypeId);
  static Insertable<Series> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? volume,
    Expression<int>? yearBegan,
    Expression<int>? yearEnd,
    Expression<int>? issueCount,
    Expression<int>? seriesTypeId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (volume != null) 'volume': volume,
      if (yearBegan != null) 'year_began': yearBegan,
      if (yearEnd != null) 'year_end': yearEnd,
      if (issueCount != null) 'issue_count': issueCount,
      if (seriesTypeId != null) 'series_type_id': seriesTypeId,
    });
  }

  SeriesTCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? volume,
    Value<int>? yearBegan,
    Value<int>? yearEnd,
    Value<int>? issueCount,
    Value<int>? seriesTypeId,
  }) {
    return SeriesTCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      volume: volume ?? this.volume,
      yearBegan: yearBegan ?? this.yearBegan,
      yearEnd: yearEnd ?? this.yearEnd,
      issueCount: issueCount ?? this.issueCount,
      seriesTypeId: seriesTypeId ?? this.seriesTypeId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (volume.present) {
      map['volume'] = Variable<int>(volume.value);
    }
    if (yearBegan.present) {
      map['year_began'] = Variable<int>(yearBegan.value);
    }
    if (yearEnd.present) {
      map['year_end'] = Variable<int>(yearEnd.value);
    }
    if (issueCount.present) {
      map['issue_count'] = Variable<int>(issueCount.value);
    }
    if (seriesTypeId.present) {
      map['series_type_id'] = Variable<int>(seriesTypeId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesTCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('volume: $volume, ')
          ..write('yearBegan: $yearBegan, ')
          ..write('yearEnd: $yearEnd, ')
          ..write('issueCount: $issueCount, ')
          ..write('seriesTypeId: $seriesTypeId')
          ..write(')'))
        .toString();
  }
}

class $IssuesTable extends Issues with TableInfo<$IssuesTable, Issue> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IssuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seriesIdMeta = const VerificationMeta(
    'seriesId',
  );
  @override
  late final GeneratedColumn<int> seriesId = GeneratedColumn<int>(
    'series_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES series (id)',
    ),
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, seriesId, number, name, imageUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'issues';
  @override
  VerificationContext validateIntegrity(
    Insertable<Issue> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('series_id')) {
      context.handle(
        _seriesIdMeta,
        seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_seriesIdMeta);
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Issue map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Issue(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      seriesId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}series_id'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}number'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
    );
  }

  @override
  $IssuesTable createAlias(String alias) {
    return $IssuesTable(attachedDatabase, alias);
  }
}

class Issue extends DataClass implements Insertable<Issue> {
  final int id;
  final int seriesId;
  final String number;
  final String name;
  final String imageUrl;
  const Issue({
    required this.id,
    required this.seriesId,
    required this.number,
    required this.name,
    required this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['series_id'] = Variable<int>(seriesId);
    map['number'] = Variable<String>(number);
    map['name'] = Variable<String>(name);
    map['image_url'] = Variable<String>(imageUrl);
    return map;
  }

  IssuesCompanion toCompanion(bool nullToAbsent) {
    return IssuesCompanion(
      id: Value(id),
      seriesId: Value(seriesId),
      number: Value(number),
      name: Value(name),
      imageUrl: Value(imageUrl),
    );
  }

  factory Issue.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Issue(
      id: serializer.fromJson<int>(json['id']),
      seriesId: serializer.fromJson<int>(json['seriesId']),
      number: serializer.fromJson<String>(json['number']),
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'seriesId': serializer.toJson<int>(seriesId),
      'number': serializer.toJson<String>(number),
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String>(imageUrl),
    };
  }

  Issue copyWith({
    int? id,
    int? seriesId,
    String? number,
    String? name,
    String? imageUrl,
  }) => Issue(
    id: id ?? this.id,
    seriesId: seriesId ?? this.seriesId,
    number: number ?? this.number,
    name: name ?? this.name,
    imageUrl: imageUrl ?? this.imageUrl,
  );
  Issue copyWithCompanion(IssuesCompanion data) {
    return Issue(
      id: data.id.present ? data.id.value : this.id,
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
      number: data.number.present ? data.number.value : this.number,
      name: data.name.present ? data.name.value : this.name,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Issue(')
          ..write('id: $id, ')
          ..write('seriesId: $seriesId, ')
          ..write('number: $number, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, seriesId, number, name, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Issue &&
          other.id == this.id &&
          other.seriesId == this.seriesId &&
          other.number == this.number &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl);
}

class IssuesCompanion extends UpdateCompanion<Issue> {
  final Value<int> id;
  final Value<int> seriesId;
  final Value<String> number;
  final Value<String> name;
  final Value<String> imageUrl;
  const IssuesCompanion({
    this.id = const Value.absent(),
    this.seriesId = const Value.absent(),
    this.number = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  IssuesCompanion.insert({
    this.id = const Value.absent(),
    required int seriesId,
    required String number,
    required String name,
    required String imageUrl,
  }) : seriesId = Value(seriesId),
       number = Value(number),
       name = Value(name),
       imageUrl = Value(imageUrl);
  static Insertable<Issue> custom({
    Expression<int>? id,
    Expression<int>? seriesId,
    Expression<String>? number,
    Expression<String>? name,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (seriesId != null) 'series_id': seriesId,
      if (number != null) 'number': number,
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  IssuesCompanion copyWith({
    Value<int>? id,
    Value<int>? seriesId,
    Value<String>? number,
    Value<String>? name,
    Value<String>? imageUrl,
  }) {
    return IssuesCompanion(
      id: id ?? this.id,
      seriesId: seriesId ?? this.seriesId,
      number: number ?? this.number,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (seriesId.present) {
      map['series_id'] = Variable<int>(seriesId.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IssuesCompanion(')
          ..write('id: $id, ')
          ..write('seriesId: $seriesId, ')
          ..write('number: $number, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

class $IssueDetailsTable extends IssueDetails
    with TableInfo<$IssueDetailsTable, IssueDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IssueDetailsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES issues (id)',
    ),
  );
  static const VerificationMeta _pagesMeta = const VerificationMeta('pages');
  @override
  late final GeneratedColumn<int> pages = GeneratedColumn<int>(
    'pages',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, pages];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'issue_details';
  @override
  VerificationContext validateIntegrity(
    Insertable<IssueDetail> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pages')) {
      context.handle(
        _pagesMeta,
        pages.isAcceptableOrUnknown(data['pages']!, _pagesMeta),
      );
    } else if (isInserting) {
      context.missing(_pagesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IssueDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IssueDetail(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pages: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pages'],
      )!,
    );
  }

  @override
  $IssueDetailsTable createAlias(String alias) {
    return $IssueDetailsTable(attachedDatabase, alias);
  }
}

class IssueDetail extends DataClass implements Insertable<IssueDetail> {
  final int id;
  final int pages;
  const IssueDetail({required this.id, required this.pages});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pages'] = Variable<int>(pages);
    return map;
  }

  IssueDetailsCompanion toCompanion(bool nullToAbsent) {
    return IssueDetailsCompanion(id: Value(id), pages: Value(pages));
  }

  factory IssueDetail.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IssueDetail(
      id: serializer.fromJson<int>(json['id']),
      pages: serializer.fromJson<int>(json['pages']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pages': serializer.toJson<int>(pages),
    };
  }

  IssueDetail copyWith({int? id, int? pages}) =>
      IssueDetail(id: id ?? this.id, pages: pages ?? this.pages);
  IssueDetail copyWithCompanion(IssueDetailsCompanion data) {
    return IssueDetail(
      id: data.id.present ? data.id.value : this.id,
      pages: data.pages.present ? data.pages.value : this.pages,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IssueDetail(')
          ..write('id: $id, ')
          ..write('pages: $pages')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pages);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IssueDetail &&
          other.id == this.id &&
          other.pages == this.pages);
}

class IssueDetailsCompanion extends UpdateCompanion<IssueDetail> {
  final Value<int> id;
  final Value<int> pages;
  const IssueDetailsCompanion({
    this.id = const Value.absent(),
    this.pages = const Value.absent(),
  });
  IssueDetailsCompanion.insert({
    this.id = const Value.absent(),
    required int pages,
  }) : pages = Value(pages);
  static Insertable<IssueDetail> custom({
    Expression<int>? id,
    Expression<int>? pages,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pages != null) 'pages': pages,
    });
  }

  IssueDetailsCompanion copyWith({Value<int>? id, Value<int>? pages}) {
    return IssueDetailsCompanion(id: id ?? this.id, pages: pages ?? this.pages);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pages.present) {
      map['pages'] = Variable<int>(pages.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IssueDetailsCompanion(')
          ..write('id: $id, ')
          ..write('pages: $pages')
          ..write(')'))
        .toString();
  }
}

class $IssueSeriesTable extends IssueSeries
    with TableInfo<$IssueSeriesTable, IssueSery> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IssueSeriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES series (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedColumn<int> volume = GeneratedColumn<int>(
    'volume',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yearBeganMeta = const VerificationMeta(
    'yearBegan',
  );
  @override
  late final GeneratedColumn<int> yearBegan = GeneratedColumn<int>(
    'year_began',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, volume, yearBegan];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'issue_series';
  @override
  VerificationContext validateIntegrity(
    Insertable<IssueSery> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('volume')) {
      context.handle(
        _volumeMeta,
        volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta),
      );
    } else if (isInserting) {
      context.missing(_volumeMeta);
    }
    if (data.containsKey('year_began')) {
      context.handle(
        _yearBeganMeta,
        yearBegan.isAcceptableOrUnknown(data['year_began']!, _yearBeganMeta),
      );
    } else if (isInserting) {
      context.missing(_yearBeganMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IssueSery map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IssueSery(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      volume: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}volume'],
      )!,
      yearBegan: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year_began'],
      )!,
    );
  }

  @override
  $IssueSeriesTable createAlias(String alias) {
    return $IssueSeriesTable(attachedDatabase, alias);
  }
}

class IssueSery extends DataClass implements Insertable<IssueSery> {
  final int id;
  final String name;
  final int volume;
  final int yearBegan;
  const IssueSery({
    required this.id,
    required this.name,
    required this.volume,
    required this.yearBegan,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['volume'] = Variable<int>(volume);
    map['year_began'] = Variable<int>(yearBegan);
    return map;
  }

  IssueSeriesCompanion toCompanion(bool nullToAbsent) {
    return IssueSeriesCompanion(
      id: Value(id),
      name: Value(name),
      volume: Value(volume),
      yearBegan: Value(yearBegan),
    );
  }

  factory IssueSery.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IssueSery(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      volume: serializer.fromJson<int>(json['volume']),
      yearBegan: serializer.fromJson<int>(json['yearBegan']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'volume': serializer.toJson<int>(volume),
      'yearBegan': serializer.toJson<int>(yearBegan),
    };
  }

  IssueSery copyWith({int? id, String? name, int? volume, int? yearBegan}) =>
      IssueSery(
        id: id ?? this.id,
        name: name ?? this.name,
        volume: volume ?? this.volume,
        yearBegan: yearBegan ?? this.yearBegan,
      );
  IssueSery copyWithCompanion(IssueSeriesCompanion data) {
    return IssueSery(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      volume: data.volume.present ? data.volume.value : this.volume,
      yearBegan: data.yearBegan.present ? data.yearBegan.value : this.yearBegan,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IssueSery(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('volume: $volume, ')
          ..write('yearBegan: $yearBegan')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, volume, yearBegan);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IssueSery &&
          other.id == this.id &&
          other.name == this.name &&
          other.volume == this.volume &&
          other.yearBegan == this.yearBegan);
}

class IssueSeriesCompanion extends UpdateCompanion<IssueSery> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> volume;
  final Value<int> yearBegan;
  const IssueSeriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.volume = const Value.absent(),
    this.yearBegan = const Value.absent(),
  });
  IssueSeriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int volume,
    required int yearBegan,
  }) : name = Value(name),
       volume = Value(volume),
       yearBegan = Value(yearBegan);
  static Insertable<IssueSery> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? volume,
    Expression<int>? yearBegan,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (volume != null) 'volume': volume,
      if (yearBegan != null) 'year_began': yearBegan,
    });
  }

  IssueSeriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? volume,
    Value<int>? yearBegan,
  }) {
    return IssueSeriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      volume: volume ?? this.volume,
      yearBegan: yearBegan ?? this.yearBegan,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (volume.present) {
      map['volume'] = Variable<int>(volume.value);
    }
    if (yearBegan.present) {
      map['year_began'] = Variable<int>(yearBegan.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IssueSeriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('volume: $volume, ')
          ..write('yearBegan: $yearBegan')
          ..write(')'))
        .toString();
  }
}

class $ReprintsTable extends Reprints with TableInfo<$ReprintsTable, Reprint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReprintsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _issueIdMeta = const VerificationMeta(
    'issueId',
  );
  @override
  late final GeneratedColumn<int> issueId = GeneratedColumn<int>(
    'issue_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES issues (id)',
    ),
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES issues (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [issueId, parentId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reprints';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reprint> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('issue_id')) {
      context.handle(
        _issueIdMeta,
        issueId.isAcceptableOrUnknown(data['issue_id']!, _issueIdMeta),
      );
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {issueId};
  @override
  Reprint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reprint(
      issueId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}issue_id'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $ReprintsTable createAlias(String alias) {
    return $ReprintsTable(attachedDatabase, alias);
  }
}

class Reprint extends DataClass implements Insertable<Reprint> {
  final int issueId;
  final int parentId;
  final String name;
  const Reprint({
    required this.issueId,
    required this.parentId,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['issue_id'] = Variable<int>(issueId);
    map['parent_id'] = Variable<int>(parentId);
    map['name'] = Variable<String>(name);
    return map;
  }

  ReprintsCompanion toCompanion(bool nullToAbsent) {
    return ReprintsCompanion(
      issueId: Value(issueId),
      parentId: Value(parentId),
      name: Value(name),
    );
  }

  factory Reprint.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reprint(
      issueId: serializer.fromJson<int>(json['issueId']),
      parentId: serializer.fromJson<int>(json['parentId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'issueId': serializer.toJson<int>(issueId),
      'parentId': serializer.toJson<int>(parentId),
      'name': serializer.toJson<String>(name),
    };
  }

  Reprint copyWith({int? issueId, int? parentId, String? name}) => Reprint(
    issueId: issueId ?? this.issueId,
    parentId: parentId ?? this.parentId,
    name: name ?? this.name,
  );
  Reprint copyWithCompanion(ReprintsCompanion data) {
    return Reprint(
      issueId: data.issueId.present ? data.issueId.value : this.issueId,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reprint(')
          ..write('issueId: $issueId, ')
          ..write('parentId: $parentId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(issueId, parentId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reprint &&
          other.issueId == this.issueId &&
          other.parentId == this.parentId &&
          other.name == this.name);
}

class ReprintsCompanion extends UpdateCompanion<Reprint> {
  final Value<int> issueId;
  final Value<int> parentId;
  final Value<String> name;
  const ReprintsCompanion({
    this.issueId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.name = const Value.absent(),
  });
  ReprintsCompanion.insert({
    this.issueId = const Value.absent(),
    required int parentId,
    required String name,
  }) : parentId = Value(parentId),
       name = Value(name);
  static Insertable<Reprint> custom({
    Expression<int>? issueId,
    Expression<int>? parentId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (issueId != null) 'issue_id': issueId,
      if (parentId != null) 'parent_id': parentId,
      if (name != null) 'name': name,
    });
  }

  ReprintsCompanion copyWith({
    Value<int>? issueId,
    Value<int>? parentId,
    Value<String>? name,
  }) {
    return ReprintsCompanion(
      issueId: issueId ?? this.issueId,
      parentId: parentId ?? this.parentId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (issueId.present) {
      map['issue_id'] = Variable<int>(issueId.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReprintsCompanion(')
          ..write('issueId: $issueId, ')
          ..write('parentId: $parentId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SeriesDetailsTable extends SeriesDetails
    with TableInfo<$SeriesDetailsTable, SeriesDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeriesDetailsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES series (id)',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'series_details';
  @override
  VerificationContext validateIntegrity(
    Insertable<SeriesDetail> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SeriesDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SeriesDetail(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
    );
  }

  @override
  $SeriesDetailsTable createAlias(String alias) {
    return $SeriesDetailsTable(attachedDatabase, alias);
  }
}

class SeriesDetail extends DataClass implements Insertable<SeriesDetail> {
  final int id;
  final String description;
  const SeriesDetail({required this.id, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    return map;
  }

  SeriesDetailsCompanion toCompanion(bool nullToAbsent) {
    return SeriesDetailsCompanion(
      id: Value(id),
      description: Value(description),
    );
  }

  factory SeriesDetail.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SeriesDetail(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
    };
  }

  SeriesDetail copyWith({int? id, String? description}) => SeriesDetail(
    id: id ?? this.id,
    description: description ?? this.description,
  );
  SeriesDetail copyWithCompanion(SeriesDetailsCompanion data) {
    return SeriesDetail(
      id: data.id.present ? data.id.value : this.id,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SeriesDetail(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SeriesDetail &&
          other.id == this.id &&
          other.description == this.description);
}

class SeriesDetailsCompanion extends UpdateCompanion<SeriesDetail> {
  final Value<int> id;
  final Value<String> description;
  const SeriesDetailsCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
  });
  SeriesDetailsCompanion.insert({
    this.id = const Value.absent(),
    required String description,
  }) : description = Value(description);
  static Insertable<SeriesDetail> custom({
    Expression<int>? id,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
    });
  }

  SeriesDetailsCompanion copyWith({
    Value<int>? id,
    Value<String>? description,
  }) {
    return SeriesDetailsCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesDetailsCompanion(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $TrackersTable extends Trackers with TableInfo<$TrackersTable, Tracker> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrackersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _issueIdMeta = const VerificationMeta(
    'issueId',
  );
  @override
  late final GeneratedColumn<int> issueId = GeneratedColumn<int>(
    'issue_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES issues (id)',
    ),
  );
  static const VerificationMeta _parentIssueIdMeta = const VerificationMeta(
    'parentIssueId',
  );
  @override
  late final GeneratedColumn<int> parentIssueId = GeneratedColumn<int>(
    'parent_issue_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES issues (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<TrackerStatus, int> status =
      GeneratedColumn<int>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<TrackerStatus>($TrackersTable.$converterstatus);
  @override
  List<GeneratedColumn> get $columns => [issueId, parentIssueId, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trackers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tracker> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('issue_id')) {
      context.handle(
        _issueIdMeta,
        issueId.isAcceptableOrUnknown(data['issue_id']!, _issueIdMeta),
      );
    } else if (isInserting) {
      context.missing(_issueIdMeta);
    }
    if (data.containsKey('parent_issue_id')) {
      context.handle(
        _parentIssueIdMeta,
        parentIssueId.isAcceptableOrUnknown(
          data['parent_issue_id']!,
          _parentIssueIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {issueId, status};
  @override
  Tracker map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tracker(
      issueId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}issue_id'],
      )!,
      parentIssueId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_issue_id'],
      ),
      status: $TrackersTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}status'],
        )!,
      ),
    );
  }

  @override
  $TrackersTable createAlias(String alias) {
    return $TrackersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TrackerStatus, int, int> $converterstatus =
      const EnumIndexConverter<TrackerStatus>(TrackerStatus.values);
}

class Tracker extends DataClass implements Insertable<Tracker> {
  final int issueId;
  final int? parentIssueId;
  final TrackerStatus status;
  const Tracker({
    required this.issueId,
    this.parentIssueId,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['issue_id'] = Variable<int>(issueId);
    if (!nullToAbsent || parentIssueId != null) {
      map['parent_issue_id'] = Variable<int>(parentIssueId);
    }
    {
      map['status'] = Variable<int>(
        $TrackersTable.$converterstatus.toSql(status),
      );
    }
    return map;
  }

  TrackersCompanion toCompanion(bool nullToAbsent) {
    return TrackersCompanion(
      issueId: Value(issueId),
      parentIssueId: parentIssueId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentIssueId),
      status: Value(status),
    );
  }

  factory Tracker.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tracker(
      issueId: serializer.fromJson<int>(json['issueId']),
      parentIssueId: serializer.fromJson<int?>(json['parentIssueId']),
      status: $TrackersTable.$converterstatus.fromJson(
        serializer.fromJson<int>(json['status']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'issueId': serializer.toJson<int>(issueId),
      'parentIssueId': serializer.toJson<int?>(parentIssueId),
      'status': serializer.toJson<int>(
        $TrackersTable.$converterstatus.toJson(status),
      ),
    };
  }

  Tracker copyWith({
    int? issueId,
    Value<int?> parentIssueId = const Value.absent(),
    TrackerStatus? status,
  }) => Tracker(
    issueId: issueId ?? this.issueId,
    parentIssueId: parentIssueId.present
        ? parentIssueId.value
        : this.parentIssueId,
    status: status ?? this.status,
  );
  Tracker copyWithCompanion(TrackersCompanion data) {
    return Tracker(
      issueId: data.issueId.present ? data.issueId.value : this.issueId,
      parentIssueId: data.parentIssueId.present
          ? data.parentIssueId.value
          : this.parentIssueId,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tracker(')
          ..write('issueId: $issueId, ')
          ..write('parentIssueId: $parentIssueId, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(issueId, parentIssueId, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tracker &&
          other.issueId == this.issueId &&
          other.parentIssueId == this.parentIssueId &&
          other.status == this.status);
}

class TrackersCompanion extends UpdateCompanion<Tracker> {
  final Value<int> issueId;
  final Value<int?> parentIssueId;
  final Value<TrackerStatus> status;
  final Value<int> rowid;
  const TrackersCompanion({
    this.issueId = const Value.absent(),
    this.parentIssueId = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrackersCompanion.insert({
    required int issueId,
    this.parentIssueId = const Value.absent(),
    required TrackerStatus status,
    this.rowid = const Value.absent(),
  }) : issueId = Value(issueId),
       status = Value(status);
  static Insertable<Tracker> custom({
    Expression<int>? issueId,
    Expression<int>? parentIssueId,
    Expression<int>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (issueId != null) 'issue_id': issueId,
      if (parentIssueId != null) 'parent_issue_id': parentIssueId,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrackersCompanion copyWith({
    Value<int>? issueId,
    Value<int?>? parentIssueId,
    Value<TrackerStatus>? status,
    Value<int>? rowid,
  }) {
    return TrackersCompanion(
      issueId: issueId ?? this.issueId,
      parentIssueId: parentIssueId ?? this.parentIssueId,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (issueId.present) {
      map['issue_id'] = Variable<int>(issueId.value);
    }
    if (parentIssueId.present) {
      map['parent_issue_id'] = Variable<int>(parentIssueId.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(
        $TrackersTable.$converterstatus.toSql(status.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrackersCompanion(')
          ..write('issueId: $issueId, ')
          ..write('parentIssueId: $parentIssueId, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SearchesTable extends Searches with TableInfo<$SearchesTable, Search> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
    'query',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _searchedAtMeta = const VerificationMeta(
    'searchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> searchedAt = GeneratedColumn<DateTime>(
    'searched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [query, searchedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'searches';
  @override
  VerificationContext validateIntegrity(
    Insertable<Search> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('query')) {
      context.handle(
        _queryMeta,
        query.isAcceptableOrUnknown(data['query']!, _queryMeta),
      );
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('searched_at')) {
      context.handle(
        _searchedAtMeta,
        searchedAt.isAcceptableOrUnknown(data['searched_at']!, _searchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_searchedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {query};
  @override
  Search map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Search(
      query: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}query'],
      )!,
      searchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}searched_at'],
      )!,
    );
  }

  @override
  $SearchesTable createAlias(String alias) {
    return $SearchesTable(attachedDatabase, alias);
  }
}

class Search extends DataClass implements Insertable<Search> {
  final String query;
  final DateTime searchedAt;
  const Search({required this.query, required this.searchedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['query'] = Variable<String>(query);
    map['searched_at'] = Variable<DateTime>(searchedAt);
    return map;
  }

  SearchesCompanion toCompanion(bool nullToAbsent) {
    return SearchesCompanion(
      query: Value(query),
      searchedAt: Value(searchedAt),
    );
  }

  factory Search.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Search(
      query: serializer.fromJson<String>(json['query']),
      searchedAt: serializer.fromJson<DateTime>(json['searchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'query': serializer.toJson<String>(query),
      'searchedAt': serializer.toJson<DateTime>(searchedAt),
    };
  }

  Search copyWith({String? query, DateTime? searchedAt}) => Search(
    query: query ?? this.query,
    searchedAt: searchedAt ?? this.searchedAt,
  );
  Search copyWithCompanion(SearchesCompanion data) {
    return Search(
      query: data.query.present ? data.query.value : this.query,
      searchedAt: data.searchedAt.present
          ? data.searchedAt.value
          : this.searchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Search(')
          ..write('query: $query, ')
          ..write('searchedAt: $searchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(query, searchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Search &&
          other.query == this.query &&
          other.searchedAt == this.searchedAt);
}

class SearchesCompanion extends UpdateCompanion<Search> {
  final Value<String> query;
  final Value<DateTime> searchedAt;
  final Value<int> rowid;
  const SearchesCompanion({
    this.query = const Value.absent(),
    this.searchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SearchesCompanion.insert({
    required String query,
    required DateTime searchedAt,
    this.rowid = const Value.absent(),
  }) : query = Value(query),
       searchedAt = Value(searchedAt);
  static Insertable<Search> custom({
    Expression<String>? query,
    Expression<DateTime>? searchedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (query != null) 'query': query,
      if (searchedAt != null) 'searched_at': searchedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SearchesCompanion copyWith({
    Value<String>? query,
    Value<DateTime>? searchedAt,
    Value<int>? rowid,
  }) {
    return SearchesCompanion(
      query: query ?? this.query,
      searchedAt: searchedAt ?? this.searchedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (searchedAt.present) {
      map['searched_at'] = Variable<DateTime>(searchedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchesCompanion(')
          ..write('query: $query, ')
          ..write('searchedAt: $searchedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SearchResultsTable extends SearchResults
    with TableInfo<$SearchResultsTable, SearchResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _searchMeta = const VerificationMeta('search');
  @override
  late final GeneratedColumn<String> search = GeneratedColumn<String>(
    'search',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES searches ("query")',
    ),
  );
  static const VerificationMeta _seriesIdMeta = const VerificationMeta(
    'seriesId',
  );
  @override
  late final GeneratedColumn<int> seriesId = GeneratedColumn<int>(
    'series_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES series (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [search, seriesId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_results';
  @override
  VerificationContext validateIntegrity(
    Insertable<SearchResult> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('search')) {
      context.handle(
        _searchMeta,
        search.isAcceptableOrUnknown(data['search']!, _searchMeta),
      );
    } else if (isInserting) {
      context.missing(_searchMeta);
    }
    if (data.containsKey('series_id')) {
      context.handle(
        _seriesIdMeta,
        seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_seriesIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {search, seriesId};
  @override
  SearchResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchResult(
      search: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}search'],
      )!,
      seriesId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}series_id'],
      )!,
    );
  }

  @override
  $SearchResultsTable createAlias(String alias) {
    return $SearchResultsTable(attachedDatabase, alias);
  }
}

class SearchResult extends DataClass implements Insertable<SearchResult> {
  final String search;
  final int seriesId;
  const SearchResult({required this.search, required this.seriesId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['search'] = Variable<String>(search);
    map['series_id'] = Variable<int>(seriesId);
    return map;
  }

  SearchResultsCompanion toCompanion(bool nullToAbsent) {
    return SearchResultsCompanion(
      search: Value(search),
      seriesId: Value(seriesId),
    );
  }

  factory SearchResult.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchResult(
      search: serializer.fromJson<String>(json['search']),
      seriesId: serializer.fromJson<int>(json['seriesId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'search': serializer.toJson<String>(search),
      'seriesId': serializer.toJson<int>(seriesId),
    };
  }

  SearchResult copyWith({String? search, int? seriesId}) => SearchResult(
    search: search ?? this.search,
    seriesId: seriesId ?? this.seriesId,
  );
  SearchResult copyWithCompanion(SearchResultsCompanion data) {
    return SearchResult(
      search: data.search.present ? data.search.value : this.search,
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchResult(')
          ..write('search: $search, ')
          ..write('seriesId: $seriesId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(search, seriesId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchResult &&
          other.search == this.search &&
          other.seriesId == this.seriesId);
}

class SearchResultsCompanion extends UpdateCompanion<SearchResult> {
  final Value<String> search;
  final Value<int> seriesId;
  final Value<int> rowid;
  const SearchResultsCompanion({
    this.search = const Value.absent(),
    this.seriesId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SearchResultsCompanion.insert({
    required String search,
    required int seriesId,
    this.rowid = const Value.absent(),
  }) : search = Value(search),
       seriesId = Value(seriesId);
  static Insertable<SearchResult> custom({
    Expression<String>? search,
    Expression<int>? seriesId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (search != null) 'search': search,
      if (seriesId != null) 'series_id': seriesId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SearchResultsCompanion copyWith({
    Value<String>? search,
    Value<int>? seriesId,
    Value<int>? rowid,
  }) {
    return SearchResultsCompanion(
      search: search ?? this.search,
      seriesId: seriesId ?? this.seriesId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (search.present) {
      map['search'] = Variable<String>(search.value);
    }
    if (seriesId.present) {
      map['series_id'] = Variable<int>(seriesId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchResultsCompanion(')
          ..write('search: $search, ')
          ..write('seriesId: $seriesId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SeriesTypeTable seriesType = $SeriesTypeTable(this);
  late final $SeriesTTable seriesT = $SeriesTTable(this);
  late final $IssuesTable issues = $IssuesTable(this);
  late final $IssueDetailsTable issueDetails = $IssueDetailsTable(this);
  late final $IssueSeriesTable issueSeries = $IssueSeriesTable(this);
  late final $ReprintsTable reprints = $ReprintsTable(this);
  late final $SeriesDetailsTable seriesDetails = $SeriesDetailsTable(this);
  late final $TrackersTable trackers = $TrackersTable(this);
  late final $SearchesTable searches = $SearchesTable(this);
  late final $SearchResultsTable searchResults = $SearchResultsTable(this);
  late final IssueDao issueDao = IssueDao(this as AppDatabase);
  late final SeriesDao seriesDao = SeriesDao(this as AppDatabase);
  late final TrackerDao trackerDao = TrackerDao(this as AppDatabase);
  late final SearchDao searchDao = SearchDao(this as AppDatabase);
  late final SearchResultDao searchResultDao = SearchResultDao(
    this as AppDatabase,
  );
  late final ReprintDao reprintDao = ReprintDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    seriesType,
    seriesT,
    issues,
    issueDetails,
    issueSeries,
    reprints,
    seriesDetails,
    trackers,
    searches,
    searchResults,
  ];
}

typedef $$SeriesTypeTableCreateCompanionBuilder = SeriesTypeCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$SeriesTypeTableUpdateCompanionBuilder = SeriesTypeCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$SeriesTypeTableReferences
    extends BaseReferences<_$AppDatabase, $SeriesTypeTable, SeriesTypeData> {
  $$SeriesTypeTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SeriesTTable, List<Series>> _seriesTRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.seriesT,
    aliasName: 'series_type__id__series__series_type_id',
  );

  $$SeriesTTableProcessedTableManager get seriesTRefs {
    final manager = $$SeriesTTableTableManager(
      $_db,
      $_db.seriesT,
    ).filter((f) => f.seriesTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_seriesTRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SeriesTypeTableFilterComposer
    extends Composer<_$AppDatabase, $SeriesTypeTable> {
  $$SeriesTypeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> seriesTRefs(
    Expression<bool> Function($$SeriesTTableFilterComposer f) f,
  ) {
    final $$SeriesTTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesT,
      getReferencedColumn: (t) => t.seriesTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTTableFilterComposer(
            $db: $db,
            $table: $db.seriesT,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SeriesTypeTableOrderingComposer
    extends Composer<_$AppDatabase, $SeriesTypeTable> {
  $$SeriesTypeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SeriesTypeTableAnnotationComposer
    extends Composer<_$AppDatabase, $SeriesTypeTable> {
  $$SeriesTypeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> seriesTRefs<T extends Object>(
    Expression<T> Function($$SeriesTTableAnnotationComposer a) f,
  ) {
    final $$SeriesTTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesT,
      getReferencedColumn: (t) => t.seriesTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTTableAnnotationComposer(
            $db: $db,
            $table: $db.seriesT,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SeriesTypeTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SeriesTypeTable,
          SeriesTypeData,
          $$SeriesTypeTableFilterComposer,
          $$SeriesTypeTableOrderingComposer,
          $$SeriesTypeTableAnnotationComposer,
          $$SeriesTypeTableCreateCompanionBuilder,
          $$SeriesTypeTableUpdateCompanionBuilder,
          (SeriesTypeData, $$SeriesTypeTableReferences),
          SeriesTypeData,
          PrefetchHooks Function({bool seriesTRefs})
        > {
  $$SeriesTypeTableTableManager(_$AppDatabase db, $SeriesTypeTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SeriesTypeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SeriesTypeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SeriesTypeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) => SeriesTypeCompanion(id: id, name: name),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) => SeriesTypeCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SeriesTypeTable, SeriesTypeData>(table),
                  $$SeriesTypeTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({seriesTRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (seriesTRefs) db.seriesT],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (seriesTRefs)
                    await $_getPrefetchedDataByColumns<
                      SeriesTypeData,
                      $SeriesTypeTable,
                      Series,
                      $SeriesTTable
                    >(
                      currentTable: table,
                      referencedTable: $$SeriesTypeTableReferences
                          ._seriesTRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SeriesTypeTableReferences(
                            db,
                            table,
                            p0,
                          ).seriesTRefs,
                      currentColumn: 'id',
                      referencedColumn: 'series_type_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SeriesTypeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SeriesTypeTable,
      SeriesTypeData,
      $$SeriesTypeTableFilterComposer,
      $$SeriesTypeTableOrderingComposer,
      $$SeriesTypeTableAnnotationComposer,
      $$SeriesTypeTableCreateCompanionBuilder,
      $$SeriesTypeTableUpdateCompanionBuilder,
      (SeriesTypeData, $$SeriesTypeTableReferences),
      SeriesTypeData,
      PrefetchHooks Function({bool seriesTRefs})
    >;
typedef $$SeriesTTableCreateCompanionBuilder = SeriesTCompanion Function({
  Value<int> id,
  required String name,
  required int volume,
  required int yearBegan,
  required int yearEnd,
  required int issueCount,
  required int seriesTypeId,
});
typedef $$SeriesTTableUpdateCompanionBuilder = SeriesTCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> volume,
  Value<int> yearBegan,
  Value<int> yearEnd,
  Value<int> issueCount,
  Value<int> seriesTypeId,
});

final class $$SeriesTTableReferences
    extends BaseReferences<_$AppDatabase, $SeriesTTable, Series> {
  $$SeriesTTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SeriesTypeTable _seriesTypeIdTable(_$AppDatabase db) =>
      db.seriesType.createAlias('series__series_type_id__series_type__id');

  $$SeriesTypeTableProcessedTableManager get seriesTypeId {
    final $_column = $_itemColumn<int>('series_type_id')!;

    final manager = $$SeriesTypeTableTableManager(
      $_db,
      $_db.seriesType,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_seriesTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$IssuesTable, List<Issue>> _issuesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.issues,
    aliasName: 'series__id__issues__series_id',
  );

  $$IssuesTableProcessedTableManager get issuesRefs {
    final manager = $$IssuesTableTableManager(
      $_db,
      $_db.issues,
    ).filter((f) => f.seriesId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_issuesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$IssueSeriesTable, List<IssueSery>>
  _issueSeriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.issueSeries,
    aliasName: 'series__id__issue_series__id',
  );

  $$IssueSeriesTableProcessedTableManager get issueSeriesRefs {
    final manager = $$IssueSeriesTableTableManager(
      $_db,
      $_db.issueSeries,
    ).filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_issueSeriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SeriesDetailsTable, List<SeriesDetail>>
  _seriesDetailsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.seriesDetails,
    aliasName: 'series__id__series_details__id',
  );

  $$SeriesDetailsTableProcessedTableManager get seriesDetailsRefs {
    final manager = $$SeriesDetailsTableTableManager(
      $_db,
      $_db.seriesDetails,
    ).filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_seriesDetailsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SearchResultsTable, List<SearchResult>>
  _searchResultsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.searchResults,
    aliasName: 'series__id__search_results__series_id',
  );

  $$SearchResultsTableProcessedTableManager get searchResultsRefs {
    final manager = $$SearchResultsTableTableManager(
      $_db,
      $_db.searchResults,
    ).filter((f) => f.seriesId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_searchResultsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SeriesTTableFilterComposer
    extends Composer<_$AppDatabase, $SeriesTTable> {
  $$SeriesTTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get yearBegan => $composableBuilder(
    column: $table.yearBegan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get yearEnd => $composableBuilder(
    column: $table.yearEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get issueCount => $composableBuilder(
    column: $table.issueCount,
    builder: (column) => ColumnFilters(column),
  );

  $$SeriesTypeTableFilterComposer get seriesTypeId {
    final $$SeriesTypeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesTypeId,
      referencedTable: $db.seriesType,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTypeTableFilterComposer(
            $db: $db,
            $table: $db.seriesType,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> issuesRefs(
    Expression<bool> Function($$IssuesTableFilterComposer f) f,
  ) {
    final $$IssuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableFilterComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> issueSeriesRefs(
    Expression<bool> Function($$IssueSeriesTableFilterComposer f) f,
  ) {
    final $$IssueSeriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.issueSeries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssueSeriesTableFilterComposer(
            $db: $db,
            $table: $db.issueSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> seriesDetailsRefs(
    Expression<bool> Function($$SeriesDetailsTableFilterComposer f) f,
  ) {
    final $$SeriesDetailsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesDetails,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesDetailsTableFilterComposer(
            $db: $db,
            $table: $db.seriesDetails,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> searchResultsRefs(
    Expression<bool> Function($$SearchResultsTableFilterComposer f) f,
  ) {
    final $$SearchResultsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.searchResults,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchResultsTableFilterComposer(
            $db: $db,
            $table: $db.searchResults,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SeriesTTableOrderingComposer
    extends Composer<_$AppDatabase, $SeriesTTable> {
  $$SeriesTTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get yearBegan => $composableBuilder(
    column: $table.yearBegan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get yearEnd => $composableBuilder(
    column: $table.yearEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get issueCount => $composableBuilder(
    column: $table.issueCount,
    builder: (column) => ColumnOrderings(column),
  );

  $$SeriesTypeTableOrderingComposer get seriesTypeId {
    final $$SeriesTypeTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesTypeId,
      referencedTable: $db.seriesType,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTypeTableOrderingComposer(
            $db: $db,
            $table: $db.seriesType,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SeriesTTableAnnotationComposer
    extends Composer<_$AppDatabase, $SeriesTTable> {
  $$SeriesTTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get volume =>
      $composableBuilder(column: $table.volume, builder: (column) => column);

  GeneratedColumn<int> get yearBegan =>
      $composableBuilder(column: $table.yearBegan, builder: (column) => column);

  GeneratedColumn<int> get yearEnd =>
      $composableBuilder(column: $table.yearEnd, builder: (column) => column);

  GeneratedColumn<int> get issueCount => $composableBuilder(
    column: $table.issueCount,
    builder: (column) => column,
  );

  $$SeriesTypeTableAnnotationComposer get seriesTypeId {
    final $$SeriesTypeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesTypeId,
      referencedTable: $db.seriesType,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTypeTableAnnotationComposer(
            $db: $db,
            $table: $db.seriesType,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> issuesRefs<T extends Object>(
    Expression<T> Function($$IssuesTableAnnotationComposer a) f,
  ) {
    final $$IssuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableAnnotationComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> issueSeriesRefs<T extends Object>(
    Expression<T> Function($$IssueSeriesTableAnnotationComposer a) f,
  ) {
    final $$IssueSeriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.issueSeries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssueSeriesTableAnnotationComposer(
            $db: $db,
            $table: $db.issueSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> seriesDetailsRefs<T extends Object>(
    Expression<T> Function($$SeriesDetailsTableAnnotationComposer a) f,
  ) {
    final $$SeriesDetailsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesDetails,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesDetailsTableAnnotationComposer(
            $db: $db,
            $table: $db.seriesDetails,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> searchResultsRefs<T extends Object>(
    Expression<T> Function($$SearchResultsTableAnnotationComposer a) f,
  ) {
    final $$SearchResultsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.searchResults,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchResultsTableAnnotationComposer(
            $db: $db,
            $table: $db.searchResults,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SeriesTTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SeriesTTable,
          Series,
          $$SeriesTTableFilterComposer,
          $$SeriesTTableOrderingComposer,
          $$SeriesTTableAnnotationComposer,
          $$SeriesTTableCreateCompanionBuilder,
          $$SeriesTTableUpdateCompanionBuilder,
          (Series, $$SeriesTTableReferences),
          Series,
          PrefetchHooks Function({
            bool seriesTypeId,
            bool issuesRefs,
            bool issueSeriesRefs,
            bool seriesDetailsRefs,
            bool searchResultsRefs,
          })
        > {
  $$SeriesTTableTableManager(_$AppDatabase db, $SeriesTTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SeriesTTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SeriesTTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SeriesTTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> volume = const Value.absent(),
                Value<int> yearBegan = const Value.absent(),
                Value<int> yearEnd = const Value.absent(),
                Value<int> issueCount = const Value.absent(),
                Value<int> seriesTypeId = const Value.absent(),
              }) => SeriesTCompanion(
                id: id,
                name: name,
                volume: volume,
                yearBegan: yearBegan,
                yearEnd: yearEnd,
                issueCount: issueCount,
                seriesTypeId: seriesTypeId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int volume,
                required int yearBegan,
                required int yearEnd,
                required int issueCount,
                required int seriesTypeId,
              }) => SeriesTCompanion.insert(
                id: id,
                name: name,
                volume: volume,
                yearBegan: yearBegan,
                yearEnd: yearEnd,
                issueCount: issueCount,
                seriesTypeId: seriesTypeId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SeriesTTable, Series>(table),
                  $$SeriesTTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                seriesTypeId = false,
                issuesRefs = false,
                issueSeriesRefs = false,
                seriesDetailsRefs = false,
                searchResultsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (issuesRefs) db.issues,
                    if (issueSeriesRefs) db.issueSeries,
                    if (seriesDetailsRefs) db.seriesDetails,
                    if (searchResultsRefs) db.searchResults,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (seriesTypeId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.seriesTypeId,
                            referencedTable: $$SeriesTTableReferences
                                ._seriesTypeIdTable(db),
                            referencedColumn: $$SeriesTTableReferences
                                ._seriesTypeIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (issuesRefs)
                        await $_getPrefetchedDataByColumns<
                          Series,
                          $SeriesTTable,
                          Issue,
                          $IssuesTable
                        >(
                          currentTable: table,
                          referencedTable: $$SeriesTTableReferences
                              ._issuesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SeriesTTableReferences(
                                db,
                                table,
                                p0,
                              ).issuesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'series_id',
                          typedResults: items,
                        ),
                      if (issueSeriesRefs)
                        await $_getPrefetchedDataByColumns<
                          Series,
                          $SeriesTTable,
                          IssueSery,
                          $IssueSeriesTable
                        >(
                          currentTable: table,
                          referencedTable: $$SeriesTTableReferences
                              ._issueSeriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SeriesTTableReferences(
                                db,
                                table,
                                p0,
                              ).issueSeriesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'id',
                          typedResults: items,
                        ),
                      if (seriesDetailsRefs)
                        await $_getPrefetchedDataByColumns<
                          Series,
                          $SeriesTTable,
                          SeriesDetail,
                          $SeriesDetailsTable
                        >(
                          currentTable: table,
                          referencedTable: $$SeriesTTableReferences
                              ._seriesDetailsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SeriesTTableReferences(
                                db,
                                table,
                                p0,
                              ).seriesDetailsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'id',
                          typedResults: items,
                        ),
                      if (searchResultsRefs)
                        await $_getPrefetchedDataByColumns<
                          Series,
                          $SeriesTTable,
                          SearchResult,
                          $SearchResultsTable
                        >(
                          currentTable: table,
                          referencedTable: $$SeriesTTableReferences
                              ._searchResultsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SeriesTTableReferences(
                                db,
                                table,
                                p0,
                              ).searchResultsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'series_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SeriesTTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SeriesTTable,
      Series,
      $$SeriesTTableFilterComposer,
      $$SeriesTTableOrderingComposer,
      $$SeriesTTableAnnotationComposer,
      $$SeriesTTableCreateCompanionBuilder,
      $$SeriesTTableUpdateCompanionBuilder,
      (Series, $$SeriesTTableReferences),
      Series,
      PrefetchHooks Function({
        bool seriesTypeId,
        bool issuesRefs,
        bool issueSeriesRefs,
        bool seriesDetailsRefs,
        bool searchResultsRefs,
      })
    >;
typedef $$IssuesTableCreateCompanionBuilder = IssuesCompanion Function({
  Value<int> id,
  required int seriesId,
  required String number,
  required String name,
  required String imageUrl,
});
typedef $$IssuesTableUpdateCompanionBuilder = IssuesCompanion Function({
  Value<int> id,
  Value<int> seriesId,
  Value<String> number,
  Value<String> name,
  Value<String> imageUrl,
});

final class $$IssuesTableReferences
    extends BaseReferences<_$AppDatabase, $IssuesTable, Issue> {
  $$IssuesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SeriesTTable _seriesIdTable(_$AppDatabase db) =>
      db.seriesT.createAlias('issues__series_id__series__id');

  $$SeriesTTableProcessedTableManager get seriesId {
    final $_column = $_itemColumn<int>('series_id')!;

    final manager = $$SeriesTTableTableManager(
      $_db,
      $_db.seriesT,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_seriesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$IssueDetailsTable, List<IssueDetail>>
  _issueDetailsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.issueDetails,
    aliasName: 'issues__id__issue_details__id',
  );

  $$IssueDetailsTableProcessedTableManager get issueDetailsRefs {
    final manager = $$IssueDetailsTableTableManager(
      $_db,
      $_db.issueDetails,
    ).filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_issueDetailsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReprintsTable, List<Reprint>> _reprintIdTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.reprints,
    aliasName: 'issues__id__reprints__issue_id',
  );

  $$ReprintsTableProcessedTableManager get reprintId {
    final manager = $$ReprintsTableTableManager(
      $_db,
      $_db.reprints,
    ).filter((f) => f.issueId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_reprintIdTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReprintsTable, List<Reprint>>
  _reprintParentIdTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reprints,
    aliasName: 'issues__id__reprints__parent_id',
  );

  $$ReprintsTableProcessedTableManager get reprintParentId {
    final manager = $$ReprintsTableTableManager(
      $_db,
      $_db.reprints,
    ).filter((f) => f.parentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_reprintParentIdTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TrackersTable, List<Tracker>> _issueIdTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.trackers,
    aliasName: 'issues__id__trackers__issue_id',
  );

  $$TrackersTableProcessedTableManager get issueId {
    final manager = $$TrackersTableTableManager(
      $_db,
      $_db.trackers,
    ).filter((f) => f.issueId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_issueIdTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TrackersTable, List<Tracker>> _parentIssueIdTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.trackers,
    aliasName: 'issues__id__trackers__parent_issue_id',
  );

  $$TrackersTableProcessedTableManager get parentIssueId {
    final manager = $$TrackersTableTableManager(
      $_db,
      $_db.trackers,
    ).filter((f) => f.parentIssueId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_parentIssueIdTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$IssuesTableFilterComposer
    extends Composer<_$AppDatabase, $IssuesTable> {
  $$IssuesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  $$SeriesTTableFilterComposer get seriesId {
    final $$SeriesTTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesT,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTTableFilterComposer(
            $db: $db,
            $table: $db.seriesT,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> issueDetailsRefs(
    Expression<bool> Function($$IssueDetailsTableFilterComposer f) f,
  ) {
    final $$IssueDetailsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.issueDetails,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssueDetailsTableFilterComposer(
            $db: $db,
            $table: $db.issueDetails,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reprintId(
    Expression<bool> Function($$ReprintsTableFilterComposer f) f,
  ) {
    final $$ReprintsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reprints,
      getReferencedColumn: (t) => t.issueId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReprintsTableFilterComposer(
            $db: $db,
            $table: $db.reprints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reprintParentId(
    Expression<bool> Function($$ReprintsTableFilterComposer f) f,
  ) {
    final $$ReprintsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reprints,
      getReferencedColumn: (t) => t.parentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReprintsTableFilterComposer(
            $db: $db,
            $table: $db.reprints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> issueId(
    Expression<bool> Function($$TrackersTableFilterComposer f) f,
  ) {
    final $$TrackersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.trackers,
      getReferencedColumn: (t) => t.issueId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrackersTableFilterComposer(
            $db: $db,
            $table: $db.trackers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> parentIssueId(
    Expression<bool> Function($$TrackersTableFilterComposer f) f,
  ) {
    final $$TrackersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.trackers,
      getReferencedColumn: (t) => t.parentIssueId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrackersTableFilterComposer(
            $db: $db,
            $table: $db.trackers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IssuesTableOrderingComposer
    extends Composer<_$AppDatabase, $IssuesTable> {
  $$IssuesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  $$SeriesTTableOrderingComposer get seriesId {
    final $$SeriesTTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesT,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTTableOrderingComposer(
            $db: $db,
            $table: $db.seriesT,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IssuesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IssuesTable> {
  $$IssuesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  $$SeriesTTableAnnotationComposer get seriesId {
    final $$SeriesTTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesT,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTTableAnnotationComposer(
            $db: $db,
            $table: $db.seriesT,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> issueDetailsRefs<T extends Object>(
    Expression<T> Function($$IssueDetailsTableAnnotationComposer a) f,
  ) {
    final $$IssueDetailsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.issueDetails,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssueDetailsTableAnnotationComposer(
            $db: $db,
            $table: $db.issueDetails,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> reprintId<T extends Object>(
    Expression<T> Function($$ReprintsTableAnnotationComposer a) f,
  ) {
    final $$ReprintsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reprints,
      getReferencedColumn: (t) => t.issueId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReprintsTableAnnotationComposer(
            $db: $db,
            $table: $db.reprints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> reprintParentId<T extends Object>(
    Expression<T> Function($$ReprintsTableAnnotationComposer a) f,
  ) {
    final $$ReprintsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reprints,
      getReferencedColumn: (t) => t.parentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReprintsTableAnnotationComposer(
            $db: $db,
            $table: $db.reprints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> issueId<T extends Object>(
    Expression<T> Function($$TrackersTableAnnotationComposer a) f,
  ) {
    final $$TrackersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.trackers,
      getReferencedColumn: (t) => t.issueId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrackersTableAnnotationComposer(
            $db: $db,
            $table: $db.trackers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> parentIssueId<T extends Object>(
    Expression<T> Function($$TrackersTableAnnotationComposer a) f,
  ) {
    final $$TrackersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.trackers,
      getReferencedColumn: (t) => t.parentIssueId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrackersTableAnnotationComposer(
            $db: $db,
            $table: $db.trackers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IssuesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IssuesTable,
          Issue,
          $$IssuesTableFilterComposer,
          $$IssuesTableOrderingComposer,
          $$IssuesTableAnnotationComposer,
          $$IssuesTableCreateCompanionBuilder,
          $$IssuesTableUpdateCompanionBuilder,
          (Issue, $$IssuesTableReferences),
          Issue,
          PrefetchHooks Function({
            bool seriesId,
            bool issueDetailsRefs,
            bool reprintId,
            bool reprintParentId,
            bool issueId,
            bool parentIssueId,
          })
        > {
  $$IssuesTableTableManager(_$AppDatabase db, $IssuesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IssuesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IssuesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IssuesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> seriesId = const Value.absent(),
                Value<String> number = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
              }) => IssuesCompanion(
                id: id,
                seriesId: seriesId,
                number: number,
                name: name,
                imageUrl: imageUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int seriesId,
                required String number,
                required String name,
                required String imageUrl,
              }) => IssuesCompanion.insert(
                id: id,
                seriesId: seriesId,
                number: number,
                name: name,
                imageUrl: imageUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$IssuesTable, Issue>(table),
                  $$IssuesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                seriesId = false,
                issueDetailsRefs = false,
                reprintId = false,
                reprintParentId = false,
                issueId = false,
                parentIssueId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (issueDetailsRefs) db.issueDetails,
                    if (reprintId) db.reprints,
                    if (reprintParentId) db.reprints,
                    if (issueId) db.trackers,
                    if (parentIssueId) db.trackers,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (seriesId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.seriesId,
                            referencedTable: $$IssuesTableReferences
                                ._seriesIdTable(db),
                            referencedColumn: $$IssuesTableReferences
                                ._seriesIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (issueDetailsRefs)
                        await $_getPrefetchedDataByColumns<
                          Issue,
                          $IssuesTable,
                          IssueDetail,
                          $IssueDetailsTable
                        >(
                          currentTable: table,
                          referencedTable: $$IssuesTableReferences
                              ._issueDetailsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IssuesTableReferences(
                                db,
                                table,
                                p0,
                              ).issueDetailsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'id',
                          typedResults: items,
                        ),
                      if (reprintId)
                        await $_getPrefetchedDataByColumns<
                          Issue,
                          $IssuesTable,
                          Reprint,
                          $ReprintsTable
                        >(
                          currentTable: table,
                          referencedTable: $$IssuesTableReferences
                              ._reprintIdTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IssuesTableReferences(db, table, p0).reprintId,
                          currentColumn: 'id',
                          referencedColumn: 'issue_id',
                          typedResults: items,
                        ),
                      if (reprintParentId)
                        await $_getPrefetchedDataByColumns<
                          Issue,
                          $IssuesTable,
                          Reprint,
                          $ReprintsTable
                        >(
                          currentTable: table,
                          referencedTable: $$IssuesTableReferences
                              ._reprintParentIdTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IssuesTableReferences(
                                db,
                                table,
                                p0,
                              ).reprintParentId,
                          currentColumn: 'id',
                          referencedColumn: 'parent_id',
                          typedResults: items,
                        ),
                      if (issueId)
                        await $_getPrefetchedDataByColumns<
                          Issue,
                          $IssuesTable,
                          Tracker,
                          $TrackersTable
                        >(
                          currentTable: table,
                          referencedTable: $$IssuesTableReferences
                              ._issueIdTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IssuesTableReferences(db, table, p0).issueId,
                          currentColumn: 'id',
                          referencedColumn: 'issue_id',
                          typedResults: items,
                        ),
                      if (parentIssueId)
                        await $_getPrefetchedDataByColumns<
                          Issue,
                          $IssuesTable,
                          Tracker,
                          $TrackersTable
                        >(
                          currentTable: table,
                          referencedTable: $$IssuesTableReferences
                              ._parentIssueIdTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IssuesTableReferences(
                                db,
                                table,
                                p0,
                              ).parentIssueId,
                          currentColumn: 'id',
                          referencedColumn: 'parent_issue_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$IssuesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IssuesTable,
      Issue,
      $$IssuesTableFilterComposer,
      $$IssuesTableOrderingComposer,
      $$IssuesTableAnnotationComposer,
      $$IssuesTableCreateCompanionBuilder,
      $$IssuesTableUpdateCompanionBuilder,
      (Issue, $$IssuesTableReferences),
      Issue,
      PrefetchHooks Function({
        bool seriesId,
        bool issueDetailsRefs,
        bool reprintId,
        bool reprintParentId,
        bool issueId,
        bool parentIssueId,
      })
    >;
typedef $$IssueDetailsTableCreateCompanionBuilder =
    IssueDetailsCompanion Function({Value<int> id, required int pages});
typedef $$IssueDetailsTableUpdateCompanionBuilder =
    IssueDetailsCompanion Function({Value<int> id, Value<int> pages});

final class $$IssueDetailsTableReferences
    extends BaseReferences<_$AppDatabase, $IssueDetailsTable, IssueDetail> {
  $$IssueDetailsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $IssuesTable _idTable(_$AppDatabase db) =>
      db.issues.createAlias('issue_details__id__issues__id');

  $$IssuesTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$IssuesTableTableManager(
      $_db,
      $_db.issues,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$IssueDetailsTableFilterComposer
    extends Composer<_$AppDatabase, $IssueDetailsTable> {
  $$IssueDetailsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get pages => $composableBuilder(
    column: $table.pages,
    builder: (column) => ColumnFilters(column),
  );

  $$IssuesTableFilterComposer get id {
    final $$IssuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableFilterComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IssueDetailsTableOrderingComposer
    extends Composer<_$AppDatabase, $IssueDetailsTable> {
  $$IssueDetailsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get pages => $composableBuilder(
    column: $table.pages,
    builder: (column) => ColumnOrderings(column),
  );

  $$IssuesTableOrderingComposer get id {
    final $$IssuesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableOrderingComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IssueDetailsTableAnnotationComposer
    extends Composer<_$AppDatabase, $IssueDetailsTable> {
  $$IssueDetailsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get pages =>
      $composableBuilder(column: $table.pages, builder: (column) => column);

  $$IssuesTableAnnotationComposer get id {
    final $$IssuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableAnnotationComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IssueDetailsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IssueDetailsTable,
          IssueDetail,
          $$IssueDetailsTableFilterComposer,
          $$IssueDetailsTableOrderingComposer,
          $$IssueDetailsTableAnnotationComposer,
          $$IssueDetailsTableCreateCompanionBuilder,
          $$IssueDetailsTableUpdateCompanionBuilder,
          (IssueDetail, $$IssueDetailsTableReferences),
          IssueDetail,
          PrefetchHooks Function({bool id})
        > {
  $$IssueDetailsTableTableManager(_$AppDatabase db, $IssueDetailsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IssueDetailsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IssueDetailsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IssueDetailsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> pages = const Value.absent(),
          }) => IssueDetailsCompanion(id: id, pages: pages),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int pages,
          }) => IssueDetailsCompanion.insert(id: id, pages: pages),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$IssueDetailsTable, IssueDetail>(table),
                  $$IssueDetailsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (id) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.id,
                        referencedTable: $$IssueDetailsTableReferences._idTable(
                          db,
                        ),
                        referencedColumn: $$IssueDetailsTableReferences
                            ._idTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$IssueDetailsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IssueDetailsTable,
      IssueDetail,
      $$IssueDetailsTableFilterComposer,
      $$IssueDetailsTableOrderingComposer,
      $$IssueDetailsTableAnnotationComposer,
      $$IssueDetailsTableCreateCompanionBuilder,
      $$IssueDetailsTableUpdateCompanionBuilder,
      (IssueDetail, $$IssueDetailsTableReferences),
      IssueDetail,
      PrefetchHooks Function({bool id})
    >;
typedef $$IssueSeriesTableCreateCompanionBuilder =
    IssueSeriesCompanion Function({
      Value<int> id,
      required String name,
      required int volume,
      required int yearBegan,
    });
typedef $$IssueSeriesTableUpdateCompanionBuilder =
    IssueSeriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> volume,
      Value<int> yearBegan,
    });

final class $$IssueSeriesTableReferences
    extends BaseReferences<_$AppDatabase, $IssueSeriesTable, IssueSery> {
  $$IssueSeriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SeriesTTable _idTable(_$AppDatabase db) =>
      db.seriesT.createAlias('issue_series__id__series__id');

  $$SeriesTTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$SeriesTTableTableManager(
      $_db,
      $_db.seriesT,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$IssueSeriesTableFilterComposer
    extends Composer<_$AppDatabase, $IssueSeriesTable> {
  $$IssueSeriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get yearBegan => $composableBuilder(
    column: $table.yearBegan,
    builder: (column) => ColumnFilters(column),
  );

  $$SeriesTTableFilterComposer get id {
    final $$SeriesTTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesT,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTTableFilterComposer(
            $db: $db,
            $table: $db.seriesT,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IssueSeriesTableOrderingComposer
    extends Composer<_$AppDatabase, $IssueSeriesTable> {
  $$IssueSeriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get yearBegan => $composableBuilder(
    column: $table.yearBegan,
    builder: (column) => ColumnOrderings(column),
  );

  $$SeriesTTableOrderingComposer get id {
    final $$SeriesTTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesT,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTTableOrderingComposer(
            $db: $db,
            $table: $db.seriesT,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IssueSeriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IssueSeriesTable> {
  $$IssueSeriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get volume =>
      $composableBuilder(column: $table.volume, builder: (column) => column);

  GeneratedColumn<int> get yearBegan =>
      $composableBuilder(column: $table.yearBegan, builder: (column) => column);

  $$SeriesTTableAnnotationComposer get id {
    final $$SeriesTTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesT,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTTableAnnotationComposer(
            $db: $db,
            $table: $db.seriesT,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IssueSeriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IssueSeriesTable,
          IssueSery,
          $$IssueSeriesTableFilterComposer,
          $$IssueSeriesTableOrderingComposer,
          $$IssueSeriesTableAnnotationComposer,
          $$IssueSeriesTableCreateCompanionBuilder,
          $$IssueSeriesTableUpdateCompanionBuilder,
          (IssueSery, $$IssueSeriesTableReferences),
          IssueSery,
          PrefetchHooks Function({bool id})
        > {
  $$IssueSeriesTableTableManager(_$AppDatabase db, $IssueSeriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IssueSeriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IssueSeriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IssueSeriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> volume = const Value.absent(),
                Value<int> yearBegan = const Value.absent(),
              }) => IssueSeriesCompanion(
                id: id,
                name: name,
                volume: volume,
                yearBegan: yearBegan,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int volume,
                required int yearBegan,
              }) => IssueSeriesCompanion.insert(
                id: id,
                name: name,
                volume: volume,
                yearBegan: yearBegan,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$IssueSeriesTable, IssueSery>(table),
                  $$IssueSeriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (id) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.id,
                        referencedTable: $$IssueSeriesTableReferences._idTable(
                          db,
                        ),
                        referencedColumn: $$IssueSeriesTableReferences
                            ._idTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$IssueSeriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IssueSeriesTable,
      IssueSery,
      $$IssueSeriesTableFilterComposer,
      $$IssueSeriesTableOrderingComposer,
      $$IssueSeriesTableAnnotationComposer,
      $$IssueSeriesTableCreateCompanionBuilder,
      $$IssueSeriesTableUpdateCompanionBuilder,
      (IssueSery, $$IssueSeriesTableReferences),
      IssueSery,
      PrefetchHooks Function({bool id})
    >;
typedef $$ReprintsTableCreateCompanionBuilder = ReprintsCompanion Function({
  Value<int> issueId,
  required int parentId,
  required String name,
});
typedef $$ReprintsTableUpdateCompanionBuilder = ReprintsCompanion Function({
  Value<int> issueId,
  Value<int> parentId,
  Value<String> name,
});

final class $$ReprintsTableReferences
    extends BaseReferences<_$AppDatabase, $ReprintsTable, Reprint> {
  $$ReprintsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $IssuesTable _issueIdTable(_$AppDatabase db) =>
      db.issues.createAlias('reprints__issue_id__issues__id');

  $$IssuesTableProcessedTableManager get issueId {
    final $_column = $_itemColumn<int>('issue_id')!;

    final manager = $$IssuesTableTableManager(
      $_db,
      $_db.issues,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_issueIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $IssuesTable _parentIdTable(_$AppDatabase db) =>
      db.issues.createAlias('reprints__parent_id__issues__id');

  $$IssuesTableProcessedTableManager get parentId {
    final $_column = $_itemColumn<int>('parent_id')!;

    final manager = $$IssuesTableTableManager(
      $_db,
      $_db.issues,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReprintsTableFilterComposer
    extends Composer<_$AppDatabase, $ReprintsTable> {
  $$ReprintsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  $$IssuesTableFilterComposer get issueId {
    final $$IssuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.issueId,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableFilterComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IssuesTableFilterComposer get parentId {
    final $$IssuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableFilterComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReprintsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReprintsTable> {
  $$ReprintsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  $$IssuesTableOrderingComposer get issueId {
    final $$IssuesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.issueId,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableOrderingComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IssuesTableOrderingComposer get parentId {
    final $$IssuesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableOrderingComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReprintsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReprintsTable> {
  $$ReprintsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$IssuesTableAnnotationComposer get issueId {
    final $$IssuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.issueId,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableAnnotationComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IssuesTableAnnotationComposer get parentId {
    final $$IssuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableAnnotationComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReprintsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReprintsTable,
          Reprint,
          $$ReprintsTableFilterComposer,
          $$ReprintsTableOrderingComposer,
          $$ReprintsTableAnnotationComposer,
          $$ReprintsTableCreateCompanionBuilder,
          $$ReprintsTableUpdateCompanionBuilder,
          (Reprint, $$ReprintsTableReferences),
          Reprint,
          PrefetchHooks Function({bool issueId, bool parentId})
        > {
  $$ReprintsTableTableManager(_$AppDatabase db, $ReprintsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReprintsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReprintsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReprintsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> issueId = const Value.absent(),
                Value<int> parentId = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => ReprintsCompanion(
                issueId: issueId,
                parentId: parentId,
                name: name,
              ),
          createCompanionCallback:
              ({
                Value<int> issueId = const Value.absent(),
                required int parentId,
                required String name,
              }) => ReprintsCompanion.insert(
                issueId: issueId,
                parentId: parentId,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ReprintsTable, Reprint>(table),
                  $$ReprintsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({issueId = false, parentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (issueId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.issueId,
                        referencedTable: $$ReprintsTableReferences
                            ._issueIdTable(db),
                        referencedColumn: $$ReprintsTableReferences
                            ._issueIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (parentId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.parentId,
                        referencedTable: $$ReprintsTableReferences
                            ._parentIdTable(db),
                        referencedColumn: $$ReprintsTableReferences
                            ._parentIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReprintsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReprintsTable,
      Reprint,
      $$ReprintsTableFilterComposer,
      $$ReprintsTableOrderingComposer,
      $$ReprintsTableAnnotationComposer,
      $$ReprintsTableCreateCompanionBuilder,
      $$ReprintsTableUpdateCompanionBuilder,
      (Reprint, $$ReprintsTableReferences),
      Reprint,
      PrefetchHooks Function({bool issueId, bool parentId})
    >;
typedef $$SeriesDetailsTableCreateCompanionBuilder =
    SeriesDetailsCompanion Function({
      Value<int> id,
      required String description,
    });
typedef $$SeriesDetailsTableUpdateCompanionBuilder =
    SeriesDetailsCompanion Function({Value<int> id, Value<String> description});

final class $$SeriesDetailsTableReferences
    extends BaseReferences<_$AppDatabase, $SeriesDetailsTable, SeriesDetail> {
  $$SeriesDetailsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SeriesTTable _idTable(_$AppDatabase db) =>
      db.seriesT.createAlias('series_details__id__series__id');

  $$SeriesTTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$SeriesTTableTableManager(
      $_db,
      $_db.seriesT,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SeriesDetailsTableFilterComposer
    extends Composer<_$AppDatabase, $SeriesDetailsTable> {
  $$SeriesDetailsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$SeriesTTableFilterComposer get id {
    final $$SeriesTTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesT,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTTableFilterComposer(
            $db: $db,
            $table: $db.seriesT,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SeriesDetailsTableOrderingComposer
    extends Composer<_$AppDatabase, $SeriesDetailsTable> {
  $$SeriesDetailsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$SeriesTTableOrderingComposer get id {
    final $$SeriesTTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesT,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTTableOrderingComposer(
            $db: $db,
            $table: $db.seriesT,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SeriesDetailsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SeriesDetailsTable> {
  $$SeriesDetailsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$SeriesTTableAnnotationComposer get id {
    final $$SeriesTTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesT,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTTableAnnotationComposer(
            $db: $db,
            $table: $db.seriesT,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SeriesDetailsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SeriesDetailsTable,
          SeriesDetail,
          $$SeriesDetailsTableFilterComposer,
          $$SeriesDetailsTableOrderingComposer,
          $$SeriesDetailsTableAnnotationComposer,
          $$SeriesDetailsTableCreateCompanionBuilder,
          $$SeriesDetailsTableUpdateCompanionBuilder,
          (SeriesDetail, $$SeriesDetailsTableReferences),
          SeriesDetail,
          PrefetchHooks Function({bool id})
        > {
  $$SeriesDetailsTableTableManager(_$AppDatabase db, $SeriesDetailsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SeriesDetailsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SeriesDetailsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SeriesDetailsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> description = const Value.absent(),
          }) => SeriesDetailsCompanion(id: id, description: description),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String description,
          }) => SeriesDetailsCompanion.insert(id: id, description: description),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SeriesDetailsTable, SeriesDetail>(table),
                  $$SeriesDetailsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (id) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.id,
                        referencedTable: $$SeriesDetailsTableReferences
                            ._idTable(db),
                        referencedColumn: $$SeriesDetailsTableReferences
                            ._idTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SeriesDetailsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SeriesDetailsTable,
      SeriesDetail,
      $$SeriesDetailsTableFilterComposer,
      $$SeriesDetailsTableOrderingComposer,
      $$SeriesDetailsTableAnnotationComposer,
      $$SeriesDetailsTableCreateCompanionBuilder,
      $$SeriesDetailsTableUpdateCompanionBuilder,
      (SeriesDetail, $$SeriesDetailsTableReferences),
      SeriesDetail,
      PrefetchHooks Function({bool id})
    >;
typedef $$TrackersTableCreateCompanionBuilder = TrackersCompanion Function({
  required int issueId,
  Value<int?> parentIssueId,
  required TrackerStatus status,
  Value<int> rowid,
});
typedef $$TrackersTableUpdateCompanionBuilder = TrackersCompanion Function({
  Value<int> issueId,
  Value<int?> parentIssueId,
  Value<TrackerStatus> status,
  Value<int> rowid,
});

final class $$TrackersTableReferences
    extends BaseReferences<_$AppDatabase, $TrackersTable, Tracker> {
  $$TrackersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $IssuesTable _issueIdTable(_$AppDatabase db) =>
      db.issues.createAlias('trackers__issue_id__issues__id');

  $$IssuesTableProcessedTableManager get issueId {
    final $_column = $_itemColumn<int>('issue_id')!;

    final manager = $$IssuesTableTableManager(
      $_db,
      $_db.issues,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_issueIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $IssuesTable _parentIssueIdTable(_$AppDatabase db) =>
      db.issues.createAlias('trackers__parent_issue_id__issues__id');

  $$IssuesTableProcessedTableManager? get parentIssueId {
    final $_column = $_itemColumn<int>('parent_issue_id');
    if ($_column == null) return null;
    final manager = $$IssuesTableTableManager(
      $_db,
      $_db.issues,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIssueIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TrackersTableFilterComposer
    extends Composer<_$AppDatabase, $TrackersTable> {
  $$TrackersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<TrackerStatus, TrackerStatus, int>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$IssuesTableFilterComposer get issueId {
    final $$IssuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.issueId,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableFilterComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IssuesTableFilterComposer get parentIssueId {
    final $$IssuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentIssueId,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableFilterComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TrackersTableOrderingComposer
    extends Composer<_$AppDatabase, $TrackersTable> {
  $$TrackersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$IssuesTableOrderingComposer get issueId {
    final $$IssuesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.issueId,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableOrderingComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IssuesTableOrderingComposer get parentIssueId {
    final $$IssuesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentIssueId,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableOrderingComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TrackersTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrackersTable> {
  $$TrackersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<TrackerStatus, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$IssuesTableAnnotationComposer get issueId {
    final $$IssuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.issueId,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableAnnotationComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IssuesTableAnnotationComposer get parentIssueId {
    final $$IssuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentIssueId,
      referencedTable: $db.issues,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssuesTableAnnotationComposer(
            $db: $db,
            $table: $db.issues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TrackersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrackersTable,
          Tracker,
          $$TrackersTableFilterComposer,
          $$TrackersTableOrderingComposer,
          $$TrackersTableAnnotationComposer,
          $$TrackersTableCreateCompanionBuilder,
          $$TrackersTableUpdateCompanionBuilder,
          (Tracker, $$TrackersTableReferences),
          Tracker,
          PrefetchHooks Function({bool issueId, bool parentIssueId})
        > {
  $$TrackersTableTableManager(_$AppDatabase db, $TrackersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrackersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrackersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrackersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> issueId = const Value.absent(),
                Value<int?> parentIssueId = const Value.absent(),
                Value<TrackerStatus> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrackersCompanion(
                issueId: issueId,
                parentIssueId: parentIssueId,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int issueId,
                Value<int?> parentIssueId = const Value.absent(),
                required TrackerStatus status,
                Value<int> rowid = const Value.absent(),
              }) => TrackersCompanion.insert(
                issueId: issueId,
                parentIssueId: parentIssueId,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TrackersTable, Tracker>(table),
                  $$TrackersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({issueId = false, parentIssueId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (issueId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.issueId,
                        referencedTable: $$TrackersTableReferences
                            ._issueIdTable(db),
                        referencedColumn: $$TrackersTableReferences
                            ._issueIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (parentIssueId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.parentIssueId,
                        referencedTable: $$TrackersTableReferences
                            ._parentIssueIdTable(db),
                        referencedColumn: $$TrackersTableReferences
                            ._parentIssueIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TrackersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrackersTable,
      Tracker,
      $$TrackersTableFilterComposer,
      $$TrackersTableOrderingComposer,
      $$TrackersTableAnnotationComposer,
      $$TrackersTableCreateCompanionBuilder,
      $$TrackersTableUpdateCompanionBuilder,
      (Tracker, $$TrackersTableReferences),
      Tracker,
      PrefetchHooks Function({bool issueId, bool parentIssueId})
    >;
typedef $$SearchesTableCreateCompanionBuilder = SearchesCompanion Function({
  required String query,
  required DateTime searchedAt,
  Value<int> rowid,
});
typedef $$SearchesTableUpdateCompanionBuilder = SearchesCompanion Function({
  Value<String> query,
  Value<DateTime> searchedAt,
  Value<int> rowid,
});

final class $$SearchesTableReferences
    extends BaseReferences<_$AppDatabase, $SearchesTable, Search> {
  $$SearchesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SearchResultsTable, List<SearchResult>>
  _searchResultsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.searchResults,
    aliasName: 'searches__query__search_results__search',
  );

  $$SearchResultsTableProcessedTableManager get searchResultsRefs {
    final manager = $$SearchResultsTableTableManager(
      $_db,
      $_db.searchResults,
    ).filter((f) => f.search.query.sqlEquals($_itemColumn<String>('query')!));

    final cache = $_typedResult.readTableOrNull(_searchResultsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SearchesTableFilterComposer
    extends Composer<_$AppDatabase, $SearchesTable> {
  $$SearchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get query => $composableBuilder(
    column: $table.query,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get searchedAt => $composableBuilder(
    column: $table.searchedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> searchResultsRefs(
    Expression<bool> Function($$SearchResultsTableFilterComposer f) f,
  ) {
    final $$SearchResultsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.query,
      referencedTable: $db.searchResults,
      getReferencedColumn: (t) => t.search,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchResultsTableFilterComposer(
            $db: $db,
            $table: $db.searchResults,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SearchesTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchesTable> {
  $$SearchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get query => $composableBuilder(
    column: $table.query,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get searchedAt => $composableBuilder(
    column: $table.searchedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SearchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchesTable> {
  $$SearchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get query =>
      $composableBuilder(column: $table.query, builder: (column) => column);

  GeneratedColumn<DateTime> get searchedAt => $composableBuilder(
    column: $table.searchedAt,
    builder: (column) => column,
  );

  Expression<T> searchResultsRefs<T extends Object>(
    Expression<T> Function($$SearchResultsTableAnnotationComposer a) f,
  ) {
    final $$SearchResultsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.query,
      referencedTable: $db.searchResults,
      getReferencedColumn: (t) => t.search,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchResultsTableAnnotationComposer(
            $db: $db,
            $table: $db.searchResults,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SearchesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SearchesTable,
          Search,
          $$SearchesTableFilterComposer,
          $$SearchesTableOrderingComposer,
          $$SearchesTableAnnotationComposer,
          $$SearchesTableCreateCompanionBuilder,
          $$SearchesTableUpdateCompanionBuilder,
          (Search, $$SearchesTableReferences),
          Search,
          PrefetchHooks Function({bool searchResultsRefs})
        > {
  $$SearchesTableTableManager(_$AppDatabase db, $SearchesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> query = const Value.absent(),
                Value<DateTime> searchedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SearchesCompanion(
                query: query,
                searchedAt: searchedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String query,
                required DateTime searchedAt,
                Value<int> rowid = const Value.absent(),
              }) => SearchesCompanion.insert(
                query: query,
                searchedAt: searchedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SearchesTable, Search>(table),
                  $$SearchesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({searchResultsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (searchResultsRefs) db.searchResults,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (searchResultsRefs)
                    await $_getPrefetchedDataByColumns<
                      Search,
                      $SearchesTable,
                      SearchResult,
                      $SearchResultsTable
                    >(
                      currentTable: table,
                      referencedTable: $$SearchesTableReferences
                          ._searchResultsRefsTable(db),
                      managerFromTypedResult: (p0) => $$SearchesTableReferences(
                        db,
                        table,
                        p0,
                      ).searchResultsRefs,
                      currentColumn: 'query',
                      referencedColumn: 'search',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SearchesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SearchesTable,
      Search,
      $$SearchesTableFilterComposer,
      $$SearchesTableOrderingComposer,
      $$SearchesTableAnnotationComposer,
      $$SearchesTableCreateCompanionBuilder,
      $$SearchesTableUpdateCompanionBuilder,
      (Search, $$SearchesTableReferences),
      Search,
      PrefetchHooks Function({bool searchResultsRefs})
    >;
typedef $$SearchResultsTableCreateCompanionBuilder =
    SearchResultsCompanion Function({
      required String search,
      required int seriesId,
      Value<int> rowid,
    });
typedef $$SearchResultsTableUpdateCompanionBuilder =
    SearchResultsCompanion Function({
      Value<String> search,
      Value<int> seriesId,
      Value<int> rowid,
    });

final class $$SearchResultsTableReferences
    extends BaseReferences<_$AppDatabase, $SearchResultsTable, SearchResult> {
  $$SearchResultsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SearchesTable _searchTable(_$AppDatabase db) =>
      db.searches.createAlias('search_results__search__searches__query');

  $$SearchesTableProcessedTableManager get search {
    final $_column = $_itemColumn<String>('search')!;

    final manager = $$SearchesTableTableManager(
      $_db,
      $_db.searches,
    ).filter((f) => f.query.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_searchTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SeriesTTable _seriesIdTable(_$AppDatabase db) =>
      db.seriesT.createAlias('search_results__series_id__series__id');

  $$SeriesTTableProcessedTableManager get seriesId {
    final $_column = $_itemColumn<int>('series_id')!;

    final manager = $$SeriesTTableTableManager(
      $_db,
      $_db.seriesT,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_seriesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SearchResultsTableFilterComposer
    extends Composer<_$AppDatabase, $SearchResultsTable> {
  $$SearchResultsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SearchesTableFilterComposer get search {
    final $$SearchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.search,
      referencedTable: $db.searches,
      getReferencedColumn: (t) => t.query,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchesTableFilterComposer(
            $db: $db,
            $table: $db.searches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeriesTTableFilterComposer get seriesId {
    final $$SeriesTTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesT,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTTableFilterComposer(
            $db: $db,
            $table: $db.seriesT,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SearchResultsTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchResultsTable> {
  $$SearchResultsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SearchesTableOrderingComposer get search {
    final $$SearchesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.search,
      referencedTable: $db.searches,
      getReferencedColumn: (t) => t.query,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchesTableOrderingComposer(
            $db: $db,
            $table: $db.searches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeriesTTableOrderingComposer get seriesId {
    final $$SeriesTTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesT,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTTableOrderingComposer(
            $db: $db,
            $table: $db.seriesT,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SearchResultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchResultsTable> {
  $$SearchResultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SearchesTableAnnotationComposer get search {
    final $$SearchesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.search,
      referencedTable: $db.searches,
      getReferencedColumn: (t) => t.query,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchesTableAnnotationComposer(
            $db: $db,
            $table: $db.searches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeriesTTableAnnotationComposer get seriesId {
    final $$SeriesTTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesT,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTTableAnnotationComposer(
            $db: $db,
            $table: $db.seriesT,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SearchResultsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SearchResultsTable,
          SearchResult,
          $$SearchResultsTableFilterComposer,
          $$SearchResultsTableOrderingComposer,
          $$SearchResultsTableAnnotationComposer,
          $$SearchResultsTableCreateCompanionBuilder,
          $$SearchResultsTableUpdateCompanionBuilder,
          (SearchResult, $$SearchResultsTableReferences),
          SearchResult,
          PrefetchHooks Function({bool search, bool seriesId})
        > {
  $$SearchResultsTableTableManager(_$AppDatabase db, $SearchResultsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> search = const Value.absent(),
                Value<int> seriesId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SearchResultsCompanion(
                search: search,
                seriesId: seriesId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String search,
                required int seriesId,
                Value<int> rowid = const Value.absent(),
              }) => SearchResultsCompanion.insert(
                search: search,
                seriesId: seriesId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SearchResultsTable, SearchResult>(table),
                  $$SearchResultsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({search = false, seriesId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (search) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.search,
                        referencedTable: $$SearchResultsTableReferences
                            ._searchTable(db),
                        referencedColumn: $$SearchResultsTableReferences
                            ._searchTable(db)
                            .query,
                      ) as T;
                    }
                    if (seriesId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.seriesId,
                        referencedTable: $$SearchResultsTableReferences
                            ._seriesIdTable(db),
                        referencedColumn: $$SearchResultsTableReferences
                            ._seriesIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SearchResultsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SearchResultsTable,
      SearchResult,
      $$SearchResultsTableFilterComposer,
      $$SearchResultsTableOrderingComposer,
      $$SearchResultsTableAnnotationComposer,
      $$SearchResultsTableCreateCompanionBuilder,
      $$SearchResultsTableUpdateCompanionBuilder,
      (SearchResult, $$SearchResultsTableReferences),
      SearchResult,
      PrefetchHooks Function({bool search, bool seriesId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SeriesTypeTableTableManager get seriesType =>
      $$SeriesTypeTableTableManager(_db, _db.seriesType);
  $$SeriesTTableTableManager get seriesT =>
      $$SeriesTTableTableManager(_db, _db.seriesT);
  $$IssuesTableTableManager get issues =>
      $$IssuesTableTableManager(_db, _db.issues);
  $$IssueDetailsTableTableManager get issueDetails =>
      $$IssueDetailsTableTableManager(_db, _db.issueDetails);
  $$IssueSeriesTableTableManager get issueSeries =>
      $$IssueSeriesTableTableManager(_db, _db.issueSeries);
  $$ReprintsTableTableManager get reprints =>
      $$ReprintsTableTableManager(_db, _db.reprints);
  $$SeriesDetailsTableTableManager get seriesDetails =>
      $$SeriesDetailsTableTableManager(_db, _db.seriesDetails);
  $$TrackersTableTableManager get trackers =>
      $$TrackersTableTableManager(_db, _db.trackers);
  $$SearchesTableTableManager get searches =>
      $$SearchesTableTableManager(_db, _db.searches);
  $$SearchResultsTableTableManager get searchResults =>
      $$SearchResultsTableTableManager(_db, _db.searchResults);
}
