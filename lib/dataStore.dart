import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DogDataStore {

  DogDataStore._builder(this._db);

  final Database _db;

  static Future<DogDataStore> open(String filename) async {
    return DogDataStore._builder(
      await openDatabase(
        join(await getDatabasesPath(), filename),

        // only run when file not found or version number is not the one expected
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
          );
        },

        version: 1,
      )
    );
  }

  Future<void> insert(Dog dog) {
    return _db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> getAllDogs() async {
    final List<Map<String, dynamic>> maps = await _db.query('dogs');
    return List.generate(maps.length, (i) {
      return Dog.fromMap(maps[i]);
    });
  }

  Future<void> cleanDb() {
    return _db.delete('dogs');
  }

  Future<void> close() {
    return _db.close();
  }
}

class Dog {
  final int id;
  final String name;
  final int age;

  const Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  static Dog fromMap(Map<String, dynamic> map) {
    return Dog(
      id: map['id'],
      name: map['name'],
      age: map['age'],
    );
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
