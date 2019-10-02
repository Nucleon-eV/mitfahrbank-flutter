import 'package:moor_flutter/moor_flutter.dart';

part 'DatabaseProvider.g.dart';

@UseMoor(tables: [Users])
class DatabaseProvider extends _$DatabaseProvider {
  // we tell the database where to store the data with this constructor
  DatabaseProvider()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Future<int> addUser(UsersCompanion entry) {
    return into(users).insert(entry);
  }

  Future<User> get ownUser => (select(users)
        ..where((t) => t.own.equals(true))
        ..limit(1))
      .getSingle();
}

/*
  int _id;
  String _firstName;
  String _lastName;
  String _email;
  bool _firstInstall;
  bool _usesPushNotifications;
  bool _usesEmailNotifications;
  int _createdAt;
  int _updatedAt;
  bool _admin;
  bool _verified;
  String _avatar;
  int _distanceToStartInMeters;
  String _carPhoto;
*/
class Users extends Table {
  IntColumn get id => integer()();

  BoolColumn get own => boolean()();

  TextColumn get token => text()();

  TextColumn get firstName => text()();

  TextColumn get lastName => text().nullable()();

  TextColumn get email => text()();

  BoolColumn get firstInstall => boolean()();

  BoolColumn get usesPushNotifications => boolean()();

  BoolColumn get usesEmailNotifications => boolean()();

  IntColumn get createdAt => integer()();

  IntColumn get updatedAt => integer()();

  BoolColumn get admin => boolean()();

  BoolColumn get verified => boolean()();

  TextColumn get avatar => text().nullable()();

  IntColumn get distanceToStartInMeters => integer().nullable()();

  TextColumn get carPhoto => text().nullable()();
}
