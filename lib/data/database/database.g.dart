// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PreacherTableTable extends PreacherTable
    with TableInfo<$PreacherTableTable, PreacherTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreacherTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
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
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _languagesMeta = const VerificationMeta(
    'languages',
  );
  @override
  late final GeneratedColumn<String> languages = GeneratedColumn<String>(
    'languages',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _denominationMeta = const VerificationMeta(
    'denomination',
  );
  @override
  late final GeneratedColumn<String> denomination = GeneratedColumn<String>(
    'denomination',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    email,
    phone,
    languages,
    denomination,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preachers';
  @override
  VerificationContext validateIntegrity(
    Insertable<PreacherTableData> instance, {
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
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('languages')) {
      context.handle(
        _languagesMeta,
        languages.isAcceptableOrUnknown(data['languages']!, _languagesMeta),
      );
    }
    if (data.containsKey('denomination')) {
      context.handle(
        _denominationMeta,
        denomination.isAcceptableOrUnknown(
          data['denomination']!,
          _denominationMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PreacherTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreacherTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      languages: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}languages'],
      ),
      denomination: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}denomination'],
      ),
    );
  }

  @override
  $PreacherTableTable createAlias(String alias) {
    return $PreacherTableTable(attachedDatabase, alias);
  }
}

class PreacherTableData extends DataClass
    implements Insertable<PreacherTableData> {
  final int id;
  final String name;
  final String? email;
  final String? phone;
  final String? languages;
  final String? denomination;
  const PreacherTableData({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.languages,
    this.denomination,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || languages != null) {
      map['languages'] = Variable<String>(languages);
    }
    if (!nullToAbsent || denomination != null) {
      map['denomination'] = Variable<String>(denomination);
    }
    return map;
  }

  PreacherTableCompanion toCompanion(bool nullToAbsent) {
    return PreacherTableCompanion(
      id: Value(id),
      name: Value(name),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      languages: languages == null && nullToAbsent
          ? const Value.absent()
          : Value(languages),
      denomination: denomination == null && nullToAbsent
          ? const Value.absent()
          : Value(denomination),
    );
  }

  factory PreacherTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreacherTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      languages: serializer.fromJson<String?>(json['languages']),
      denomination: serializer.fromJson<String?>(json['denomination']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'languages': serializer.toJson<String?>(languages),
      'denomination': serializer.toJson<String?>(denomination),
    };
  }

  PreacherTableData copyWith({
    int? id,
    String? name,
    Value<String?> email = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> languages = const Value.absent(),
    Value<String?> denomination = const Value.absent(),
  }) => PreacherTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email.present ? email.value : this.email,
    phone: phone.present ? phone.value : this.phone,
    languages: languages.present ? languages.value : this.languages,
    denomination: denomination.present ? denomination.value : this.denomination,
  );
  PreacherTableData copyWithCompanion(PreacherTableCompanion data) {
    return PreacherTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      languages: data.languages.present ? data.languages.value : this.languages,
      denomination: data.denomination.present
          ? data.denomination.value
          : this.denomination,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PreacherTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('languages: $languages, ')
          ..write('denomination: $denomination')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, email, phone, languages, denomination);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PreacherTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.languages == this.languages &&
          other.denomination == this.denomination);
}

class PreacherTableCompanion extends UpdateCompanion<PreacherTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> languages;
  final Value<String?> denomination;
  const PreacherTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.languages = const Value.absent(),
    this.denomination = const Value.absent(),
  });
  PreacherTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.languages = const Value.absent(),
    this.denomination = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PreacherTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? languages,
    Expression<String>? denomination,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (languages != null) 'languages': languages,
      if (denomination != null) 'denomination': denomination,
    });
  }

  PreacherTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? email,
    Value<String?>? phone,
    Value<String?>? languages,
    Value<String?>? denomination,
  }) {
    return PreacherTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      languages: languages ?? this.languages,
      denomination: denomination ?? this.denomination,
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
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (languages.present) {
      map['languages'] = Variable<String>(languages.value);
    }
    if (denomination.present) {
      map['denomination'] = Variable<String>(denomination.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreacherTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('languages: $languages, ')
          ..write('denomination: $denomination')
          ..write(')'))
        .toString();
  }
}

class $SermonTableTable extends SermonTable
    with TableInfo<$SermonTableTable, SermonTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SermonTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sermons';
  @override
  VerificationContext validateIntegrity(
    Insertable<SermonTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SermonTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SermonTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
    );
  }

  @override
  $SermonTableTable createAlias(String alias) {
    return $SermonTableTable(attachedDatabase, alias);
  }
}

class SermonTableData extends DataClass implements Insertable<SermonTableData> {
  final int id;
  const SermonTableData({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  SermonTableCompanion toCompanion(bool nullToAbsent) {
    return SermonTableCompanion(id: Value(id));
  }

  factory SermonTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SermonTableData(id: serializer.fromJson<int>(json['id']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'id': serializer.toJson<int>(id)};
  }

  SermonTableData copyWith({int? id}) => SermonTableData(id: id ?? this.id);
  SermonTableData copyWithCompanion(SermonTableCompanion data) {
    return SermonTableData(id: data.id.present ? data.id.value : this.id);
  }

  @override
  String toString() {
    return (StringBuffer('SermonTableData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SermonTableData && other.id == this.id);
}

class SermonTableCompanion extends UpdateCompanion<SermonTableData> {
  final Value<int> id;
  const SermonTableCompanion({this.id = const Value.absent()});
  SermonTableCompanion.insert({this.id = const Value.absent()});
  static Insertable<SermonTableData> custom({Expression<int>? id}) {
    return RawValuesInsertable({if (id != null) 'id': id});
  }

  SermonTableCompanion copyWith({Value<int>? id}) {
    return SermonTableCompanion(id: id ?? this.id);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SermonTableCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $VenueTableTable extends VenueTable
    with TableInfo<$VenueTableTable, VenueTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VenueTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'venues';
  @override
  VerificationContext validateIntegrity(
    Insertable<VenueTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VenueTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VenueTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
    );
  }

  @override
  $VenueTableTable createAlias(String alias) {
    return $VenueTableTable(attachedDatabase, alias);
  }
}

class VenueTableData extends DataClass implements Insertable<VenueTableData> {
  final int id;
  const VenueTableData({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  VenueTableCompanion toCompanion(bool nullToAbsent) {
    return VenueTableCompanion(id: Value(id));
  }

  factory VenueTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VenueTableData(id: serializer.fromJson<int>(json['id']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'id': serializer.toJson<int>(id)};
  }

  VenueTableData copyWith({int? id}) => VenueTableData(id: id ?? this.id);
  VenueTableData copyWithCompanion(VenueTableCompanion data) {
    return VenueTableData(id: data.id.present ? data.id.value : this.id);
  }

  @override
  String toString() {
    return (StringBuffer('VenueTableData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VenueTableData && other.id == this.id);
}

class VenueTableCompanion extends UpdateCompanion<VenueTableData> {
  final Value<int> id;
  const VenueTableCompanion({this.id = const Value.absent()});
  VenueTableCompanion.insert({this.id = const Value.absent()});
  static Insertable<VenueTableData> custom({Expression<int>? id}) {
    return RawValuesInsertable({if (id != null) 'id': id});
  }

  VenueTableCompanion copyWith({Value<int>? id}) {
    return VenueTableCompanion(id: id ?? this.id);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VenueTableCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $EventTableTable extends EventTable
    with TableInfo<$EventTableTable, EventTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sermonIdMeta = const VerificationMeta(
    'sermonId',
  );
  @override
  late final GeneratedColumn<int> sermonId = GeneratedColumn<int>(
    'sermon_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sermons (id)',
    ),
  );
  static const VerificationMeta _venueIdMeta = const VerificationMeta(
    'venueId',
  );
  @override
  late final GeneratedColumn<int> venueId = GeneratedColumn<int>(
    'venue_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES venues (id)',
    ),
  );
  static const VerificationMeta _preacherIdMeta = const VerificationMeta(
    'preacherId',
  );
  @override
  late final GeneratedColumn<int> preacherId = GeneratedColumn<int>(
    'preacher_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES preachers (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    category,
    type,
    sermonId,
    venueId,
    preacherId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('sermon_id')) {
      context.handle(
        _sermonIdMeta,
        sermonId.isAcceptableOrUnknown(data['sermon_id']!, _sermonIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sermonIdMeta);
    }
    if (data.containsKey('venue_id')) {
      context.handle(
        _venueIdMeta,
        venueId.isAcceptableOrUnknown(data['venue_id']!, _venueIdMeta),
      );
    } else if (isInserting) {
      context.missing(_venueIdMeta);
    }
    if (data.containsKey('preacher_id')) {
      context.handle(
        _preacherIdMeta,
        preacherId.isAcceptableOrUnknown(data['preacher_id']!, _preacherIdMeta),
      );
    } else if (isInserting) {
      context.missing(_preacherIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      sermonId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sermon_id'],
      )!,
      venueId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}venue_id'],
      )!,
      preacherId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}preacher_id'],
      )!,
    );
  }

  @override
  $EventTableTable createAlias(String alias) {
    return $EventTableTable(attachedDatabase, alias);
  }
}

class EventTableData extends DataClass implements Insertable<EventTableData> {
  final int id;
  final DateTime date;
  final String? category;
  final String? type;
  final int sermonId;
  final int venueId;
  final int preacherId;
  const EventTableData({
    required this.id,
    required this.date,
    this.category,
    this.type,
    required this.sermonId,
    required this.venueId,
    required this.preacherId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    map['sermon_id'] = Variable<int>(sermonId);
    map['venue_id'] = Variable<int>(venueId);
    map['preacher_id'] = Variable<int>(preacherId);
    return map;
  }

  EventTableCompanion toCompanion(bool nullToAbsent) {
    return EventTableCompanion(
      id: Value(id),
      date: Value(date),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      sermonId: Value(sermonId),
      venueId: Value(venueId),
      preacherId: Value(preacherId),
    );
  }

  factory EventTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventTableData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      category: serializer.fromJson<String?>(json['category']),
      type: serializer.fromJson<String?>(json['type']),
      sermonId: serializer.fromJson<int>(json['sermonId']),
      venueId: serializer.fromJson<int>(json['venueId']),
      preacherId: serializer.fromJson<int>(json['preacherId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'category': serializer.toJson<String?>(category),
      'type': serializer.toJson<String?>(type),
      'sermonId': serializer.toJson<int>(sermonId),
      'venueId': serializer.toJson<int>(venueId),
      'preacherId': serializer.toJson<int>(preacherId),
    };
  }

  EventTableData copyWith({
    int? id,
    DateTime? date,
    Value<String?> category = const Value.absent(),
    Value<String?> type = const Value.absent(),
    int? sermonId,
    int? venueId,
    int? preacherId,
  }) => EventTableData(
    id: id ?? this.id,
    date: date ?? this.date,
    category: category.present ? category.value : this.category,
    type: type.present ? type.value : this.type,
    sermonId: sermonId ?? this.sermonId,
    venueId: venueId ?? this.venueId,
    preacherId: preacherId ?? this.preacherId,
  );
  EventTableData copyWithCompanion(EventTableCompanion data) {
    return EventTableData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      category: data.category.present ? data.category.value : this.category,
      type: data.type.present ? data.type.value : this.type,
      sermonId: data.sermonId.present ? data.sermonId.value : this.sermonId,
      venueId: data.venueId.present ? data.venueId.value : this.venueId,
      preacherId: data.preacherId.present
          ? data.preacherId.value
          : this.preacherId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventTableData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('type: $type, ')
          ..write('sermonId: $sermonId, ')
          ..write('venueId: $venueId, ')
          ..write('preacherId: $preacherId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, date, category, type, sermonId, venueId, preacherId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventTableData &&
          other.id == this.id &&
          other.date == this.date &&
          other.category == this.category &&
          other.type == this.type &&
          other.sermonId == this.sermonId &&
          other.venueId == this.venueId &&
          other.preacherId == this.preacherId);
}

class EventTableCompanion extends UpdateCompanion<EventTableData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String?> category;
  final Value<String?> type;
  final Value<int> sermonId;
  final Value<int> venueId;
  final Value<int> preacherId;
  const EventTableCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.category = const Value.absent(),
    this.type = const Value.absent(),
    this.sermonId = const Value.absent(),
    this.venueId = const Value.absent(),
    this.preacherId = const Value.absent(),
  });
  EventTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.category = const Value.absent(),
    this.type = const Value.absent(),
    required int sermonId,
    required int venueId,
    required int preacherId,
  }) : date = Value(date),
       sermonId = Value(sermonId),
       venueId = Value(venueId),
       preacherId = Value(preacherId);
  static Insertable<EventTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? category,
    Expression<String>? type,
    Expression<int>? sermonId,
    Expression<int>? venueId,
    Expression<int>? preacherId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (category != null) 'category': category,
      if (type != null) 'type': type,
      if (sermonId != null) 'sermon_id': sermonId,
      if (venueId != null) 'venue_id': venueId,
      if (preacherId != null) 'preacher_id': preacherId,
    });
  }

  EventTableCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<String?>? category,
    Value<String?>? type,
    Value<int>? sermonId,
    Value<int>? venueId,
    Value<int>? preacherId,
  }) {
    return EventTableCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      category: category ?? this.category,
      type: type ?? this.type,
      sermonId: sermonId ?? this.sermonId,
      venueId: venueId ?? this.venueId,
      preacherId: preacherId ?? this.preacherId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (sermonId.present) {
      map['sermon_id'] = Variable<int>(sermonId.value);
    }
    if (venueId.present) {
      map['venue_id'] = Variable<int>(venueId.value);
    }
    if (preacherId.present) {
      map['preacher_id'] = Variable<int>(preacherId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventTableCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('type: $type, ')
          ..write('sermonId: $sermonId, ')
          ..write('venueId: $venueId, ')
          ..write('preacherId: $preacherId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PreacherTableTable preacherTable = $PreacherTableTable(this);
  late final $SermonTableTable sermonTable = $SermonTableTable(this);
  late final $VenueTableTable venueTable = $VenueTableTable(this);
  late final $EventTableTable eventTable = $EventTableTable(this);
  late final PreacherDao preacherDao = PreacherDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    preacherTable,
    sermonTable,
    venueTable,
    eventTable,
  ];
}

typedef $$PreacherTableTableCreateCompanionBuilder =
    PreacherTableCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> languages,
      Value<String?> denomination,
    });
typedef $$PreacherTableTableUpdateCompanionBuilder =
    PreacherTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> languages,
      Value<String?> denomination,
    });

final class $$PreacherTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $PreacherTableTable, PreacherTableData> {
  $$PreacherTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$EventTableTable, List<EventTableData>>
  _eventTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventTable,
    aliasName: $_aliasNameGenerator(
      db.preacherTable.id,
      db.eventTable.preacherId,
    ),
  );

  $$EventTableTableProcessedTableManager get eventTableRefs {
    final manager = $$EventTableTableTableManager(
      $_db,
      $_db.eventTable,
    ).filter((f) => f.preacherId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PreacherTableTableFilterComposer
    extends Composer<_$AppDatabase, $PreacherTableTable> {
  $$PreacherTableTableFilterComposer({
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

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get languages => $composableBuilder(
    column: $table.languages,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get denomination => $composableBuilder(
    column: $table.denomination,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> eventTableRefs(
    Expression<bool> Function($$EventTableTableFilterComposer f) f,
  ) {
    final $$EventTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventTable,
      getReferencedColumn: (t) => t.preacherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTableTableFilterComposer(
            $db: $db,
            $table: $db.eventTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PreacherTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PreacherTableTable> {
  $$PreacherTableTableOrderingComposer({
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

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languages => $composableBuilder(
    column: $table.languages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get denomination => $composableBuilder(
    column: $table.denomination,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PreacherTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreacherTableTable> {
  $$PreacherTableTableAnnotationComposer({
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

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get languages =>
      $composableBuilder(column: $table.languages, builder: (column) => column);

  GeneratedColumn<String> get denomination => $composableBuilder(
    column: $table.denomination,
    builder: (column) => column,
  );

  Expression<T> eventTableRefs<T extends Object>(
    Expression<T> Function($$EventTableTableAnnotationComposer a) f,
  ) {
    final $$EventTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventTable,
      getReferencedColumn: (t) => t.preacherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTableTableAnnotationComposer(
            $db: $db,
            $table: $db.eventTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PreacherTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PreacherTableTable,
          PreacherTableData,
          $$PreacherTableTableFilterComposer,
          $$PreacherTableTableOrderingComposer,
          $$PreacherTableTableAnnotationComposer,
          $$PreacherTableTableCreateCompanionBuilder,
          $$PreacherTableTableUpdateCompanionBuilder,
          (PreacherTableData, $$PreacherTableTableReferences),
          PreacherTableData,
          PrefetchHooks Function({bool eventTableRefs})
        > {
  $$PreacherTableTableTableManager(_$AppDatabase db, $PreacherTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreacherTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreacherTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PreacherTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> languages = const Value.absent(),
                Value<String?> denomination = const Value.absent(),
              }) => PreacherTableCompanion(
                id: id,
                name: name,
                email: email,
                phone: phone,
                languages: languages,
                denomination: denomination,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> languages = const Value.absent(),
                Value<String?> denomination = const Value.absent(),
              }) => PreacherTableCompanion.insert(
                id: id,
                name: name,
                email: email,
                phone: phone,
                languages: languages,
                denomination: denomination,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PreacherTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({eventTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (eventTableRefs) db.eventTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventTableRefs)
                    await $_getPrefetchedData<
                      PreacherTableData,
                      $PreacherTableTable,
                      EventTableData
                    >(
                      currentTable: table,
                      referencedTable: $$PreacherTableTableReferences
                          ._eventTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PreacherTableTableReferences(
                            db,
                            table,
                            p0,
                          ).eventTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.preacherId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PreacherTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PreacherTableTable,
      PreacherTableData,
      $$PreacherTableTableFilterComposer,
      $$PreacherTableTableOrderingComposer,
      $$PreacherTableTableAnnotationComposer,
      $$PreacherTableTableCreateCompanionBuilder,
      $$PreacherTableTableUpdateCompanionBuilder,
      (PreacherTableData, $$PreacherTableTableReferences),
      PreacherTableData,
      PrefetchHooks Function({bool eventTableRefs})
    >;
typedef $$SermonTableTableCreateCompanionBuilder =
    SermonTableCompanion Function({Value<int> id});
typedef $$SermonTableTableUpdateCompanionBuilder =
    SermonTableCompanion Function({Value<int> id});

final class $$SermonTableTableReferences
    extends BaseReferences<_$AppDatabase, $SermonTableTable, SermonTableData> {
  $$SermonTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventTableTable, List<EventTableData>>
  _eventTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventTable,
    aliasName: $_aliasNameGenerator(db.sermonTable.id, db.eventTable.sermonId),
  );

  $$EventTableTableProcessedTableManager get eventTableRefs {
    final manager = $$EventTableTableTableManager(
      $_db,
      $_db.eventTable,
    ).filter((f) => f.sermonId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SermonTableTableFilterComposer
    extends Composer<_$AppDatabase, $SermonTableTable> {
  $$SermonTableTableFilterComposer({
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

  Expression<bool> eventTableRefs(
    Expression<bool> Function($$EventTableTableFilterComposer f) f,
  ) {
    final $$EventTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventTable,
      getReferencedColumn: (t) => t.sermonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTableTableFilterComposer(
            $db: $db,
            $table: $db.eventTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SermonTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SermonTableTable> {
  $$SermonTableTableOrderingComposer({
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
}

class $$SermonTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SermonTableTable> {
  $$SermonTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  Expression<T> eventTableRefs<T extends Object>(
    Expression<T> Function($$EventTableTableAnnotationComposer a) f,
  ) {
    final $$EventTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventTable,
      getReferencedColumn: (t) => t.sermonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTableTableAnnotationComposer(
            $db: $db,
            $table: $db.eventTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SermonTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SermonTableTable,
          SermonTableData,
          $$SermonTableTableFilterComposer,
          $$SermonTableTableOrderingComposer,
          $$SermonTableTableAnnotationComposer,
          $$SermonTableTableCreateCompanionBuilder,
          $$SermonTableTableUpdateCompanionBuilder,
          (SermonTableData, $$SermonTableTableReferences),
          SermonTableData,
          PrefetchHooks Function({bool eventTableRefs})
        > {
  $$SermonTableTableTableManager(_$AppDatabase db, $SermonTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SermonTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SermonTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SermonTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({Value<int> id = const Value.absent()}) =>
              SermonTableCompanion(id: id),
          createCompanionCallback: ({Value<int> id = const Value.absent()}) =>
              SermonTableCompanion.insert(id: id),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SermonTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({eventTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (eventTableRefs) db.eventTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventTableRefs)
                    await $_getPrefetchedData<
                      SermonTableData,
                      $SermonTableTable,
                      EventTableData
                    >(
                      currentTable: table,
                      referencedTable: $$SermonTableTableReferences
                          ._eventTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SermonTableTableReferences(
                            db,
                            table,
                            p0,
                          ).eventTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.sermonId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SermonTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SermonTableTable,
      SermonTableData,
      $$SermonTableTableFilterComposer,
      $$SermonTableTableOrderingComposer,
      $$SermonTableTableAnnotationComposer,
      $$SermonTableTableCreateCompanionBuilder,
      $$SermonTableTableUpdateCompanionBuilder,
      (SermonTableData, $$SermonTableTableReferences),
      SermonTableData,
      PrefetchHooks Function({bool eventTableRefs})
    >;
typedef $$VenueTableTableCreateCompanionBuilder =
    VenueTableCompanion Function({Value<int> id});
typedef $$VenueTableTableUpdateCompanionBuilder =
    VenueTableCompanion Function({Value<int> id});

final class $$VenueTableTableReferences
    extends BaseReferences<_$AppDatabase, $VenueTableTable, VenueTableData> {
  $$VenueTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventTableTable, List<EventTableData>>
  _eventTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventTable,
    aliasName: $_aliasNameGenerator(db.venueTable.id, db.eventTable.venueId),
  );

  $$EventTableTableProcessedTableManager get eventTableRefs {
    final manager = $$EventTableTableTableManager(
      $_db,
      $_db.eventTable,
    ).filter((f) => f.venueId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VenueTableTableFilterComposer
    extends Composer<_$AppDatabase, $VenueTableTable> {
  $$VenueTableTableFilterComposer({
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

  Expression<bool> eventTableRefs(
    Expression<bool> Function($$EventTableTableFilterComposer f) f,
  ) {
    final $$EventTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventTable,
      getReferencedColumn: (t) => t.venueId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTableTableFilterComposer(
            $db: $db,
            $table: $db.eventTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VenueTableTableOrderingComposer
    extends Composer<_$AppDatabase, $VenueTableTable> {
  $$VenueTableTableOrderingComposer({
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
}

class $$VenueTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $VenueTableTable> {
  $$VenueTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  Expression<T> eventTableRefs<T extends Object>(
    Expression<T> Function($$EventTableTableAnnotationComposer a) f,
  ) {
    final $$EventTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventTable,
      getReferencedColumn: (t) => t.venueId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTableTableAnnotationComposer(
            $db: $db,
            $table: $db.eventTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VenueTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VenueTableTable,
          VenueTableData,
          $$VenueTableTableFilterComposer,
          $$VenueTableTableOrderingComposer,
          $$VenueTableTableAnnotationComposer,
          $$VenueTableTableCreateCompanionBuilder,
          $$VenueTableTableUpdateCompanionBuilder,
          (VenueTableData, $$VenueTableTableReferences),
          VenueTableData,
          PrefetchHooks Function({bool eventTableRefs})
        > {
  $$VenueTableTableTableManager(_$AppDatabase db, $VenueTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VenueTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VenueTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VenueTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({Value<int> id = const Value.absent()}) =>
              VenueTableCompanion(id: id),
          createCompanionCallback: ({Value<int> id = const Value.absent()}) =>
              VenueTableCompanion.insert(id: id),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VenueTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({eventTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (eventTableRefs) db.eventTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventTableRefs)
                    await $_getPrefetchedData<
                      VenueTableData,
                      $VenueTableTable,
                      EventTableData
                    >(
                      currentTable: table,
                      referencedTable: $$VenueTableTableReferences
                          ._eventTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$VenueTableTableReferences(
                            db,
                            table,
                            p0,
                          ).eventTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.venueId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$VenueTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VenueTableTable,
      VenueTableData,
      $$VenueTableTableFilterComposer,
      $$VenueTableTableOrderingComposer,
      $$VenueTableTableAnnotationComposer,
      $$VenueTableTableCreateCompanionBuilder,
      $$VenueTableTableUpdateCompanionBuilder,
      (VenueTableData, $$VenueTableTableReferences),
      VenueTableData,
      PrefetchHooks Function({bool eventTableRefs})
    >;
typedef $$EventTableTableCreateCompanionBuilder =
    EventTableCompanion Function({
      Value<int> id,
      required DateTime date,
      Value<String?> category,
      Value<String?> type,
      required int sermonId,
      required int venueId,
      required int preacherId,
    });
typedef $$EventTableTableUpdateCompanionBuilder =
    EventTableCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<String?> category,
      Value<String?> type,
      Value<int> sermonId,
      Value<int> venueId,
      Value<int> preacherId,
    });

final class $$EventTableTableReferences
    extends BaseReferences<_$AppDatabase, $EventTableTable, EventTableData> {
  $$EventTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SermonTableTable _sermonIdTable(_$AppDatabase db) =>
      db.sermonTable.createAlias(
        $_aliasNameGenerator(db.eventTable.sermonId, db.sermonTable.id),
      );

  $$SermonTableTableProcessedTableManager get sermonId {
    final $_column = $_itemColumn<int>('sermon_id')!;

    final manager = $$SermonTableTableTableManager(
      $_db,
      $_db.sermonTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sermonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $VenueTableTable _venueIdTable(_$AppDatabase db) =>
      db.venueTable.createAlias(
        $_aliasNameGenerator(db.eventTable.venueId, db.venueTable.id),
      );

  $$VenueTableTableProcessedTableManager get venueId {
    final $_column = $_itemColumn<int>('venue_id')!;

    final manager = $$VenueTableTableTableManager(
      $_db,
      $_db.venueTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_venueIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PreacherTableTable _preacherIdTable(_$AppDatabase db) =>
      db.preacherTable.createAlias(
        $_aliasNameGenerator(db.eventTable.preacherId, db.preacherTable.id),
      );

  $$PreacherTableTableProcessedTableManager get preacherId {
    final $_column = $_itemColumn<int>('preacher_id')!;

    final manager = $$PreacherTableTableTableManager(
      $_db,
      $_db.preacherTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_preacherIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EventTableTableFilterComposer
    extends Composer<_$AppDatabase, $EventTableTable> {
  $$EventTableTableFilterComposer({
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

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  $$SermonTableTableFilterComposer get sermonId {
    final $$SermonTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sermonId,
      referencedTable: $db.sermonTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SermonTableTableFilterComposer(
            $db: $db,
            $table: $db.sermonTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VenueTableTableFilterComposer get venueId {
    final $$VenueTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.venueId,
      referencedTable: $db.venueTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VenueTableTableFilterComposer(
            $db: $db,
            $table: $db.venueTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PreacherTableTableFilterComposer get preacherId {
    final $$PreacherTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.preacherId,
      referencedTable: $db.preacherTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreacherTableTableFilterComposer(
            $db: $db,
            $table: $db.preacherTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EventTableTable> {
  $$EventTableTableOrderingComposer({
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

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  $$SermonTableTableOrderingComposer get sermonId {
    final $$SermonTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sermonId,
      referencedTable: $db.sermonTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SermonTableTableOrderingComposer(
            $db: $db,
            $table: $db.sermonTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VenueTableTableOrderingComposer get venueId {
    final $$VenueTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.venueId,
      referencedTable: $db.venueTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VenueTableTableOrderingComposer(
            $db: $db,
            $table: $db.venueTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PreacherTableTableOrderingComposer get preacherId {
    final $$PreacherTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.preacherId,
      referencedTable: $db.preacherTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreacherTableTableOrderingComposer(
            $db: $db,
            $table: $db.preacherTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventTableTable> {
  $$EventTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  $$SermonTableTableAnnotationComposer get sermonId {
    final $$SermonTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sermonId,
      referencedTable: $db.sermonTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SermonTableTableAnnotationComposer(
            $db: $db,
            $table: $db.sermonTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VenueTableTableAnnotationComposer get venueId {
    final $$VenueTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.venueId,
      referencedTable: $db.venueTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VenueTableTableAnnotationComposer(
            $db: $db,
            $table: $db.venueTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PreacherTableTableAnnotationComposer get preacherId {
    final $$PreacherTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.preacherId,
      referencedTable: $db.preacherTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreacherTableTableAnnotationComposer(
            $db: $db,
            $table: $db.preacherTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventTableTable,
          EventTableData,
          $$EventTableTableFilterComposer,
          $$EventTableTableOrderingComposer,
          $$EventTableTableAnnotationComposer,
          $$EventTableTableCreateCompanionBuilder,
          $$EventTableTableUpdateCompanionBuilder,
          (EventTableData, $$EventTableTableReferences),
          EventTableData,
          PrefetchHooks Function({bool sermonId, bool venueId, bool preacherId})
        > {
  $$EventTableTableTableManager(_$AppDatabase db, $EventTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<int> sermonId = const Value.absent(),
                Value<int> venueId = const Value.absent(),
                Value<int> preacherId = const Value.absent(),
              }) => EventTableCompanion(
                id: id,
                date: date,
                category: category,
                type: type,
                sermonId: sermonId,
                venueId: venueId,
                preacherId: preacherId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                Value<String?> category = const Value.absent(),
                Value<String?> type = const Value.absent(),
                required int sermonId,
                required int venueId,
                required int preacherId,
              }) => EventTableCompanion.insert(
                id: id,
                date: date,
                category: category,
                type: type,
                sermonId: sermonId,
                venueId: venueId,
                preacherId: preacherId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EventTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({sermonId = false, venueId = false, preacherId = false}) {
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
                        if (sermonId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sermonId,
                                    referencedTable: $$EventTableTableReferences
                                        ._sermonIdTable(db),
                                    referencedColumn:
                                        $$EventTableTableReferences
                                            ._sermonIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (venueId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.venueId,
                                    referencedTable: $$EventTableTableReferences
                                        ._venueIdTable(db),
                                    referencedColumn:
                                        $$EventTableTableReferences
                                            ._venueIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (preacherId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.preacherId,
                                    referencedTable: $$EventTableTableReferences
                                        ._preacherIdTable(db),
                                    referencedColumn:
                                        $$EventTableTableReferences
                                            ._preacherIdTable(db)
                                            .id,
                                  )
                                  as T;
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

typedef $$EventTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventTableTable,
      EventTableData,
      $$EventTableTableFilterComposer,
      $$EventTableTableOrderingComposer,
      $$EventTableTableAnnotationComposer,
      $$EventTableTableCreateCompanionBuilder,
      $$EventTableTableUpdateCompanionBuilder,
      (EventTableData, $$EventTableTableReferences),
      EventTableData,
      PrefetchHooks Function({bool sermonId, bool venueId, bool preacherId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PreacherTableTableTableManager get preacherTable =>
      $$PreacherTableTableTableManager(_db, _db.preacherTable);
  $$SermonTableTableTableManager get sermonTable =>
      $$SermonTableTableTableManager(_db, _db.sermonTable);
  $$VenueTableTableTableManager get venueTable =>
      $$VenueTableTableTableManager(_db, _db.venueTable);
  $$EventTableTableTableManager get eventTable =>
      $$EventTableTableTableManager(_db, _db.eventTable);
}
