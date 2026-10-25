import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class CreateInsertScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CreateInsertScreen> createState() => _CreateInsertScreenState();
}

class _CreateInsertScreenState extends State<CreateInsertScreen> {
  //For open database. It is null until user open database
  Database? _db;

  //Rows we read from table to show at scree
  final List<String> _log = ['Tap "1. Open database, to begin'];

  void _say(String message) {
    setState(() {
      _log.add(message);
    });
  }

  //(Open/create) database
  Future<void> _openDb() async {
    final String folder = await getDatabasesPath();

    //Join the folder and the file name with the right slash
    //Example : /data/user/0/.../database/part1_school.db
    final String path = join(folder, 'part1_school.db');

    final Database db = await openDatabase(
      path,
      //in future if you change table design you increase the version to 2
      version: 1,
      onCreate: (Database db, int version) {
        db.execute('''
          CREATE TABLE students(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          age INTEGER NOT NULL
          )
        ''');
      },
    );
    _db = db;
    _say('Database opened at $path, Table "Student is ready"');
    _showRows();
    print(path);
  }

  //Insert Data
  Future<void> _insertWithSql() async {
    final Database? db = _db;
    if (db == null) return;

    final int id = await db.rawInsert(
      'INSERT INTO students (name,age) VALUES(?,?)',
      ['mishad', '25'],
    );

    _say('Inserted row id=$id, name=abd, age=25');
    _showRows();
  }

  //Peek at table
  Future<void> _showRows() async {
    final Database? db = _db;
    if (db == null) return;

    final List<Map<String, Object?>> rows = await db.query('students');
    _say('Rows in table: $rows');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rahim')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _openDb,
                child: const Text('1. Open database'),
              ),
              ElevatedButton(
                onPressed: _insertWithSql,
                child: const Text('2. Insert data'),
              ),
              const SizedBox(height: 20),
              const Text('Log:', style: TextStyle(fontWeight: FontWeight.bold)),
              ..._log.map((e) => Text(e)),
              const SizedBox(height: 20),
              const Text(
                'Table rows:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ..._log.map((e) => Text(e)),
            ],
          ),
        ),
      ),
    );
  }
}

/*
1. List, Map, Object, Dynamic, 
2. Future, async, await 
 */
