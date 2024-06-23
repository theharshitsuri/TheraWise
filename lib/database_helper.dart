import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'therawise.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE Exercises(
            id INTEGER PRIMARY KEY,
            title TEXT,
            description TEXT,
            category TEXT,
            steps TEXT
          )
          ''',
        );
      },
      version: 1,
    );
  }

  Future<void> insertExercise(Exercise exercise) async {
    final db = await database;
    await db.insert('Exercises', exercise.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('Inserted: ${exercise.title}');
  }

  Future<List<Exercise>> fetchExercises() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Exercises');
    print('Fetched ${maps.length} exercises');
    return List.generate(maps.length, (i) {
      return Exercise(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        category: maps[i]['category'],
        steps: maps[i]['steps'],
      );
    });
  }
}
