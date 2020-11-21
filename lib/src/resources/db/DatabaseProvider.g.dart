// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DatabaseProvider.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final int id;
  final bool own;
  final String token;
  final String firstName;
  final String lastName;
  final String email;
  final bool firstInstall;
  final bool usesPushNotifications;
  final bool usesEmailNotifications;
  final int createdAt;
  final int updatedAt;
  final bool admin;
  final bool verified;
  final String avatar;
  final int distanceToStartInMeters;
  final String carPhoto;
  User(
      {@required this.id,
      @required this.own,
      @required this.token,
      @required this.firstName,
      this.lastName,
      @required this.email,
      @required this.firstInstall,
      @required this.usesPushNotifications,
      @required this.usesEmailNotifications,
      @required this.createdAt,
      @required this.updatedAt,
      @required this.admin,
      @required this.verified,
      this.avatar,
      this.distanceToStartInMeters,
      this.carPhoto});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      own: boolType.mapFromDatabaseResponse(data['${effectivePrefix}own']),
      token:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}token']),
      firstName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      firstInstall: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}first_install']),
      usesPushNotifications: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}uses_push_notifications']),
      usesEmailNotifications: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}uses_email_notifications']),
      createdAt:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
      admin: boolType.mapFromDatabaseResponse(data['${effectivePrefix}admin']),
      verified:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}verified']),
      avatar:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}avatar']),
      distanceToStartInMeters: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}distance_to_start_in_meters']),
      carPhoto: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}car_photo']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || own != null) {
      map['own'] = Variable<bool>(own);
    }
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String>(token);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || firstInstall != null) {
      map['first_install'] = Variable<bool>(firstInstall);
    }
    if (!nullToAbsent || usesPushNotifications != null) {
      map['uses_push_notifications'] = Variable<bool>(usesPushNotifications);
    }
    if (!nullToAbsent || usesEmailNotifications != null) {
      map['uses_email_notifications'] = Variable<bool>(usesEmailNotifications);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<int>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<int>(updatedAt);
    }
    if (!nullToAbsent || admin != null) {
      map['admin'] = Variable<bool>(admin);
    }
    if (!nullToAbsent || verified != null) {
      map['verified'] = Variable<bool>(verified);
    }
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    if (!nullToAbsent || distanceToStartInMeters != null) {
      map['distance_to_start_in_meters'] =
          Variable<int>(distanceToStartInMeters);
    }
    if (!nullToAbsent || carPhoto != null) {
      map['car_photo'] = Variable<String>(carPhoto);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      own: own == null && nullToAbsent ? const Value.absent() : Value(own),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      firstInstall: firstInstall == null && nullToAbsent
          ? const Value.absent()
          : Value(firstInstall),
      usesPushNotifications: usesPushNotifications == null && nullToAbsent
          ? const Value.absent()
          : Value(usesPushNotifications),
      usesEmailNotifications: usesEmailNotifications == null && nullToAbsent
          ? const Value.absent()
          : Value(usesEmailNotifications),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      admin:
          admin == null && nullToAbsent ? const Value.absent() : Value(admin),
      verified: verified == null && nullToAbsent
          ? const Value.absent()
          : Value(verified),
      avatar:
      avatar == null && nullToAbsent ? const Value.absent() : Value(avatar),
      distanceToStartInMeters: distanceToStartInMeters == null && nullToAbsent
          ? const Value.absent()
          : Value(distanceToStartInMeters),
      carPhoto: carPhoto == null && nullToAbsent
          ? const Value.absent()
          : Value(carPhoto),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      own: serializer.fromJson<bool>(json['own']),
      token: serializer.fromJson<String>(json['token']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      email: serializer.fromJson<String>(json['email']),
      firstInstall: serializer.fromJson<bool>(json['firstInstall']),
      usesPushNotifications:
      serializer.fromJson<bool>(json['usesPushNotifications']),
      usesEmailNotifications:
      serializer.fromJson<bool>(json['usesEmailNotifications']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      admin: serializer.fromJson<bool>(json['admin']),
      verified: serializer.fromJson<bool>(json['verified']),
      avatar: serializer.fromJson<String>(json['avatar']),
      distanceToStartInMeters:
      serializer.fromJson<int>(json['distanceToStartInMeters']),
      carPhoto: serializer.fromJson<String>(json['carPhoto']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'own': serializer.toJson<bool>(own),
      'token': serializer.toJson<String>(token),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'email': serializer.toJson<String>(email),
      'firstInstall': serializer.toJson<bool>(firstInstall),
      'usesPushNotifications': serializer.toJson<bool>(usesPushNotifications),
      'usesEmailNotifications': serializer.toJson<bool>(usesEmailNotifications),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'admin': serializer.toJson<bool>(admin),
      'verified': serializer.toJson<bool>(verified),
      'avatar': serializer.toJson<String>(avatar),
      'distanceToStartInMeters':
      serializer.toJson<int>(distanceToStartInMeters),
      'carPhoto': serializer.toJson<String>(carPhoto),
    };
  }

  User copyWith({int id,
    bool own,
    String token,
    String firstName,
    String lastName,
    String email,
    bool firstInstall,
    bool usesPushNotifications,
          bool usesEmailNotifications,
          int createdAt,
          int updatedAt,
          bool admin,
          bool verified,
          String avatar,
          int distanceToStartInMeters,
          String carPhoto}) =>
      User(
        id: id ?? this.id,
        own: own ?? this.own,
        token: token ?? this.token,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        firstInstall: firstInstall ?? this.firstInstall,
        usesPushNotifications:
            usesPushNotifications ?? this.usesPushNotifications,
        usesEmailNotifications:
            usesEmailNotifications ?? this.usesEmailNotifications,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        admin: admin ?? this.admin,
        verified: verified ?? this.verified,
        avatar: avatar ?? this.avatar,
        distanceToStartInMeters:
            distanceToStartInMeters ?? this.distanceToStartInMeters,
        carPhoto: carPhoto ?? this.carPhoto,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('own: $own, ')
          ..write('token: $token, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('firstInstall: $firstInstall, ')
          ..write('usesPushNotifications: $usesPushNotifications, ')
          ..write('usesEmailNotifications: $usesEmailNotifications, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('admin: $admin, ')
          ..write('verified: $verified, ')
          ..write('avatar: $avatar, ')
          ..write('distanceToStartInMeters: $distanceToStartInMeters, ')
          ..write('carPhoto: $carPhoto')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          own.hashCode,
          $mrjc(
              token.hashCode,
              $mrjc(
                  firstName.hashCode,
                  $mrjc(
                      lastName.hashCode,
                      $mrjc(
                          email.hashCode,
                          $mrjc(
                              firstInstall.hashCode,
                              $mrjc(
                                  usesPushNotifications.hashCode,
                                  $mrjc(
                                      usesEmailNotifications.hashCode,
                                      $mrjc(
                                          createdAt.hashCode,
                                          $mrjc(
                                              updatedAt.hashCode,
                                              $mrjc(
                                                  admin.hashCode,
                                                  $mrjc(
                                                      verified.hashCode,
                                                      $mrjc(
                                                          avatar.hashCode,
                                                          $mrjc(
                                                              distanceToStartInMeters
                                                                  .hashCode,
                                                              carPhoto
                                                                  .hashCode))))))))))))))));

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
          (other is User &&
              other.id == this.id &&
              other.own == this.own &&
              other.token == this.token &&
              other.firstName == this.firstName &&
              other.lastName == this.lastName &&
              other.email == this.email &&
              other.firstInstall == this.firstInstall &&
              other.usesPushNotifications == this.usesPushNotifications &&
          other.usesEmailNotifications == this.usesEmailNotifications &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.admin == this.admin &&
          other.verified == this.verified &&
          other.avatar == this.avatar &&
          other.distanceToStartInMeters == this.distanceToStartInMeters &&
          other.carPhoto == this.carPhoto);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<bool> own;
  final Value<String> token;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> email;
  final Value<bool> firstInstall;
  final Value<bool> usesPushNotifications;
  final Value<bool> usesEmailNotifications;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<bool> admin;
  final Value<bool> verified;
  final Value<String> avatar;
  final Value<int> distanceToStartInMeters;
  final Value<String> carPhoto;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.own = const Value.absent(),
    this.token = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.firstInstall = const Value.absent(),
    this.usesPushNotifications = const Value.absent(),
    this.usesEmailNotifications = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.admin = const Value.absent(),
    this.verified = const Value.absent(),
    this.avatar = const Value.absent(),
    this.distanceToStartInMeters = const Value.absent(),
    this.carPhoto = const Value.absent(),
  });
  UsersCompanion.insert({
    @required int id,
    @required bool own,
    @required String token,
    @required String firstName,
    this.lastName = const Value.absent(),
    @required String email,
    @required bool firstInstall,
    @required bool usesPushNotifications,
    @required bool usesEmailNotifications,
    @required int createdAt,
    @required int updatedAt,
    @required bool admin,
    @required bool verified,
    this.avatar = const Value.absent(),
    this.distanceToStartInMeters = const Value.absent(),
    this.carPhoto = const Value.absent(),
  })
      : id = Value(id),
        own = Value(own),
        token = Value(token),
        firstName = Value(firstName),
        email = Value(email),
        firstInstall = Value(firstInstall),
        usesPushNotifications = Value(usesPushNotifications),
        usesEmailNotifications = Value(usesEmailNotifications),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        admin = Value(admin),
        verified = Value(verified);

  static Insertable<User> custom({
    Expression<int> id,
    Expression<bool> own,
    Expression<String> token,
    Expression<String> firstName,
    Expression<String> lastName,
    Expression<String> email,
    Expression<bool> firstInstall,
    Expression<bool> usesPushNotifications,
    Expression<bool> usesEmailNotifications,
    Expression<int> createdAt,
    Expression<int> updatedAt,
    Expression<bool> admin,
    Expression<bool> verified,
    Expression<String> avatar,
    Expression<int> distanceToStartInMeters,
    Expression<String> carPhoto,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (own != null) 'own': own,
      if (token != null) 'token': token,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (firstInstall != null) 'first_install': firstInstall,
      if (usesPushNotifications != null)
        'uses_push_notifications': usesPushNotifications,
      if (usesEmailNotifications != null)
        'uses_email_notifications': usesEmailNotifications,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (admin != null) 'admin': admin,
      if (verified != null) 'verified': verified,
      if (avatar != null) 'avatar': avatar,
      if (distanceToStartInMeters != null)
        'distance_to_start_in_meters': distanceToStartInMeters,
      if (carPhoto != null) 'car_photo': carPhoto,
    });
  }

  UsersCompanion copyWith({Value<int> id,
    Value<bool> own,
    Value<String> token,
    Value<String> firstName,
    Value<String> lastName,
    Value<String> email,
    Value<bool> firstInstall,
    Value<bool> usesPushNotifications,
      Value<bool> usesEmailNotifications,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<bool> admin,
      Value<bool> verified,
      Value<String> avatar,
      Value<int> distanceToStartInMeters,
      Value<String> carPhoto}) {
    return UsersCompanion(
      id: id ?? this.id,
      own: own ?? this.own,
      token: token ?? this.token,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      firstInstall: firstInstall ?? this.firstInstall,
      usesPushNotifications:
          usesPushNotifications ?? this.usesPushNotifications,
      usesEmailNotifications:
          usesEmailNotifications ?? this.usesEmailNotifications,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      admin: admin ?? this.admin,
      verified: verified ?? this.verified,
      avatar: avatar ?? this.avatar,
      distanceToStartInMeters:
      distanceToStartInMeters ?? this.distanceToStartInMeters,
      carPhoto: carPhoto ?? this.carPhoto,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (own.present) {
      map['own'] = Variable<bool>(own.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (firstInstall.present) {
      map['first_install'] = Variable<bool>(firstInstall.value);
    }
    if (usesPushNotifications.present) {
      map['uses_push_notifications'] =
          Variable<bool>(usesPushNotifications.value);
    }
    if (usesEmailNotifications.present) {
      map['uses_email_notifications'] =
          Variable<bool>(usesEmailNotifications.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (admin.present) {
      map['admin'] = Variable<bool>(admin.value);
    }
    if (verified.present) {
      map['verified'] = Variable<bool>(verified.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (distanceToStartInMeters.present) {
      map['distance_to_start_in_meters'] =
          Variable<int>(distanceToStartInMeters.value);
    }
    if (carPhoto.present) {
      map['car_photo'] = Variable<String>(carPhoto.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
      ..write('id: $id, ')..write('own: $own, ')..write(
          'token: $token, ')..write('firstName: $firstName, ')..write(
          'lastName: $lastName, ')..write('email: $email, ')..write(
          'firstInstall: $firstInstall, ')..write(
          'usesPushNotifications: $usesPushNotifications, ')..write(
          'usesEmailNotifications: $usesEmailNotifications, ')..write(
          'createdAt: $createdAt, ')..write('updatedAt: $updatedAt, ')..write(
          'admin: $admin, ')..write('verified: $verified, ')..write(
          'avatar: $avatar, ')..write(
          'distanceToStartInMeters: $distanceToStartInMeters, ')..write(
          'carPhoto: $carPhoto')..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ownMeta = const VerificationMeta('own');
  GeneratedBoolColumn _own;
  @override
  GeneratedBoolColumn get own => _own ??= _constructOwn();
  GeneratedBoolColumn _constructOwn() {
    return GeneratedBoolColumn(
      'own',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tokenMeta = const VerificationMeta('token');
  GeneratedTextColumn _token;
  @override
  GeneratedTextColumn get token => _token ??= _constructToken();
  GeneratedTextColumn _constructToken() {
    return GeneratedTextColumn(
      'token',
      $tableName,
      false,
    );
  }

  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  GeneratedTextColumn _firstName;
  @override
  GeneratedTextColumn get firstName => _firstName ??= _constructFirstName();
  GeneratedTextColumn _constructFirstName() {
    return GeneratedTextColumn(
      'first_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  GeneratedTextColumn _lastName;
  @override
  GeneratedTextColumn get lastName => _lastName ??= _constructLastName();
  GeneratedTextColumn _constructLastName() {
    return GeneratedTextColumn(
      'last_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _firstInstallMeta =
      const VerificationMeta('firstInstall');
  GeneratedBoolColumn _firstInstall;
  @override
  GeneratedBoolColumn get firstInstall =>
      _firstInstall ??= _constructFirstInstall();
  GeneratedBoolColumn _constructFirstInstall() {
    return GeneratedBoolColumn(
      'first_install',
      $tableName,
      false,
    );
  }

  final VerificationMeta _usesPushNotificationsMeta =
      const VerificationMeta('usesPushNotifications');
  GeneratedBoolColumn _usesPushNotifications;
  @override
  GeneratedBoolColumn get usesPushNotifications =>
      _usesPushNotifications ??= _constructUsesPushNotifications();
  GeneratedBoolColumn _constructUsesPushNotifications() {
    return GeneratedBoolColumn(
      'uses_push_notifications',
      $tableName,
      false,
    );
  }

  final VerificationMeta _usesEmailNotificationsMeta =
      const VerificationMeta('usesEmailNotifications');
  GeneratedBoolColumn _usesEmailNotifications;
  @override
  GeneratedBoolColumn get usesEmailNotifications =>
      _usesEmailNotifications ??= _constructUsesEmailNotifications();
  GeneratedBoolColumn _constructUsesEmailNotifications() {
    return GeneratedBoolColumn(
      'uses_email_notifications',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedIntColumn _createdAt;
  @override
  GeneratedIntColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedIntColumn _constructCreatedAt() {
    return GeneratedIntColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedIntColumn _updatedAt;
  @override
  GeneratedIntColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedIntColumn _constructUpdatedAt() {
    return GeneratedIntColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _adminMeta = const VerificationMeta('admin');
  GeneratedBoolColumn _admin;
  @override
  GeneratedBoolColumn get admin => _admin ??= _constructAdmin();
  GeneratedBoolColumn _constructAdmin() {
    return GeneratedBoolColumn(
      'admin',
      $tableName,
      false,
    );
  }

  final VerificationMeta _verifiedMeta = const VerificationMeta('verified');
  GeneratedBoolColumn _verified;
  @override
  GeneratedBoolColumn get verified => _verified ??= _constructVerified();
  GeneratedBoolColumn _constructVerified() {
    return GeneratedBoolColumn(
      'verified',
      $tableName,
      false,
    );
  }

  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  GeneratedTextColumn _avatar;
  @override
  GeneratedTextColumn get avatar => _avatar ??= _constructAvatar();
  GeneratedTextColumn _constructAvatar() {
    return GeneratedTextColumn(
      'avatar',
      $tableName,
      true,
    );
  }

  final VerificationMeta _distanceToStartInMetersMeta =
      const VerificationMeta('distanceToStartInMeters');
  GeneratedIntColumn _distanceToStartInMeters;
  @override
  GeneratedIntColumn get distanceToStartInMeters =>
      _distanceToStartInMeters ??= _constructDistanceToStartInMeters();
  GeneratedIntColumn _constructDistanceToStartInMeters() {
    return GeneratedIntColumn(
      'distance_to_start_in_meters',
      $tableName,
      true,
    );
  }

  final VerificationMeta _carPhotoMeta = const VerificationMeta('carPhoto');
  GeneratedTextColumn _carPhoto;
  @override
  GeneratedTextColumn get carPhoto => _carPhoto ??= _constructCarPhoto();
  GeneratedTextColumn _constructCarPhoto() {
    return GeneratedTextColumn(
      'car_photo',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        own,
        token,
        firstName,
        lastName,
        email,
        firstInstall,
        usesPushNotifications,
        usesEmailNotifications,
        createdAt,
        updatedAt,
        admin,
        verified,
        avatar,
        distanceToStartInMeters,
        carPhoto
      ];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';

  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('own')) {
      context.handle(
          _ownMeta, own.isAcceptableOrUnknown(data['own'], _ownMeta));
    } else if (isInserting) {
      context.missing(_ownMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token'], _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name'], _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name'], _lastNameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('first_install')) {
      context.handle(
          _firstInstallMeta,
          firstInstall.isAcceptableOrUnknown(
              data['first_install'], _firstInstallMeta));
    } else if (isInserting) {
      context.missing(_firstInstallMeta);
    }
    if (data.containsKey('uses_push_notifications')) {
      context.handle(
          _usesPushNotificationsMeta,
          usesPushNotifications.isAcceptableOrUnknown(
              data['uses_push_notifications'], _usesPushNotificationsMeta));
    } else if (isInserting) {
      context.missing(_usesPushNotificationsMeta);
    }
    if (data.containsKey('uses_email_notifications')) {
      context.handle(
          _usesEmailNotificationsMeta,
          usesEmailNotifications.isAcceptableOrUnknown(
              data['uses_email_notifications'], _usesEmailNotificationsMeta));
    } else if (isInserting) {
      context.missing(_usesEmailNotificationsMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('admin')) {
      context.handle(
          _adminMeta, admin.isAcceptableOrUnknown(data['admin'], _adminMeta));
    } else if (isInserting) {
      context.missing(_adminMeta);
    }
    if (data.containsKey('verified')) {
      context.handle(_verifiedMeta,
          verified.isAcceptableOrUnknown(data['verified'], _verifiedMeta));
    } else if (isInserting) {
      context.missing(_verifiedMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar'], _avatarMeta));
    }
    if (data.containsKey('distance_to_start_in_meters')) {
      context.handle(
          _distanceToStartInMetersMeta,
          distanceToStartInMeters.isAcceptableOrUnknown(
              data['distance_to_start_in_meters'],
              _distanceToStartInMetersMeta));
    }
    if (data.containsKey('car_photo')) {
      context.handle(_carPhotoMeta,
          carPhoto.isAcceptableOrUnknown(data['car_photo'], _carPhotoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

abstract class _$DatabaseProvider extends GeneratedDatabase {
  _$DatabaseProvider(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UsersTable _users;

  $UsersTable get users => _users ??= $UsersTable(this);

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}
