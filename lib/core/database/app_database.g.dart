// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneE164Meta = const VerificationMeta(
    'phoneE164',
  );
  @override
  late final GeneratedColumn<String> phoneE164 = GeneratedColumn<String>(
    'phone_e164',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _birthIsoMeta = const VerificationMeta(
    'birthIso',
  );
  @override
  late final GeneratedColumn<String> birthIso = GeneratedColumn<String>(
    'birth_iso',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    phoneE164,
    firstName,
    lastName,
    birthIso,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Account> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('phone_e164')) {
      context.handle(
        _phoneE164Meta,
        phoneE164.isAcceptableOrUnknown(data['phone_e164']!, _phoneE164Meta),
      );
    } else if (isInserting) {
      context.missing(_phoneE164Meta);
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    }
    if (data.containsKey('birth_iso')) {
      context.handle(
        _birthIsoMeta,
        birthIso.isAcceptableOrUnknown(data['birth_iso']!, _birthIsoMeta),
      );
    } else if (isInserting) {
      context.missing(_birthIsoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      phoneE164: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_e164'],
      )!,
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      )!,
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      )!,
      birthIso: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}birth_iso'],
      )!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }
}

class Account extends DataClass implements Insertable<Account> {
  final String id;
  final String phoneE164;
  final String firstName;
  final String lastName;
  final String birthIso;
  const Account({
    required this.id,
    required this.phoneE164,
    required this.firstName,
    required this.lastName,
    required this.birthIso,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['phone_e164'] = Variable<String>(phoneE164);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['birth_iso'] = Variable<String>(birthIso);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      phoneE164: Value(phoneE164),
      firstName: Value(firstName),
      lastName: Value(lastName),
      birthIso: Value(birthIso),
    );
  }

  factory Account.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<String>(json['id']),
      phoneE164: serializer.fromJson<String>(json['phoneE164']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      birthIso: serializer.fromJson<String>(json['birthIso']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'phoneE164': serializer.toJson<String>(phoneE164),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'birthIso': serializer.toJson<String>(birthIso),
    };
  }

  Account copyWith({
    String? id,
    String? phoneE164,
    String? firstName,
    String? lastName,
    String? birthIso,
  }) => Account(
    id: id ?? this.id,
    phoneE164: phoneE164 ?? this.phoneE164,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    birthIso: birthIso ?? this.birthIso,
  );
  Account copyWithCompanion(AccountsCompanion data) {
    return Account(
      id: data.id.present ? data.id.value : this.id,
      phoneE164: data.phoneE164.present ? data.phoneE164.value : this.phoneE164,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      birthIso: data.birthIso.present ? data.birthIso.value : this.birthIso,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('phoneE164: $phoneE164, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('birthIso: $birthIso')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, phoneE164, firstName, lastName, birthIso);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.phoneE164 == this.phoneE164 &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.birthIso == this.birthIso);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<String> id;
  final Value<String> phoneE164;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> birthIso;
  final Value<int> rowid;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.phoneE164 = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.birthIso = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountsCompanion.insert({
    required String id,
    required String phoneE164,
    required String firstName,
    this.lastName = const Value.absent(),
    required String birthIso,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       phoneE164 = Value(phoneE164),
       firstName = Value(firstName),
       birthIso = Value(birthIso);
  static Insertable<Account> custom({
    Expression<String>? id,
    Expression<String>? phoneE164,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? birthIso,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (phoneE164 != null) 'phone_e164': phoneE164,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (birthIso != null) 'birth_iso': birthIso,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountsCompanion copyWith({
    Value<String>? id,
    Value<String>? phoneE164,
    Value<String>? firstName,
    Value<String>? lastName,
    Value<String>? birthIso,
    Value<int>? rowid,
  }) {
    return AccountsCompanion(
      id: id ?? this.id,
      phoneE164: phoneE164 ?? this.phoneE164,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthIso: birthIso ?? this.birthIso,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (phoneE164.present) {
      map['phone_e164'] = Variable<String>(phoneE164.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (birthIso.present) {
      map['birth_iso'] = Variable<String>(birthIso.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('phoneE164: $phoneE164, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('birthIso: $birthIso, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MembersTable extends Members with TableInfo<$MembersTable, Member> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MembersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _tierMeta = const VerificationMeta('tier');
  @override
  late final GeneratedColumn<String> tier = GeneratedColumn<String>(
    'tier',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
    'points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pointsToNextMeta = const VerificationMeta(
    'pointsToNext',
  );
  @override
  late final GeneratedColumn<int> pointsToNext = GeneratedColumn<int>(
    'points_to_next',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nextTierMeta = const VerificationMeta(
    'nextTier',
  );
  @override
  late final GeneratedColumn<String> nextTier = GeneratedColumn<String>(
    'next_tier',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tierProgressMeta = const VerificationMeta(
    'tierProgress',
  );
  @override
  late final GeneratedColumn<double> tierProgress = GeneratedColumn<double>(
    'tier_progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notificationCountMeta = const VerificationMeta(
    'notificationCount',
  );
  @override
  late final GeneratedColumn<int> notificationCount = GeneratedColumn<int>(
    'notification_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardsBadgeMeta = const VerificationMeta(
    'rewardsBadge',
  );
  @override
  late final GeneratedColumn<int> rewardsBadge = GeneratedColumn<int>(
    'rewards_badge',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoAssetMeta = const VerificationMeta(
    'photoAsset',
  );
  @override
  late final GeneratedColumn<String> photoAsset = GeneratedColumn<String>(
    'photo_asset',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    tier,
    points,
    pointsToNext,
    nextTier,
    tierProgress,
    notificationCount,
    rewardsBadge,
    photoAsset,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'members';
  @override
  VerificationContext validateIntegrity(
    Insertable<Member> instance, {
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
    if (data.containsKey('tier')) {
      context.handle(
        _tierMeta,
        tier.isAcceptableOrUnknown(data['tier']!, _tierMeta),
      );
    } else if (isInserting) {
      context.missing(_tierMeta);
    }
    if (data.containsKey('points')) {
      context.handle(
        _pointsMeta,
        points.isAcceptableOrUnknown(data['points']!, _pointsMeta),
      );
    } else if (isInserting) {
      context.missing(_pointsMeta);
    }
    if (data.containsKey('points_to_next')) {
      context.handle(
        _pointsToNextMeta,
        pointsToNext.isAcceptableOrUnknown(
          data['points_to_next']!,
          _pointsToNextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pointsToNextMeta);
    }
    if (data.containsKey('next_tier')) {
      context.handle(
        _nextTierMeta,
        nextTier.isAcceptableOrUnknown(data['next_tier']!, _nextTierMeta),
      );
    } else if (isInserting) {
      context.missing(_nextTierMeta);
    }
    if (data.containsKey('tier_progress')) {
      context.handle(
        _tierProgressMeta,
        tierProgress.isAcceptableOrUnknown(
          data['tier_progress']!,
          _tierProgressMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tierProgressMeta);
    }
    if (data.containsKey('notification_count')) {
      context.handle(
        _notificationCountMeta,
        notificationCount.isAcceptableOrUnknown(
          data['notification_count']!,
          _notificationCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_notificationCountMeta);
    }
    if (data.containsKey('rewards_badge')) {
      context.handle(
        _rewardsBadgeMeta,
        rewardsBadge.isAcceptableOrUnknown(
          data['rewards_badge']!,
          _rewardsBadgeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rewardsBadgeMeta);
    }
    if (data.containsKey('photo_asset')) {
      context.handle(
        _photoAssetMeta,
        photoAsset.isAcceptableOrUnknown(data['photo_asset']!, _photoAssetMeta),
      );
    } else if (isInserting) {
      context.missing(_photoAssetMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Member map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Member(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      tier: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tier'],
      )!,
      points: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points'],
      )!,
      pointsToNext: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points_to_next'],
      )!,
      nextTier: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}next_tier'],
      )!,
      tierProgress: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tier_progress'],
      )!,
      notificationCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}notification_count'],
      )!,
      rewardsBadge: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rewards_badge'],
      )!,
      photoAsset: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_asset'],
      )!,
    );
  }

  @override
  $MembersTable createAlias(String alias) {
    return $MembersTable(attachedDatabase, alias);
  }
}

class Member extends DataClass implements Insertable<Member> {
  final int id;
  final String name;
  final String tier;
  final int points;
  final int pointsToNext;
  final String nextTier;
  final double tierProgress;
  final int notificationCount;
  final int rewardsBadge;
  final String photoAsset;
  const Member({
    required this.id,
    required this.name,
    required this.tier,
    required this.points,
    required this.pointsToNext,
    required this.nextTier,
    required this.tierProgress,
    required this.notificationCount,
    required this.rewardsBadge,
    required this.photoAsset,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['tier'] = Variable<String>(tier);
    map['points'] = Variable<int>(points);
    map['points_to_next'] = Variable<int>(pointsToNext);
    map['next_tier'] = Variable<String>(nextTier);
    map['tier_progress'] = Variable<double>(tierProgress);
    map['notification_count'] = Variable<int>(notificationCount);
    map['rewards_badge'] = Variable<int>(rewardsBadge);
    map['photo_asset'] = Variable<String>(photoAsset);
    return map;
  }

  MembersCompanion toCompanion(bool nullToAbsent) {
    return MembersCompanion(
      id: Value(id),
      name: Value(name),
      tier: Value(tier),
      points: Value(points),
      pointsToNext: Value(pointsToNext),
      nextTier: Value(nextTier),
      tierProgress: Value(tierProgress),
      notificationCount: Value(notificationCount),
      rewardsBadge: Value(rewardsBadge),
      photoAsset: Value(photoAsset),
    );
  }

  factory Member.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Member(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      tier: serializer.fromJson<String>(json['tier']),
      points: serializer.fromJson<int>(json['points']),
      pointsToNext: serializer.fromJson<int>(json['pointsToNext']),
      nextTier: serializer.fromJson<String>(json['nextTier']),
      tierProgress: serializer.fromJson<double>(json['tierProgress']),
      notificationCount: serializer.fromJson<int>(json['notificationCount']),
      rewardsBadge: serializer.fromJson<int>(json['rewardsBadge']),
      photoAsset: serializer.fromJson<String>(json['photoAsset']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'tier': serializer.toJson<String>(tier),
      'points': serializer.toJson<int>(points),
      'pointsToNext': serializer.toJson<int>(pointsToNext),
      'nextTier': serializer.toJson<String>(nextTier),
      'tierProgress': serializer.toJson<double>(tierProgress),
      'notificationCount': serializer.toJson<int>(notificationCount),
      'rewardsBadge': serializer.toJson<int>(rewardsBadge),
      'photoAsset': serializer.toJson<String>(photoAsset),
    };
  }

  Member copyWith({
    int? id,
    String? name,
    String? tier,
    int? points,
    int? pointsToNext,
    String? nextTier,
    double? tierProgress,
    int? notificationCount,
    int? rewardsBadge,
    String? photoAsset,
  }) => Member(
    id: id ?? this.id,
    name: name ?? this.name,
    tier: tier ?? this.tier,
    points: points ?? this.points,
    pointsToNext: pointsToNext ?? this.pointsToNext,
    nextTier: nextTier ?? this.nextTier,
    tierProgress: tierProgress ?? this.tierProgress,
    notificationCount: notificationCount ?? this.notificationCount,
    rewardsBadge: rewardsBadge ?? this.rewardsBadge,
    photoAsset: photoAsset ?? this.photoAsset,
  );
  Member copyWithCompanion(MembersCompanion data) {
    return Member(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      tier: data.tier.present ? data.tier.value : this.tier,
      points: data.points.present ? data.points.value : this.points,
      pointsToNext: data.pointsToNext.present
          ? data.pointsToNext.value
          : this.pointsToNext,
      nextTier: data.nextTier.present ? data.nextTier.value : this.nextTier,
      tierProgress: data.tierProgress.present
          ? data.tierProgress.value
          : this.tierProgress,
      notificationCount: data.notificationCount.present
          ? data.notificationCount.value
          : this.notificationCount,
      rewardsBadge: data.rewardsBadge.present
          ? data.rewardsBadge.value
          : this.rewardsBadge,
      photoAsset: data.photoAsset.present
          ? data.photoAsset.value
          : this.photoAsset,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Member(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('tier: $tier, ')
          ..write('points: $points, ')
          ..write('pointsToNext: $pointsToNext, ')
          ..write('nextTier: $nextTier, ')
          ..write('tierProgress: $tierProgress, ')
          ..write('notificationCount: $notificationCount, ')
          ..write('rewardsBadge: $rewardsBadge, ')
          ..write('photoAsset: $photoAsset')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    tier,
    points,
    pointsToNext,
    nextTier,
    tierProgress,
    notificationCount,
    rewardsBadge,
    photoAsset,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Member &&
          other.id == this.id &&
          other.name == this.name &&
          other.tier == this.tier &&
          other.points == this.points &&
          other.pointsToNext == this.pointsToNext &&
          other.nextTier == this.nextTier &&
          other.tierProgress == this.tierProgress &&
          other.notificationCount == this.notificationCount &&
          other.rewardsBadge == this.rewardsBadge &&
          other.photoAsset == this.photoAsset);
}

class MembersCompanion extends UpdateCompanion<Member> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> tier;
  final Value<int> points;
  final Value<int> pointsToNext;
  final Value<String> nextTier;
  final Value<double> tierProgress;
  final Value<int> notificationCount;
  final Value<int> rewardsBadge;
  final Value<String> photoAsset;
  const MembersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.tier = const Value.absent(),
    this.points = const Value.absent(),
    this.pointsToNext = const Value.absent(),
    this.nextTier = const Value.absent(),
    this.tierProgress = const Value.absent(),
    this.notificationCount = const Value.absent(),
    this.rewardsBadge = const Value.absent(),
    this.photoAsset = const Value.absent(),
  });
  MembersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String tier,
    required int points,
    required int pointsToNext,
    required String nextTier,
    required double tierProgress,
    required int notificationCount,
    required int rewardsBadge,
    required String photoAsset,
  }) : name = Value(name),
       tier = Value(tier),
       points = Value(points),
       pointsToNext = Value(pointsToNext),
       nextTier = Value(nextTier),
       tierProgress = Value(tierProgress),
       notificationCount = Value(notificationCount),
       rewardsBadge = Value(rewardsBadge),
       photoAsset = Value(photoAsset);
  static Insertable<Member> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? tier,
    Expression<int>? points,
    Expression<int>? pointsToNext,
    Expression<String>? nextTier,
    Expression<double>? tierProgress,
    Expression<int>? notificationCount,
    Expression<int>? rewardsBadge,
    Expression<String>? photoAsset,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (tier != null) 'tier': tier,
      if (points != null) 'points': points,
      if (pointsToNext != null) 'points_to_next': pointsToNext,
      if (nextTier != null) 'next_tier': nextTier,
      if (tierProgress != null) 'tier_progress': tierProgress,
      if (notificationCount != null) 'notification_count': notificationCount,
      if (rewardsBadge != null) 'rewards_badge': rewardsBadge,
      if (photoAsset != null) 'photo_asset': photoAsset,
    });
  }

  MembersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? tier,
    Value<int>? points,
    Value<int>? pointsToNext,
    Value<String>? nextTier,
    Value<double>? tierProgress,
    Value<int>? notificationCount,
    Value<int>? rewardsBadge,
    Value<String>? photoAsset,
  }) {
    return MembersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      tier: tier ?? this.tier,
      points: points ?? this.points,
      pointsToNext: pointsToNext ?? this.pointsToNext,
      nextTier: nextTier ?? this.nextTier,
      tierProgress: tierProgress ?? this.tierProgress,
      notificationCount: notificationCount ?? this.notificationCount,
      rewardsBadge: rewardsBadge ?? this.rewardsBadge,
      photoAsset: photoAsset ?? this.photoAsset,
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
    if (tier.present) {
      map['tier'] = Variable<String>(tier.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    if (pointsToNext.present) {
      map['points_to_next'] = Variable<int>(pointsToNext.value);
    }
    if (nextTier.present) {
      map['next_tier'] = Variable<String>(nextTier.value);
    }
    if (tierProgress.present) {
      map['tier_progress'] = Variable<double>(tierProgress.value);
    }
    if (notificationCount.present) {
      map['notification_count'] = Variable<int>(notificationCount.value);
    }
    if (rewardsBadge.present) {
      map['rewards_badge'] = Variable<int>(rewardsBadge.value);
    }
    if (photoAsset.present) {
      map['photo_asset'] = Variable<String>(photoAsset.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MembersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('tier: $tier, ')
          ..write('points: $points, ')
          ..write('pointsToNext: $pointsToNext, ')
          ..write('nextTier: $nextTier, ')
          ..write('tierProgress: $tierProgress, ')
          ..write('notificationCount: $notificationCount, ')
          ..write('rewardsBadge: $rewardsBadge, ')
          ..write('photoAsset: $photoAsset')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
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
  static const VerificationMeta _priceMmkMeta = const VerificationMeta(
    'priceMmk',
  );
  @override
  late final GeneratedColumn<int> priceMmk = GeneratedColumn<int>(
    'price_mmk',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isNewMeta = const VerificationMeta('isNew');
  @override
  late final GeneratedColumn<bool> isNew = GeneratedColumn<bool>(
    'is_new',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_new" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _discountPercentMeta = const VerificationMeta(
    'discountPercent',
  );
  @override
  late final GeneratedColumn<int> discountPercent = GeneratedColumn<int>(
    'discount_percent',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageAssetMeta = const VerificationMeta(
    'imageAsset',
  );
  @override
  late final GeneratedColumn<String> imageAsset = GeneratedColumn<String>(
    'image_asset',
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
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
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
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    priceMmk,
    isNew,
    discountPercent,
    imageAsset,
    imageUrl,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price_mmk')) {
      context.handle(
        _priceMmkMeta,
        priceMmk.isAcceptableOrUnknown(data['price_mmk']!, _priceMmkMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMmkMeta);
    }
    if (data.containsKey('is_new')) {
      context.handle(
        _isNewMeta,
        isNew.isAcceptableOrUnknown(data['is_new']!, _isNewMeta),
      );
    }
    if (data.containsKey('discount_percent')) {
      context.handle(
        _discountPercentMeta,
        discountPercent.isAcceptableOrUnknown(
          data['discount_percent']!,
          _discountPercentMeta,
        ),
      );
    }
    if (data.containsKey('image_asset')) {
      context.handle(
        _imageAssetMeta,
        imageAsset.isAcceptableOrUnknown(data['image_asset']!, _imageAssetMeta),
      );
    } else if (isInserting) {
      context.missing(_imageAssetMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
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
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      priceMmk: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price_mmk'],
      )!,
      isNew: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_new'],
      )!,
      discountPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount_percent'],
      ),
      imageAsset: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_asset'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final String id;
  final String code;
  final String name;
  final int priceMmk;
  final bool isNew;
  final int? discountPercent;
  final String imageAsset;
  final String imageUrl;
  final String description;
  const Product({
    required this.id,
    required this.code,
    required this.name,
    required this.priceMmk,
    required this.isNew,
    this.discountPercent,
    required this.imageAsset,
    required this.imageUrl,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['price_mmk'] = Variable<int>(priceMmk);
    map['is_new'] = Variable<bool>(isNew);
    if (!nullToAbsent || discountPercent != null) {
      map['discount_percent'] = Variable<int>(discountPercent);
    }
    map['image_asset'] = Variable<String>(imageAsset);
    map['image_url'] = Variable<String>(imageUrl);
    map['description'] = Variable<String>(description);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      priceMmk: Value(priceMmk),
      isNew: Value(isNew),
      discountPercent: discountPercent == null && nullToAbsent
          ? const Value.absent()
          : Value(discountPercent),
      imageAsset: Value(imageAsset),
      imageUrl: Value(imageUrl),
      description: Value(description),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      priceMmk: serializer.fromJson<int>(json['priceMmk']),
      isNew: serializer.fromJson<bool>(json['isNew']),
      discountPercent: serializer.fromJson<int?>(json['discountPercent']),
      imageAsset: serializer.fromJson<String>(json['imageAsset']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'priceMmk': serializer.toJson<int>(priceMmk),
      'isNew': serializer.toJson<bool>(isNew),
      'discountPercent': serializer.toJson<int?>(discountPercent),
      'imageAsset': serializer.toJson<String>(imageAsset),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'description': serializer.toJson<String>(description),
    };
  }

  Product copyWith({
    String? id,
    String? code,
    String? name,
    int? priceMmk,
    bool? isNew,
    Value<int?> discountPercent = const Value.absent(),
    String? imageAsset,
    String? imageUrl,
    String? description,
  }) => Product(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    priceMmk: priceMmk ?? this.priceMmk,
    isNew: isNew ?? this.isNew,
    discountPercent: discountPercent.present
        ? discountPercent.value
        : this.discountPercent,
    imageAsset: imageAsset ?? this.imageAsset,
    imageUrl: imageUrl ?? this.imageUrl,
    description: description ?? this.description,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      priceMmk: data.priceMmk.present ? data.priceMmk.value : this.priceMmk,
      isNew: data.isNew.present ? data.isNew.value : this.isNew,
      discountPercent: data.discountPercent.present
          ? data.discountPercent.value
          : this.discountPercent,
      imageAsset: data.imageAsset.present
          ? data.imageAsset.value
          : this.imageAsset,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('priceMmk: $priceMmk, ')
          ..write('isNew: $isNew, ')
          ..write('discountPercent: $discountPercent, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    name,
    priceMmk,
    isNew,
    discountPercent,
    imageAsset,
    imageUrl,
    description,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.priceMmk == this.priceMmk &&
          other.isNew == this.isNew &&
          other.discountPercent == this.discountPercent &&
          other.imageAsset == this.imageAsset &&
          other.imageUrl == this.imageUrl &&
          other.description == this.description);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> name;
  final Value<int> priceMmk;
  final Value<bool> isNew;
  final Value<int?> discountPercent;
  final Value<String> imageAsset;
  final Value<String> imageUrl;
  final Value<String> description;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.priceMmk = const Value.absent(),
    this.isNew = const Value.absent(),
    this.discountPercent = const Value.absent(),
    this.imageAsset = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    required String code,
    required String name,
    required int priceMmk,
    this.isNew = const Value.absent(),
    this.discountPercent = const Value.absent(),
    required String imageAsset,
    this.imageUrl = const Value.absent(),
    required String description,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       name = Value(name),
       priceMmk = Value(priceMmk),
       imageAsset = Value(imageAsset),
       description = Value(description);
  static Insertable<Product> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<int>? priceMmk,
    Expression<bool>? isNew,
    Expression<int>? discountPercent,
    Expression<String>? imageAsset,
    Expression<String>? imageUrl,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (priceMmk != null) 'price_mmk': priceMmk,
      if (isNew != null) 'is_new': isNew,
      if (discountPercent != null) 'discount_percent': discountPercent,
      if (imageAsset != null) 'image_asset': imageAsset,
      if (imageUrl != null) 'image_url': imageUrl,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? name,
    Value<int>? priceMmk,
    Value<bool>? isNew,
    Value<int?>? discountPercent,
    Value<String>? imageAsset,
    Value<String>? imageUrl,
    Value<String>? description,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      priceMmk: priceMmk ?? this.priceMmk,
      isNew: isNew ?? this.isNew,
      discountPercent: discountPercent ?? this.discountPercent,
      imageAsset: imageAsset ?? this.imageAsset,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (priceMmk.present) {
      map['price_mmk'] = Variable<int>(priceMmk.value);
    }
    if (isNew.present) {
      map['is_new'] = Variable<bool>(isNew.value);
    }
    if (discountPercent.present) {
      map['discount_percent'] = Variable<int>(discountPercent.value);
    }
    if (imageAsset.present) {
      map['image_asset'] = Variable<String>(imageAsset.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('priceMmk: $priceMmk, ')
          ..write('isNew: $isNew, ')
          ..write('discountPercent: $discountPercent, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BannersTable extends Banners with TableInfo<$BannersTable, Banner> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BannersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _badgeMeta = const VerificationMeta('badge');
  @override
  late final GeneratedColumn<String> badge = GeneratedColumn<String>(
    'badge',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageAssetMeta = const VerificationMeta(
    'imageAsset',
  );
  @override
  late final GeneratedColumn<String> imageAsset = GeneratedColumn<String>(
    'image_asset',
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
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    badge,
    imageAsset,
    imageUrl,
    position,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'banners';
  @override
  VerificationContext validateIntegrity(
    Insertable<Banner> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('badge')) {
      context.handle(
        _badgeMeta,
        badge.isAcceptableOrUnknown(data['badge']!, _badgeMeta),
      );
    } else if (isInserting) {
      context.missing(_badgeMeta);
    }
    if (data.containsKey('image_asset')) {
      context.handle(
        _imageAssetMeta,
        imageAsset.isAcceptableOrUnknown(data['image_asset']!, _imageAssetMeta),
      );
    } else if (isInserting) {
      context.missing(_imageAssetMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Banner map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Banner(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      badge: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}badge'],
      )!,
      imageAsset: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_asset'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
    );
  }

  @override
  $BannersTable createAlias(String alias) {
    return $BannersTable(attachedDatabase, alias);
  }
}

class Banner extends DataClass implements Insertable<Banner> {
  final String id;
  final String title;
  final String badge;
  final String imageAsset;
  final String imageUrl;
  final int position;
  const Banner({
    required this.id,
    required this.title,
    required this.badge,
    required this.imageAsset,
    required this.imageUrl,
    required this.position,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['badge'] = Variable<String>(badge);
    map['image_asset'] = Variable<String>(imageAsset);
    map['image_url'] = Variable<String>(imageUrl);
    map['position'] = Variable<int>(position);
    return map;
  }

  BannersCompanion toCompanion(bool nullToAbsent) {
    return BannersCompanion(
      id: Value(id),
      title: Value(title),
      badge: Value(badge),
      imageAsset: Value(imageAsset),
      imageUrl: Value(imageUrl),
      position: Value(position),
    );
  }

  factory Banner.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Banner(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      badge: serializer.fromJson<String>(json['badge']),
      imageAsset: serializer.fromJson<String>(json['imageAsset']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      position: serializer.fromJson<int>(json['position']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'badge': serializer.toJson<String>(badge),
      'imageAsset': serializer.toJson<String>(imageAsset),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'position': serializer.toJson<int>(position),
    };
  }

  Banner copyWith({
    String? id,
    String? title,
    String? badge,
    String? imageAsset,
    String? imageUrl,
    int? position,
  }) => Banner(
    id: id ?? this.id,
    title: title ?? this.title,
    badge: badge ?? this.badge,
    imageAsset: imageAsset ?? this.imageAsset,
    imageUrl: imageUrl ?? this.imageUrl,
    position: position ?? this.position,
  );
  Banner copyWithCompanion(BannersCompanion data) {
    return Banner(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      badge: data.badge.present ? data.badge.value : this.badge,
      imageAsset: data.imageAsset.present
          ? data.imageAsset.value
          : this.imageAsset,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      position: data.position.present ? data.position.value : this.position,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Banner(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('badge: $badge, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, badge, imageAsset, imageUrl, position);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Banner &&
          other.id == this.id &&
          other.title == this.title &&
          other.badge == this.badge &&
          other.imageAsset == this.imageAsset &&
          other.imageUrl == this.imageUrl &&
          other.position == this.position);
}

class BannersCompanion extends UpdateCompanion<Banner> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> badge;
  final Value<String> imageAsset;
  final Value<String> imageUrl;
  final Value<int> position;
  final Value<int> rowid;
  const BannersCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.badge = const Value.absent(),
    this.imageAsset = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.position = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BannersCompanion.insert({
    required String id,
    required String title,
    required String badge,
    required String imageAsset,
    this.imageUrl = const Value.absent(),
    required int position,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       badge = Value(badge),
       imageAsset = Value(imageAsset),
       position = Value(position);
  static Insertable<Banner> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? badge,
    Expression<String>? imageAsset,
    Expression<String>? imageUrl,
    Expression<int>? position,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (badge != null) 'badge': badge,
      if (imageAsset != null) 'image_asset': imageAsset,
      if (imageUrl != null) 'image_url': imageUrl,
      if (position != null) 'position': position,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BannersCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? badge,
    Value<String>? imageAsset,
    Value<String>? imageUrl,
    Value<int>? position,
    Value<int>? rowid,
  }) {
    return BannersCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      badge: badge ?? this.badge,
      imageAsset: imageAsset ?? this.imageAsset,
      imageUrl: imageUrl ?? this.imageUrl,
      position: position ?? this.position,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (badge.present) {
      map['badge'] = Variable<String>(badge.value);
    }
    if (imageAsset.present) {
      map['image_asset'] = Variable<String>(imageAsset.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BannersCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('badge: $badge, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('position: $position, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SectionsTable extends Sections with TableInfo<$SectionsTable, Section> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, position];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sections';
  @override
  VerificationContext validateIntegrity(
    Insertable<Section> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Section map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Section(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
    );
  }

  @override
  $SectionsTable createAlias(String alias) {
    return $SectionsTable(attachedDatabase, alias);
  }
}

class Section extends DataClass implements Insertable<Section> {
  final String id;
  final String title;
  final int position;
  const Section({
    required this.id,
    required this.title,
    required this.position,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['position'] = Variable<int>(position);
    return map;
  }

  SectionsCompanion toCompanion(bool nullToAbsent) {
    return SectionsCompanion(
      id: Value(id),
      title: Value(title),
      position: Value(position),
    );
  }

  factory Section.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Section(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      position: serializer.fromJson<int>(json['position']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'position': serializer.toJson<int>(position),
    };
  }

  Section copyWith({String? id, String? title, int? position}) => Section(
    id: id ?? this.id,
    title: title ?? this.title,
    position: position ?? this.position,
  );
  Section copyWithCompanion(SectionsCompanion data) {
    return Section(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      position: data.position.present ? data.position.value : this.position,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Section(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, position);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Section &&
          other.id == this.id &&
          other.title == this.title &&
          other.position == this.position);
}

class SectionsCompanion extends UpdateCompanion<Section> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> position;
  final Value<int> rowid;
  const SectionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.position = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SectionsCompanion.insert({
    required String id,
    required String title,
    required int position,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       position = Value(position);
  static Insertable<Section> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? position,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (position != null) 'position': position,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SectionsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<int>? position,
    Value<int>? rowid,
  }) {
    return SectionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      position: position ?? this.position,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SectionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('position: $position, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SectionProductsTable extends SectionProducts
    with TableInfo<$SectionProductsTable, SectionProduct> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SectionProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sectionIdMeta = const VerificationMeta(
    'sectionId',
  );
  @override
  late final GeneratedColumn<String> sectionId = GeneratedColumn<String>(
    'section_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [sectionId, productId, position];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'section_products';
  @override
  VerificationContext validateIntegrity(
    Insertable<SectionProduct> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('section_id')) {
      context.handle(
        _sectionIdMeta,
        sectionId.isAcceptableOrUnknown(data['section_id']!, _sectionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sectionIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sectionId, productId};
  @override
  SectionProduct map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SectionProduct(
      sectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}section_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
    );
  }

  @override
  $SectionProductsTable createAlias(String alias) {
    return $SectionProductsTable(attachedDatabase, alias);
  }
}

class SectionProduct extends DataClass implements Insertable<SectionProduct> {
  final String sectionId;
  final String productId;
  final int position;
  const SectionProduct({
    required this.sectionId,
    required this.productId,
    required this.position,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['section_id'] = Variable<String>(sectionId);
    map['product_id'] = Variable<String>(productId);
    map['position'] = Variable<int>(position);
    return map;
  }

  SectionProductsCompanion toCompanion(bool nullToAbsent) {
    return SectionProductsCompanion(
      sectionId: Value(sectionId),
      productId: Value(productId),
      position: Value(position),
    );
  }

  factory SectionProduct.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SectionProduct(
      sectionId: serializer.fromJson<String>(json['sectionId']),
      productId: serializer.fromJson<String>(json['productId']),
      position: serializer.fromJson<int>(json['position']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sectionId': serializer.toJson<String>(sectionId),
      'productId': serializer.toJson<String>(productId),
      'position': serializer.toJson<int>(position),
    };
  }

  SectionProduct copyWith({
    String? sectionId,
    String? productId,
    int? position,
  }) => SectionProduct(
    sectionId: sectionId ?? this.sectionId,
    productId: productId ?? this.productId,
    position: position ?? this.position,
  );
  SectionProduct copyWithCompanion(SectionProductsCompanion data) {
    return SectionProduct(
      sectionId: data.sectionId.present ? data.sectionId.value : this.sectionId,
      productId: data.productId.present ? data.productId.value : this.productId,
      position: data.position.present ? data.position.value : this.position,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SectionProduct(')
          ..write('sectionId: $sectionId, ')
          ..write('productId: $productId, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(sectionId, productId, position);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SectionProduct &&
          other.sectionId == this.sectionId &&
          other.productId == this.productId &&
          other.position == this.position);
}

class SectionProductsCompanion extends UpdateCompanion<SectionProduct> {
  final Value<String> sectionId;
  final Value<String> productId;
  final Value<int> position;
  final Value<int> rowid;
  const SectionProductsCompanion({
    this.sectionId = const Value.absent(),
    this.productId = const Value.absent(),
    this.position = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SectionProductsCompanion.insert({
    required String sectionId,
    required String productId,
    required int position,
    this.rowid = const Value.absent(),
  }) : sectionId = Value(sectionId),
       productId = Value(productId),
       position = Value(position);
  static Insertable<SectionProduct> custom({
    Expression<String>? sectionId,
    Expression<String>? productId,
    Expression<int>? position,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sectionId != null) 'section_id': sectionId,
      if (productId != null) 'product_id': productId,
      if (position != null) 'position': position,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SectionProductsCompanion copyWith({
    Value<String>? sectionId,
    Value<String>? productId,
    Value<int>? position,
    Value<int>? rowid,
  }) {
    return SectionProductsCompanion(
      sectionId: sectionId ?? this.sectionId,
      productId: productId ?? this.productId,
      position: position ?? this.position,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sectionId.present) {
      map['section_id'] = Variable<String>(sectionId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SectionProductsCompanion(')
          ..write('sectionId: $sectionId, ')
          ..write('productId: $productId, ')
          ..write('position: $position, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShopsTable extends Shops with TableInfo<$ShopsTable, Shop> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
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
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _distanceLabelMeta = const VerificationMeta(
    'distanceLabel',
  );
  @override
  late final GeneratedColumn<String> distanceLabel = GeneratedColumn<String>(
    'distance_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageAssetMeta = const VerificationMeta(
    'imageAsset',
  );
  @override
  late final GeneratedColumn<String> imageAsset = GeneratedColumn<String>(
    'image_asset',
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
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    address,
    distanceLabel,
    imageAsset,
    imageUrl,
    position,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shops';
  @override
  VerificationContext validateIntegrity(
    Insertable<Shop> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('distance_label')) {
      context.handle(
        _distanceLabelMeta,
        distanceLabel.isAcceptableOrUnknown(
          data['distance_label']!,
          _distanceLabelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_distanceLabelMeta);
    }
    if (data.containsKey('image_asset')) {
      context.handle(
        _imageAssetMeta,
        imageAsset.isAcceptableOrUnknown(data['image_asset']!, _imageAssetMeta),
      );
    } else if (isInserting) {
      context.missing(_imageAssetMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Shop map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Shop(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      distanceLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}distance_label'],
      )!,
      imageAsset: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_asset'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
    );
  }

  @override
  $ShopsTable createAlias(String alias) {
    return $ShopsTable(attachedDatabase, alias);
  }
}

class Shop extends DataClass implements Insertable<Shop> {
  final String id;
  final String name;
  final String address;
  final String distanceLabel;
  final String imageAsset;
  final String imageUrl;
  final int position;
  const Shop({
    required this.id,
    required this.name,
    required this.address,
    required this.distanceLabel,
    required this.imageAsset,
    required this.imageUrl,
    required this.position,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['distance_label'] = Variable<String>(distanceLabel);
    map['image_asset'] = Variable<String>(imageAsset);
    map['image_url'] = Variable<String>(imageUrl);
    map['position'] = Variable<int>(position);
    return map;
  }

  ShopsCompanion toCompanion(bool nullToAbsent) {
    return ShopsCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
      distanceLabel: Value(distanceLabel),
      imageAsset: Value(imageAsset),
      imageUrl: Value(imageUrl),
      position: Value(position),
    );
  }

  factory Shop.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Shop(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      distanceLabel: serializer.fromJson<String>(json['distanceLabel']),
      imageAsset: serializer.fromJson<String>(json['imageAsset']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      position: serializer.fromJson<int>(json['position']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'distanceLabel': serializer.toJson<String>(distanceLabel),
      'imageAsset': serializer.toJson<String>(imageAsset),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'position': serializer.toJson<int>(position),
    };
  }

  Shop copyWith({
    String? id,
    String? name,
    String? address,
    String? distanceLabel,
    String? imageAsset,
    String? imageUrl,
    int? position,
  }) => Shop(
    id: id ?? this.id,
    name: name ?? this.name,
    address: address ?? this.address,
    distanceLabel: distanceLabel ?? this.distanceLabel,
    imageAsset: imageAsset ?? this.imageAsset,
    imageUrl: imageUrl ?? this.imageUrl,
    position: position ?? this.position,
  );
  Shop copyWithCompanion(ShopsCompanion data) {
    return Shop(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      distanceLabel: data.distanceLabel.present
          ? data.distanceLabel.value
          : this.distanceLabel,
      imageAsset: data.imageAsset.present
          ? data.imageAsset.value
          : this.imageAsset,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      position: data.position.present ? data.position.value : this.position,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Shop(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('distanceLabel: $distanceLabel, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    address,
    distanceLabel,
    imageAsset,
    imageUrl,
    position,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shop &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.distanceLabel == this.distanceLabel &&
          other.imageAsset == this.imageAsset &&
          other.imageUrl == this.imageUrl &&
          other.position == this.position);
}

class ShopsCompanion extends UpdateCompanion<Shop> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> address;
  final Value<String> distanceLabel;
  final Value<String> imageAsset;
  final Value<String> imageUrl;
  final Value<int> position;
  final Value<int> rowid;
  const ShopsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.distanceLabel = const Value.absent(),
    this.imageAsset = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.position = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShopsCompanion.insert({
    required String id,
    required String name,
    required String address,
    required String distanceLabel,
    required String imageAsset,
    this.imageUrl = const Value.absent(),
    required int position,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       address = Value(address),
       distanceLabel = Value(distanceLabel),
       imageAsset = Value(imageAsset),
       position = Value(position);
  static Insertable<Shop> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? distanceLabel,
    Expression<String>? imageAsset,
    Expression<String>? imageUrl,
    Expression<int>? position,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (distanceLabel != null) 'distance_label': distanceLabel,
      if (imageAsset != null) 'image_asset': imageAsset,
      if (imageUrl != null) 'image_url': imageUrl,
      if (position != null) 'position': position,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShopsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? address,
    Value<String>? distanceLabel,
    Value<String>? imageAsset,
    Value<String>? imageUrl,
    Value<int>? position,
    Value<int>? rowid,
  }) {
    return ShopsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      distanceLabel: distanceLabel ?? this.distanceLabel,
      imageAsset: imageAsset ?? this.imageAsset,
      imageUrl: imageUrl ?? this.imageUrl,
      position: position ?? this.position,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (distanceLabel.present) {
      map['distance_label'] = Variable<String>(distanceLabel.value);
    }
    if (imageAsset.present) {
      map['image_asset'] = Variable<String>(imageAsset.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('distanceLabel: $distanceLabel, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('position: $position, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChallengesTable extends Challenges
    with TableInfo<$ChallengesTable, Challenge> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChallengesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _goalMeta = const VerificationMeta('goal');
  @override
  late final GeneratedColumn<int> goal = GeneratedColumn<int>(
    'goal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardPointsMeta = const VerificationMeta(
    'rewardPoints',
  );
  @override
  late final GeneratedColumn<int> rewardPoints = GeneratedColumn<int>(
    'reward_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _artMeta = const VerificationMeta('art');
  @override
  late final GeneratedColumn<String> art = GeneratedColumn<String>(
    'art',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tabKindMeta = const VerificationMeta(
    'tabKind',
  );
  @override
  late final GeneratedColumn<String> tabKind = GeneratedColumn<String>(
    'tab_kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _claimedMeta = const VerificationMeta(
    'claimed',
  );
  @override
  late final GeneratedColumn<bool> claimed = GeneratedColumn<bool>(
    'claimed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("claimed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    progress,
    goal,
    rewardPoints,
    art,
    tabKind,
    position,
    claimed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'challenges';
  @override
  VerificationContext validateIntegrity(
    Insertable<Challenge> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    } else if (isInserting) {
      context.missing(_progressMeta);
    }
    if (data.containsKey('goal')) {
      context.handle(
        _goalMeta,
        goal.isAcceptableOrUnknown(data['goal']!, _goalMeta),
      );
    } else if (isInserting) {
      context.missing(_goalMeta);
    }
    if (data.containsKey('reward_points')) {
      context.handle(
        _rewardPointsMeta,
        rewardPoints.isAcceptableOrUnknown(
          data['reward_points']!,
          _rewardPointsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rewardPointsMeta);
    }
    if (data.containsKey('art')) {
      context.handle(
        _artMeta,
        art.isAcceptableOrUnknown(data['art']!, _artMeta),
      );
    } else if (isInserting) {
      context.missing(_artMeta);
    }
    if (data.containsKey('tab_kind')) {
      context.handle(
        _tabKindMeta,
        tabKind.isAcceptableOrUnknown(data['tab_kind']!, _tabKindMeta),
      );
    } else if (isInserting) {
      context.missing(_tabKindMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('claimed')) {
      context.handle(
        _claimedMeta,
        claimed.isAcceptableOrUnknown(data['claimed']!, _claimedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Challenge map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Challenge(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}progress'],
      )!,
      goal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}goal'],
      )!,
      rewardPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reward_points'],
      )!,
      art: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}art'],
      )!,
      tabKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tab_kind'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      claimed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}claimed'],
      )!,
    );
  }

  @override
  $ChallengesTable createAlias(String alias) {
    return $ChallengesTable(attachedDatabase, alias);
  }
}

class Challenge extends DataClass implements Insertable<Challenge> {
  final String id;
  final String title;
  final int progress;
  final int goal;
  final int rewardPoints;
  final String art;
  final String tabKind;
  final int position;
  final bool claimed;
  const Challenge({
    required this.id,
    required this.title,
    required this.progress,
    required this.goal,
    required this.rewardPoints,
    required this.art,
    required this.tabKind,
    required this.position,
    required this.claimed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['progress'] = Variable<int>(progress);
    map['goal'] = Variable<int>(goal);
    map['reward_points'] = Variable<int>(rewardPoints);
    map['art'] = Variable<String>(art);
    map['tab_kind'] = Variable<String>(tabKind);
    map['position'] = Variable<int>(position);
    map['claimed'] = Variable<bool>(claimed);
    return map;
  }

  ChallengesCompanion toCompanion(bool nullToAbsent) {
    return ChallengesCompanion(
      id: Value(id),
      title: Value(title),
      progress: Value(progress),
      goal: Value(goal),
      rewardPoints: Value(rewardPoints),
      art: Value(art),
      tabKind: Value(tabKind),
      position: Value(position),
      claimed: Value(claimed),
    );
  }

  factory Challenge.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Challenge(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      progress: serializer.fromJson<int>(json['progress']),
      goal: serializer.fromJson<int>(json['goal']),
      rewardPoints: serializer.fromJson<int>(json['rewardPoints']),
      art: serializer.fromJson<String>(json['art']),
      tabKind: serializer.fromJson<String>(json['tabKind']),
      position: serializer.fromJson<int>(json['position']),
      claimed: serializer.fromJson<bool>(json['claimed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'progress': serializer.toJson<int>(progress),
      'goal': serializer.toJson<int>(goal),
      'rewardPoints': serializer.toJson<int>(rewardPoints),
      'art': serializer.toJson<String>(art),
      'tabKind': serializer.toJson<String>(tabKind),
      'position': serializer.toJson<int>(position),
      'claimed': serializer.toJson<bool>(claimed),
    };
  }

  Challenge copyWith({
    String? id,
    String? title,
    int? progress,
    int? goal,
    int? rewardPoints,
    String? art,
    String? tabKind,
    int? position,
    bool? claimed,
  }) => Challenge(
    id: id ?? this.id,
    title: title ?? this.title,
    progress: progress ?? this.progress,
    goal: goal ?? this.goal,
    rewardPoints: rewardPoints ?? this.rewardPoints,
    art: art ?? this.art,
    tabKind: tabKind ?? this.tabKind,
    position: position ?? this.position,
    claimed: claimed ?? this.claimed,
  );
  Challenge copyWithCompanion(ChallengesCompanion data) {
    return Challenge(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      progress: data.progress.present ? data.progress.value : this.progress,
      goal: data.goal.present ? data.goal.value : this.goal,
      rewardPoints: data.rewardPoints.present
          ? data.rewardPoints.value
          : this.rewardPoints,
      art: data.art.present ? data.art.value : this.art,
      tabKind: data.tabKind.present ? data.tabKind.value : this.tabKind,
      position: data.position.present ? data.position.value : this.position,
      claimed: data.claimed.present ? data.claimed.value : this.claimed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Challenge(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('progress: $progress, ')
          ..write('goal: $goal, ')
          ..write('rewardPoints: $rewardPoints, ')
          ..write('art: $art, ')
          ..write('tabKind: $tabKind, ')
          ..write('position: $position, ')
          ..write('claimed: $claimed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    progress,
    goal,
    rewardPoints,
    art,
    tabKind,
    position,
    claimed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Challenge &&
          other.id == this.id &&
          other.title == this.title &&
          other.progress == this.progress &&
          other.goal == this.goal &&
          other.rewardPoints == this.rewardPoints &&
          other.art == this.art &&
          other.tabKind == this.tabKind &&
          other.position == this.position &&
          other.claimed == this.claimed);
}

class ChallengesCompanion extends UpdateCompanion<Challenge> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> progress;
  final Value<int> goal;
  final Value<int> rewardPoints;
  final Value<String> art;
  final Value<String> tabKind;
  final Value<int> position;
  final Value<bool> claimed;
  final Value<int> rowid;
  const ChallengesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.progress = const Value.absent(),
    this.goal = const Value.absent(),
    this.rewardPoints = const Value.absent(),
    this.art = const Value.absent(),
    this.tabKind = const Value.absent(),
    this.position = const Value.absent(),
    this.claimed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChallengesCompanion.insert({
    required String id,
    required String title,
    required int progress,
    required int goal,
    required int rewardPoints,
    required String art,
    required String tabKind,
    required int position,
    this.claimed = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       progress = Value(progress),
       goal = Value(goal),
       rewardPoints = Value(rewardPoints),
       art = Value(art),
       tabKind = Value(tabKind),
       position = Value(position);
  static Insertable<Challenge> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? progress,
    Expression<int>? goal,
    Expression<int>? rewardPoints,
    Expression<String>? art,
    Expression<String>? tabKind,
    Expression<int>? position,
    Expression<bool>? claimed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (progress != null) 'progress': progress,
      if (goal != null) 'goal': goal,
      if (rewardPoints != null) 'reward_points': rewardPoints,
      if (art != null) 'art': art,
      if (tabKind != null) 'tab_kind': tabKind,
      if (position != null) 'position': position,
      if (claimed != null) 'claimed': claimed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChallengesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<int>? progress,
    Value<int>? goal,
    Value<int>? rewardPoints,
    Value<String>? art,
    Value<String>? tabKind,
    Value<int>? position,
    Value<bool>? claimed,
    Value<int>? rowid,
  }) {
    return ChallengesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      progress: progress ?? this.progress,
      goal: goal ?? this.goal,
      rewardPoints: rewardPoints ?? this.rewardPoints,
      art: art ?? this.art,
      tabKind: tabKind ?? this.tabKind,
      position: position ?? this.position,
      claimed: claimed ?? this.claimed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    if (goal.present) {
      map['goal'] = Variable<int>(goal.value);
    }
    if (rewardPoints.present) {
      map['reward_points'] = Variable<int>(rewardPoints.value);
    }
    if (art.present) {
      map['art'] = Variable<String>(art.value);
    }
    if (tabKind.present) {
      map['tab_kind'] = Variable<String>(tabKind.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (claimed.present) {
      map['claimed'] = Variable<bool>(claimed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChallengesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('progress: $progress, ')
          ..write('goal: $goal, ')
          ..write('rewardPoints: $rewardPoints, ')
          ..write('art: $art, ')
          ..write('tabKind: $tabKind, ')
          ..write('position: $position, ')
          ..write('claimed: $claimed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CartLinesTable extends CartLines
    with TableInfo<$CartLinesTable, CartLine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartLinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [productId, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_lines';
  @override
  VerificationContext validateIntegrity(
    Insertable<CartLine> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  CartLine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartLine(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
    );
  }

  @override
  $CartLinesTable createAlias(String alias) {
    return $CartLinesTable(attachedDatabase, alias);
  }
}

class CartLine extends DataClass implements Insertable<CartLine> {
  final String productId;
  final int quantity;
  const CartLine({required this.productId, required this.quantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<String>(productId);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  CartLinesCompanion toCompanion(bool nullToAbsent) {
    return CartLinesCompanion(
      productId: Value(productId),
      quantity: Value(quantity),
    );
  }

  factory CartLine.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartLine(
      productId: serializer.fromJson<String>(json['productId']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  CartLine copyWith({String? productId, int? quantity}) => CartLine(
    productId: productId ?? this.productId,
    quantity: quantity ?? this.quantity,
  );
  CartLine copyWithCompanion(CartLinesCompanion data) {
    return CartLine(
      productId: data.productId.present ? data.productId.value : this.productId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartLine(')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartLine &&
          other.productId == this.productId &&
          other.quantity == this.quantity);
}

class CartLinesCompanion extends UpdateCompanion<CartLine> {
  final Value<String> productId;
  final Value<int> quantity;
  final Value<int> rowid;
  const CartLinesCompanion({
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CartLinesCompanion.insert({
    required String productId,
    required int quantity,
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       quantity = Value(quantity);
  static Insertable<CartLine> custom({
    Expression<String>? productId,
    Expression<int>? quantity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CartLinesCompanion copyWith({
    Value<String>? productId,
    Value<int>? quantity,
    Value<int>? rowid,
  }) {
    return CartLinesCompanion(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartLinesCompanion(')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $MembersTable members = $MembersTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $BannersTable banners = $BannersTable(this);
  late final $SectionsTable sections = $SectionsTable(this);
  late final $SectionProductsTable sectionProducts = $SectionProductsTable(
    this,
  );
  late final $ShopsTable shops = $ShopsTable(this);
  late final $ChallengesTable challenges = $ChallengesTable(this);
  late final $CartLinesTable cartLines = $CartLinesTable(this);
  late final Index sectionProductsOrder = Index(
    'section_products_order',
    'CREATE INDEX section_products_order ON section_products (section_id, position)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    accounts,
    members,
    products,
    banners,
    sections,
    sectionProducts,
    shops,
    challenges,
    cartLines,
    sectionProductsOrder,
  ];
}

typedef $$AccountsTableCreateCompanionBuilder =
    AccountsCompanion Function({
      required String id,
      required String phoneE164,
      required String firstName,
      Value<String> lastName,
      required String birthIso,
      Value<int> rowid,
    });
typedef $$AccountsTableUpdateCompanionBuilder =
    AccountsCompanion Function({
      Value<String> id,
      Value<String> phoneE164,
      Value<String> firstName,
      Value<String> lastName,
      Value<String> birthIso,
      Value<int> rowid,
    });

class $$AccountsTableFilterComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneE164 => $composableBuilder(
    column: $table.phoneE164,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get birthIso => $composableBuilder(
    column: $table.birthIso,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneE164 => $composableBuilder(
    column: $table.phoneE164,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get birthIso => $composableBuilder(
    column: $table.birthIso,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get phoneE164 =>
      $composableBuilder(column: $table.phoneE164, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get birthIso =>
      $composableBuilder(column: $table.birthIso, builder: (column) => column);
}

class $$AccountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountsTable,
          Account,
          $$AccountsTableFilterComposer,
          $$AccountsTableOrderingComposer,
          $$AccountsTableAnnotationComposer,
          $$AccountsTableCreateCompanionBuilder,
          $$AccountsTableUpdateCompanionBuilder,
          (Account, BaseReferences<_$AppDatabase, $AccountsTable, Account>),
          Account,
          PrefetchHooks Function()
        > {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> phoneE164 = const Value.absent(),
                Value<String> firstName = const Value.absent(),
                Value<String> lastName = const Value.absent(),
                Value<String> birthIso = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AccountsCompanion(
                id: id,
                phoneE164: phoneE164,
                firstName: firstName,
                lastName: lastName,
                birthIso: birthIso,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String phoneE164,
                required String firstName,
                Value<String> lastName = const Value.absent(),
                required String birthIso,
                Value<int> rowid = const Value.absent(),
              }) => AccountsCompanion.insert(
                id: id,
                phoneE164: phoneE164,
                firstName: firstName,
                lastName: lastName,
                birthIso: birthIso,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AccountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountsTable,
      Account,
      $$AccountsTableFilterComposer,
      $$AccountsTableOrderingComposer,
      $$AccountsTableAnnotationComposer,
      $$AccountsTableCreateCompanionBuilder,
      $$AccountsTableUpdateCompanionBuilder,
      (Account, BaseReferences<_$AppDatabase, $AccountsTable, Account>),
      Account,
      PrefetchHooks Function()
    >;
typedef $$MembersTableCreateCompanionBuilder =
    MembersCompanion Function({
      Value<int> id,
      required String name,
      required String tier,
      required int points,
      required int pointsToNext,
      required String nextTier,
      required double tierProgress,
      required int notificationCount,
      required int rewardsBadge,
      required String photoAsset,
    });
typedef $$MembersTableUpdateCompanionBuilder =
    MembersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> tier,
      Value<int> points,
      Value<int> pointsToNext,
      Value<String> nextTier,
      Value<double> tierProgress,
      Value<int> notificationCount,
      Value<int> rewardsBadge,
      Value<String> photoAsset,
    });

class $$MembersTableFilterComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableFilterComposer({
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

  ColumnFilters<String> get tier => $composableBuilder(
    column: $table.tier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pointsToNext => $composableBuilder(
    column: $table.pointsToNext,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextTier => $composableBuilder(
    column: $table.nextTier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get tierProgress => $composableBuilder(
    column: $table.tierProgress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get notificationCount => $composableBuilder(
    column: $table.notificationCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewardsBadge => $composableBuilder(
    column: $table.rewardsBadge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoAsset => $composableBuilder(
    column: $table.photoAsset,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MembersTableOrderingComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableOrderingComposer({
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

  ColumnOrderings<String> get tier => $composableBuilder(
    column: $table.tier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pointsToNext => $composableBuilder(
    column: $table.pointsToNext,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextTier => $composableBuilder(
    column: $table.nextTier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get tierProgress => $composableBuilder(
    column: $table.tierProgress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get notificationCount => $composableBuilder(
    column: $table.notificationCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewardsBadge => $composableBuilder(
    column: $table.rewardsBadge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoAsset => $composableBuilder(
    column: $table.photoAsset,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MembersTableAnnotationComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableAnnotationComposer({
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

  GeneratedColumn<String> get tier =>
      $composableBuilder(column: $table.tier, builder: (column) => column);

  GeneratedColumn<int> get points =>
      $composableBuilder(column: $table.points, builder: (column) => column);

  GeneratedColumn<int> get pointsToNext => $composableBuilder(
    column: $table.pointsToNext,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nextTier =>
      $composableBuilder(column: $table.nextTier, builder: (column) => column);

  GeneratedColumn<double> get tierProgress => $composableBuilder(
    column: $table.tierProgress,
    builder: (column) => column,
  );

  GeneratedColumn<int> get notificationCount => $composableBuilder(
    column: $table.notificationCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rewardsBadge => $composableBuilder(
    column: $table.rewardsBadge,
    builder: (column) => column,
  );

  GeneratedColumn<String> get photoAsset => $composableBuilder(
    column: $table.photoAsset,
    builder: (column) => column,
  );
}

class $$MembersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MembersTable,
          Member,
          $$MembersTableFilterComposer,
          $$MembersTableOrderingComposer,
          $$MembersTableAnnotationComposer,
          $$MembersTableCreateCompanionBuilder,
          $$MembersTableUpdateCompanionBuilder,
          (Member, BaseReferences<_$AppDatabase, $MembersTable, Member>),
          Member,
          PrefetchHooks Function()
        > {
  $$MembersTableTableManager(_$AppDatabase db, $MembersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MembersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> tier = const Value.absent(),
                Value<int> points = const Value.absent(),
                Value<int> pointsToNext = const Value.absent(),
                Value<String> nextTier = const Value.absent(),
                Value<double> tierProgress = const Value.absent(),
                Value<int> notificationCount = const Value.absent(),
                Value<int> rewardsBadge = const Value.absent(),
                Value<String> photoAsset = const Value.absent(),
              }) => MembersCompanion(
                id: id,
                name: name,
                tier: tier,
                points: points,
                pointsToNext: pointsToNext,
                nextTier: nextTier,
                tierProgress: tierProgress,
                notificationCount: notificationCount,
                rewardsBadge: rewardsBadge,
                photoAsset: photoAsset,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String tier,
                required int points,
                required int pointsToNext,
                required String nextTier,
                required double tierProgress,
                required int notificationCount,
                required int rewardsBadge,
                required String photoAsset,
              }) => MembersCompanion.insert(
                id: id,
                name: name,
                tier: tier,
                points: points,
                pointsToNext: pointsToNext,
                nextTier: nextTier,
                tierProgress: tierProgress,
                notificationCount: notificationCount,
                rewardsBadge: rewardsBadge,
                photoAsset: photoAsset,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MembersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MembersTable,
      Member,
      $$MembersTableFilterComposer,
      $$MembersTableOrderingComposer,
      $$MembersTableAnnotationComposer,
      $$MembersTableCreateCompanionBuilder,
      $$MembersTableUpdateCompanionBuilder,
      (Member, BaseReferences<_$AppDatabase, $MembersTable, Member>),
      Member,
      PrefetchHooks Function()
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      required String id,
      required String code,
      required String name,
      required int priceMmk,
      Value<bool> isNew,
      Value<int?> discountPercent,
      required String imageAsset,
      Value<String> imageUrl,
      required String description,
      Value<int> rowid,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> name,
      Value<int> priceMmk,
      Value<bool> isNew,
      Value<int?> discountPercent,
      Value<String> imageAsset,
      Value<String> imageUrl,
      Value<String> description,
      Value<int> rowid,
    });

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priceMmk => $composableBuilder(
    column: $table.priceMmk,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isNew => $composableBuilder(
    column: $table.isNew,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discountPercent => $composableBuilder(
    column: $table.discountPercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priceMmk => $composableBuilder(
    column: $table.priceMmk,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isNew => $composableBuilder(
    column: $table.isNew,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discountPercent => $composableBuilder(
    column: $table.discountPercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get priceMmk =>
      $composableBuilder(column: $table.priceMmk, builder: (column) => column);

  GeneratedColumn<bool> get isNew =>
      $composableBuilder(column: $table.isNew, builder: (column) => column);

  GeneratedColumn<int> get discountPercent => $composableBuilder(
    column: $table.discountPercent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
          Product,
          PrefetchHooks Function()
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> priceMmk = const Value.absent(),
                Value<bool> isNew = const Value.absent(),
                Value<int?> discountPercent = const Value.absent(),
                Value<String> imageAsset = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                code: code,
                name: name,
                priceMmk: priceMmk,
                isNew: isNew,
                discountPercent: discountPercent,
                imageAsset: imageAsset,
                imageUrl: imageUrl,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String name,
                required int priceMmk,
                Value<bool> isNew = const Value.absent(),
                Value<int?> discountPercent = const Value.absent(),
                required String imageAsset,
                Value<String> imageUrl = const Value.absent(),
                required String description,
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                code: code,
                name: name,
                priceMmk: priceMmk,
                isNew: isNew,
                discountPercent: discountPercent,
                imageAsset: imageAsset,
                imageUrl: imageUrl,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
      Product,
      PrefetchHooks Function()
    >;
typedef $$BannersTableCreateCompanionBuilder =
    BannersCompanion Function({
      required String id,
      required String title,
      required String badge,
      required String imageAsset,
      Value<String> imageUrl,
      required int position,
      Value<int> rowid,
    });
typedef $$BannersTableUpdateCompanionBuilder =
    BannersCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> badge,
      Value<String> imageAsset,
      Value<String> imageUrl,
      Value<int> position,
      Value<int> rowid,
    });

class $$BannersTableFilterComposer
    extends Composer<_$AppDatabase, $BannersTable> {
  $$BannersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get badge => $composableBuilder(
    column: $table.badge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BannersTableOrderingComposer
    extends Composer<_$AppDatabase, $BannersTable> {
  $$BannersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get badge => $composableBuilder(
    column: $table.badge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BannersTableAnnotationComposer
    extends Composer<_$AppDatabase, $BannersTable> {
  $$BannersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get badge =>
      $composableBuilder(column: $table.badge, builder: (column) => column);

  GeneratedColumn<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);
}

class $$BannersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BannersTable,
          Banner,
          $$BannersTableFilterComposer,
          $$BannersTableOrderingComposer,
          $$BannersTableAnnotationComposer,
          $$BannersTableCreateCompanionBuilder,
          $$BannersTableUpdateCompanionBuilder,
          (Banner, BaseReferences<_$AppDatabase, $BannersTable, Banner>),
          Banner,
          PrefetchHooks Function()
        > {
  $$BannersTableTableManager(_$AppDatabase db, $BannersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BannersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BannersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BannersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> badge = const Value.absent(),
                Value<String> imageAsset = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BannersCompanion(
                id: id,
                title: title,
                badge: badge,
                imageAsset: imageAsset,
                imageUrl: imageUrl,
                position: position,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String badge,
                required String imageAsset,
                Value<String> imageUrl = const Value.absent(),
                required int position,
                Value<int> rowid = const Value.absent(),
              }) => BannersCompanion.insert(
                id: id,
                title: title,
                badge: badge,
                imageAsset: imageAsset,
                imageUrl: imageUrl,
                position: position,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BannersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BannersTable,
      Banner,
      $$BannersTableFilterComposer,
      $$BannersTableOrderingComposer,
      $$BannersTableAnnotationComposer,
      $$BannersTableCreateCompanionBuilder,
      $$BannersTableUpdateCompanionBuilder,
      (Banner, BaseReferences<_$AppDatabase, $BannersTable, Banner>),
      Banner,
      PrefetchHooks Function()
    >;
typedef $$SectionsTableCreateCompanionBuilder =
    SectionsCompanion Function({
      required String id,
      required String title,
      required int position,
      Value<int> rowid,
    });
typedef $$SectionsTableUpdateCompanionBuilder =
    SectionsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<int> position,
      Value<int> rowid,
    });

class $$SectionsTableFilterComposer
    extends Composer<_$AppDatabase, $SectionsTable> {
  $$SectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SectionsTable> {
  $$SectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SectionsTable> {
  $$SectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);
}

class $$SectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SectionsTable,
          Section,
          $$SectionsTableFilterComposer,
          $$SectionsTableOrderingComposer,
          $$SectionsTableAnnotationComposer,
          $$SectionsTableCreateCompanionBuilder,
          $$SectionsTableUpdateCompanionBuilder,
          (Section, BaseReferences<_$AppDatabase, $SectionsTable, Section>),
          Section,
          PrefetchHooks Function()
        > {
  $$SectionsTableTableManager(_$AppDatabase db, $SectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SectionsCompanion(
                id: id,
                title: title,
                position: position,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required int position,
                Value<int> rowid = const Value.absent(),
              }) => SectionsCompanion.insert(
                id: id,
                title: title,
                position: position,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SectionsTable,
      Section,
      $$SectionsTableFilterComposer,
      $$SectionsTableOrderingComposer,
      $$SectionsTableAnnotationComposer,
      $$SectionsTableCreateCompanionBuilder,
      $$SectionsTableUpdateCompanionBuilder,
      (Section, BaseReferences<_$AppDatabase, $SectionsTable, Section>),
      Section,
      PrefetchHooks Function()
    >;
typedef $$SectionProductsTableCreateCompanionBuilder =
    SectionProductsCompanion Function({
      required String sectionId,
      required String productId,
      required int position,
      Value<int> rowid,
    });
typedef $$SectionProductsTableUpdateCompanionBuilder =
    SectionProductsCompanion Function({
      Value<String> sectionId,
      Value<String> productId,
      Value<int> position,
      Value<int> rowid,
    });

class $$SectionProductsTableFilterComposer
    extends Composer<_$AppDatabase, $SectionProductsTable> {
  $$SectionProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get sectionId => $composableBuilder(
    column: $table.sectionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SectionProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $SectionProductsTable> {
  $$SectionProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get sectionId => $composableBuilder(
    column: $table.sectionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SectionProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SectionProductsTable> {
  $$SectionProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get sectionId =>
      $composableBuilder(column: $table.sectionId, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);
}

class $$SectionProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SectionProductsTable,
          SectionProduct,
          $$SectionProductsTableFilterComposer,
          $$SectionProductsTableOrderingComposer,
          $$SectionProductsTableAnnotationComposer,
          $$SectionProductsTableCreateCompanionBuilder,
          $$SectionProductsTableUpdateCompanionBuilder,
          (
            SectionProduct,
            BaseReferences<
              _$AppDatabase,
              $SectionProductsTable,
              SectionProduct
            >,
          ),
          SectionProduct,
          PrefetchHooks Function()
        > {
  $$SectionProductsTableTableManager(
    _$AppDatabase db,
    $SectionProductsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SectionProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SectionProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SectionProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> sectionId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SectionProductsCompanion(
                sectionId: sectionId,
                productId: productId,
                position: position,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String sectionId,
                required String productId,
                required int position,
                Value<int> rowid = const Value.absent(),
              }) => SectionProductsCompanion.insert(
                sectionId: sectionId,
                productId: productId,
                position: position,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SectionProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SectionProductsTable,
      SectionProduct,
      $$SectionProductsTableFilterComposer,
      $$SectionProductsTableOrderingComposer,
      $$SectionProductsTableAnnotationComposer,
      $$SectionProductsTableCreateCompanionBuilder,
      $$SectionProductsTableUpdateCompanionBuilder,
      (
        SectionProduct,
        BaseReferences<_$AppDatabase, $SectionProductsTable, SectionProduct>,
      ),
      SectionProduct,
      PrefetchHooks Function()
    >;
typedef $$ShopsTableCreateCompanionBuilder =
    ShopsCompanion Function({
      required String id,
      required String name,
      required String address,
      required String distanceLabel,
      required String imageAsset,
      Value<String> imageUrl,
      required int position,
      Value<int> rowid,
    });
typedef $$ShopsTableUpdateCompanionBuilder =
    ShopsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> address,
      Value<String> distanceLabel,
      Value<String> imageAsset,
      Value<String> imageUrl,
      Value<int> position,
      Value<int> rowid,
    });

class $$ShopsTableFilterComposer extends Composer<_$AppDatabase, $ShopsTable> {
  $$ShopsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get distanceLabel => $composableBuilder(
    column: $table.distanceLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShopsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShopsTable> {
  $$ShopsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get distanceLabel => $composableBuilder(
    column: $table.distanceLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShopsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShopsTable> {
  $$ShopsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get distanceLabel => $composableBuilder(
    column: $table.distanceLabel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);
}

class $$ShopsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShopsTable,
          Shop,
          $$ShopsTableFilterComposer,
          $$ShopsTableOrderingComposer,
          $$ShopsTableAnnotationComposer,
          $$ShopsTableCreateCompanionBuilder,
          $$ShopsTableUpdateCompanionBuilder,
          (Shop, BaseReferences<_$AppDatabase, $ShopsTable, Shop>),
          Shop,
          PrefetchHooks Function()
        > {
  $$ShopsTableTableManager(_$AppDatabase db, $ShopsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> distanceLabel = const Value.absent(),
                Value<String> imageAsset = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ShopsCompanion(
                id: id,
                name: name,
                address: address,
                distanceLabel: distanceLabel,
                imageAsset: imageAsset,
                imageUrl: imageUrl,
                position: position,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String address,
                required String distanceLabel,
                required String imageAsset,
                Value<String> imageUrl = const Value.absent(),
                required int position,
                Value<int> rowid = const Value.absent(),
              }) => ShopsCompanion.insert(
                id: id,
                name: name,
                address: address,
                distanceLabel: distanceLabel,
                imageAsset: imageAsset,
                imageUrl: imageUrl,
                position: position,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ShopsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShopsTable,
      Shop,
      $$ShopsTableFilterComposer,
      $$ShopsTableOrderingComposer,
      $$ShopsTableAnnotationComposer,
      $$ShopsTableCreateCompanionBuilder,
      $$ShopsTableUpdateCompanionBuilder,
      (Shop, BaseReferences<_$AppDatabase, $ShopsTable, Shop>),
      Shop,
      PrefetchHooks Function()
    >;
typedef $$ChallengesTableCreateCompanionBuilder =
    ChallengesCompanion Function({
      required String id,
      required String title,
      required int progress,
      required int goal,
      required int rewardPoints,
      required String art,
      required String tabKind,
      required int position,
      Value<bool> claimed,
      Value<int> rowid,
    });
typedef $$ChallengesTableUpdateCompanionBuilder =
    ChallengesCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<int> progress,
      Value<int> goal,
      Value<int> rewardPoints,
      Value<String> art,
      Value<String> tabKind,
      Value<int> position,
      Value<bool> claimed,
      Value<int> rowid,
    });

class $$ChallengesTableFilterComposer
    extends Composer<_$AppDatabase, $ChallengesTable> {
  $$ChallengesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get goal => $composableBuilder(
    column: $table.goal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewardPoints => $composableBuilder(
    column: $table.rewardPoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get art => $composableBuilder(
    column: $table.art,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tabKind => $composableBuilder(
    column: $table.tabKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get claimed => $composableBuilder(
    column: $table.claimed,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChallengesTableOrderingComposer
    extends Composer<_$AppDatabase, $ChallengesTable> {
  $$ChallengesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get goal => $composableBuilder(
    column: $table.goal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewardPoints => $composableBuilder(
    column: $table.rewardPoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get art => $composableBuilder(
    column: $table.art,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tabKind => $composableBuilder(
    column: $table.tabKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get claimed => $composableBuilder(
    column: $table.claimed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChallengesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChallengesTable> {
  $$ChallengesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<int> get goal =>
      $composableBuilder(column: $table.goal, builder: (column) => column);

  GeneratedColumn<int> get rewardPoints => $composableBuilder(
    column: $table.rewardPoints,
    builder: (column) => column,
  );

  GeneratedColumn<String> get art =>
      $composableBuilder(column: $table.art, builder: (column) => column);

  GeneratedColumn<String> get tabKind =>
      $composableBuilder(column: $table.tabKind, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<bool> get claimed =>
      $composableBuilder(column: $table.claimed, builder: (column) => column);
}

class $$ChallengesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChallengesTable,
          Challenge,
          $$ChallengesTableFilterComposer,
          $$ChallengesTableOrderingComposer,
          $$ChallengesTableAnnotationComposer,
          $$ChallengesTableCreateCompanionBuilder,
          $$ChallengesTableUpdateCompanionBuilder,
          (
            Challenge,
            BaseReferences<_$AppDatabase, $ChallengesTable, Challenge>,
          ),
          Challenge,
          PrefetchHooks Function()
        > {
  $$ChallengesTableTableManager(_$AppDatabase db, $ChallengesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChallengesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChallengesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChallengesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> progress = const Value.absent(),
                Value<int> goal = const Value.absent(),
                Value<int> rewardPoints = const Value.absent(),
                Value<String> art = const Value.absent(),
                Value<String> tabKind = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<bool> claimed = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChallengesCompanion(
                id: id,
                title: title,
                progress: progress,
                goal: goal,
                rewardPoints: rewardPoints,
                art: art,
                tabKind: tabKind,
                position: position,
                claimed: claimed,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required int progress,
                required int goal,
                required int rewardPoints,
                required String art,
                required String tabKind,
                required int position,
                Value<bool> claimed = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChallengesCompanion.insert(
                id: id,
                title: title,
                progress: progress,
                goal: goal,
                rewardPoints: rewardPoints,
                art: art,
                tabKind: tabKind,
                position: position,
                claimed: claimed,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChallengesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChallengesTable,
      Challenge,
      $$ChallengesTableFilterComposer,
      $$ChallengesTableOrderingComposer,
      $$ChallengesTableAnnotationComposer,
      $$ChallengesTableCreateCompanionBuilder,
      $$ChallengesTableUpdateCompanionBuilder,
      (Challenge, BaseReferences<_$AppDatabase, $ChallengesTable, Challenge>),
      Challenge,
      PrefetchHooks Function()
    >;
typedef $$CartLinesTableCreateCompanionBuilder =
    CartLinesCompanion Function({
      required String productId,
      required int quantity,
      Value<int> rowid,
    });
typedef $$CartLinesTableUpdateCompanionBuilder =
    CartLinesCompanion Function({
      Value<String> productId,
      Value<int> quantity,
      Value<int> rowid,
    });

class $$CartLinesTableFilterComposer
    extends Composer<_$AppDatabase, $CartLinesTable> {
  $$CartLinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CartLinesTableOrderingComposer
    extends Composer<_$AppDatabase, $CartLinesTable> {
  $$CartLinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CartLinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CartLinesTable> {
  $$CartLinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);
}

class $$CartLinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CartLinesTable,
          CartLine,
          $$CartLinesTableFilterComposer,
          $$CartLinesTableOrderingComposer,
          $$CartLinesTableAnnotationComposer,
          $$CartLinesTableCreateCompanionBuilder,
          $$CartLinesTableUpdateCompanionBuilder,
          (CartLine, BaseReferences<_$AppDatabase, $CartLinesTable, CartLine>),
          CartLine,
          PrefetchHooks Function()
        > {
  $$CartLinesTableTableManager(_$AppDatabase db, $CartLinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CartLinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CartLinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CartLinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> productId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CartLinesCompanion(
                productId: productId,
                quantity: quantity,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String productId,
                required int quantity,
                Value<int> rowid = const Value.absent(),
              }) => CartLinesCompanion.insert(
                productId: productId,
                quantity: quantity,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CartLinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CartLinesTable,
      CartLine,
      $$CartLinesTableFilterComposer,
      $$CartLinesTableOrderingComposer,
      $$CartLinesTableAnnotationComposer,
      $$CartLinesTableCreateCompanionBuilder,
      $$CartLinesTableUpdateCompanionBuilder,
      (CartLine, BaseReferences<_$AppDatabase, $CartLinesTable, CartLine>),
      CartLine,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db, _db.accounts);
  $$MembersTableTableManager get members =>
      $$MembersTableTableManager(_db, _db.members);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$BannersTableTableManager get banners =>
      $$BannersTableTableManager(_db, _db.banners);
  $$SectionsTableTableManager get sections =>
      $$SectionsTableTableManager(_db, _db.sections);
  $$SectionProductsTableTableManager get sectionProducts =>
      $$SectionProductsTableTableManager(_db, _db.sectionProducts);
  $$ShopsTableTableManager get shops =>
      $$ShopsTableTableManager(_db, _db.shops);
  $$ChallengesTableTableManager get challenges =>
      $$ChallengesTableTableManager(_db, _db.challenges);
  $$CartLinesTableTableManager get cartLines =>
      $$CartLinesTableTableManager(_db, _db.cartLines);
}
