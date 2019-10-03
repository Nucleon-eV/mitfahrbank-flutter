// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DatabaseProvider.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
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
  final String createdAt;
  final String updatedAt;
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
      createdAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
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
  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
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
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      admin: serializer.fromJson<bool>(json['admin']),
      verified: serializer.fromJson<bool>(json['verified']),
      avatar: serializer.fromJson<String>(json['avatar']),
      distanceToStartInMeters:
          serializer.fromJson<int>(json['distanceToStartInMeters']),
      carPhoto: serializer.fromJson<String>(json['carPhoto']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'own': serializer.toJson<bool>(own),
      'token': serializer.toJson<String>(token),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'email': serializer.toJson<String>(email),
      'firstInstall': serializer.toJson<bool>(firstInstall),
      'usesPushNotifications': serializer.toJson<bool>(usesPushNotifications),
      'usesEmailNotifications': serializer.toJson<bool>(usesEmailNotifications),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'admin': serializer.toJson<bool>(admin),
      'verified': serializer.toJson<bool>(verified),
      'avatar': serializer.toJson<String>(avatar),
      'distanceToStartInMeters':
          serializer.toJson<int>(distanceToStartInMeters),
      'carPhoto': serializer.toJson<String>(carPhoto),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<User>>(bool nullToAbsent) {
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
    ) as T;
  }

  User copyWith(
          {int id,
          bool own,
          String token,
          String firstName,
          String lastName,
          String email,
          bool firstInstall,
          bool usesPushNotifications,
          bool usesEmailNotifications,
            String createdAt,
            String updatedAt,
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
  bool operator ==(other) =>
      identical(this, other) ||
      (other is User &&
          other.id == id &&
          other.own == own &&
          other.token == token &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.email == email &&
          other.firstInstall == firstInstall &&
          other.usesPushNotifications == usesPushNotifications &&
          other.usesEmailNotifications == usesEmailNotifications &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt &&
          other.admin == admin &&
          other.verified == verified &&
          other.avatar == avatar &&
          other.distanceToStartInMeters == distanceToStartInMeters &&
          other.carPhoto == carPhoto);
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
  final Value<String> createdAt;
  final Value<String> updatedAt;
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
  UsersCompanion copyWith(
      {Value<int> id,
      Value<bool> own,
      Value<String> token,
      Value<String> firstName,
      Value<String> lastName,
      Value<String> email,
      Value<bool> firstInstall,
      Value<bool> usesPushNotifications,
      Value<bool> usesEmailNotifications,
        Value<String> createdAt,
        Value<String> updatedAt,
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
  GeneratedTextColumn _createdAt;
  @override
  GeneratedTextColumn get createdAt => _createdAt ??= _constructCreatedAt();

  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedTextColumn _updatedAt;
  @override
  GeneratedTextColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();

  GeneratedTextColumn _constructUpdatedAt() {
    return GeneratedTextColumn(
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
  VerificationContext validateIntegrity(UsersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.own.present) {
      context.handle(_ownMeta, own.isAcceptableValue(d.own.value, _ownMeta));
    } else if (own.isRequired && isInserting) {
      context.missing(_ownMeta);
    }
    if (d.token.present) {
      context.handle(
          _tokenMeta, token.isAcceptableValue(d.token.value, _tokenMeta));
    } else if (token.isRequired && isInserting) {
      context.missing(_tokenMeta);
    }
    if (d.firstName.present) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableValue(d.firstName.value, _firstNameMeta));
    } else if (firstName.isRequired && isInserting) {
      context.missing(_firstNameMeta);
    }
    if (d.lastName.present) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableValue(d.lastName.value, _lastNameMeta));
    } else if (lastName.isRequired && isInserting) {
      context.missing(_lastNameMeta);
    }
    if (d.email.present) {
      context.handle(
          _emailMeta, email.isAcceptableValue(d.email.value, _emailMeta));
    } else if (email.isRequired && isInserting) {
      context.missing(_emailMeta);
    }
    if (d.firstInstall.present) {
      context.handle(
          _firstInstallMeta,
          firstInstall.isAcceptableValue(
              d.firstInstall.value, _firstInstallMeta));
    } else if (firstInstall.isRequired && isInserting) {
      context.missing(_firstInstallMeta);
    }
    if (d.usesPushNotifications.present) {
      context.handle(
          _usesPushNotificationsMeta,
          usesPushNotifications.isAcceptableValue(
              d.usesPushNotifications.value, _usesPushNotificationsMeta));
    } else if (usesPushNotifications.isRequired && isInserting) {
      context.missing(_usesPushNotificationsMeta);
    }
    if (d.usesEmailNotifications.present) {
      context.handle(
          _usesEmailNotificationsMeta,
          usesEmailNotifications.isAcceptableValue(
              d.usesEmailNotifications.value, _usesEmailNotificationsMeta));
    } else if (usesEmailNotifications.isRequired && isInserting) {
      context.missing(_usesEmailNotificationsMeta);
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    } else if (createdAt.isRequired && isInserting) {
      context.missing(_createdAtMeta);
    }
    if (d.updatedAt.present) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableValue(d.updatedAt.value, _updatedAtMeta));
    } else if (updatedAt.isRequired && isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (d.admin.present) {
      context.handle(
          _adminMeta, admin.isAcceptableValue(d.admin.value, _adminMeta));
    } else if (admin.isRequired && isInserting) {
      context.missing(_adminMeta);
    }
    if (d.verified.present) {
      context.handle(_verifiedMeta,
          verified.isAcceptableValue(d.verified.value, _verifiedMeta));
    } else if (verified.isRequired && isInserting) {
      context.missing(_verifiedMeta);
    }
    if (d.avatar.present) {
      context.handle(
          _avatarMeta, avatar.isAcceptableValue(d.avatar.value, _avatarMeta));
    } else if (avatar.isRequired && isInserting) {
      context.missing(_avatarMeta);
    }
    if (d.distanceToStartInMeters.present) {
      context.handle(
          _distanceToStartInMetersMeta,
          distanceToStartInMeters.isAcceptableValue(
              d.distanceToStartInMeters.value, _distanceToStartInMetersMeta));
    } else if (distanceToStartInMeters.isRequired && isInserting) {
      context.missing(_distanceToStartInMetersMeta);
    }
    if (d.carPhoto.present) {
      context.handle(_carPhotoMeta,
          carPhoto.isAcceptableValue(d.carPhoto.value, _carPhotoMeta));
    } else if (carPhoto.isRequired && isInserting) {
      context.missing(_carPhotoMeta);
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
  Map<String, Variable> entityToSql(UsersCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.own.present) {
      map['own'] = Variable<bool, BoolType>(d.own.value);
    }
    if (d.token.present) {
      map['token'] = Variable<String, StringType>(d.token.value);
    }
    if (d.firstName.present) {
      map['first_name'] = Variable<String, StringType>(d.firstName.value);
    }
    if (d.lastName.present) {
      map['last_name'] = Variable<String, StringType>(d.lastName.value);
    }
    if (d.email.present) {
      map['email'] = Variable<String, StringType>(d.email.value);
    }
    if (d.firstInstall.present) {
      map['first_install'] = Variable<bool, BoolType>(d.firstInstall.value);
    }
    if (d.usesPushNotifications.present) {
      map['uses_push_notifications'] =
          Variable<bool, BoolType>(d.usesPushNotifications.value);
    }
    if (d.usesEmailNotifications.present) {
      map['uses_email_notifications'] =
          Variable<bool, BoolType>(d.usesEmailNotifications.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<String, StringType>(d.createdAt.value);
    }
    if (d.updatedAt.present) {
      map['updated_at'] = Variable<String, StringType>(d.updatedAt.value);
    }
    if (d.admin.present) {
      map['admin'] = Variable<bool, BoolType>(d.admin.value);
    }
    if (d.verified.present) {
      map['verified'] = Variable<bool, BoolType>(d.verified.value);
    }
    if (d.avatar.present) {
      map['avatar'] = Variable<String, StringType>(d.avatar.value);
    }
    if (d.distanceToStartInMeters.present) {
      map['distance_to_start_in_meters'] =
          Variable<int, IntType>(d.distanceToStartInMeters.value);
    }
    if (d.carPhoto.present) {
      map['car_photo'] = Variable<String, StringType>(d.carPhoto.value);
    }
    return map;
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

abstract class _$DatabaseProvider extends GeneratedDatabase {
  _$DatabaseProvider(QueryExecutor e)
      : super(const SqlTypeSystem.withDefaults(), e);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  @override
  List<TableInfo> get allTables => [users];
}
