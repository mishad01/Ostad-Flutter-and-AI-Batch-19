import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CrudPlaygroundScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CrudPlaygroundScreen> createState() => _CrudPlaygroundScreenState();
}

class _CrudPlaygroundScreenState extends State<CrudPlaygroundScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  //This is basically for editing a student
  int? editingId;

  List<Map<String, dynamic>> students = [];

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    ageController.dispose();
  }

  //Open Database
  Future<Database> openMyDatabase() async {
    String folder = await getDatabasesPath();
    String path = join(folder, 'part2_school.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE students(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          age INTEGER
        ''');
      },
    );
  }

  //Add, Edit/Update, Delete, Read/Get/Fetch

  //Add
  Future<void> addStudent() async {
    Database db = await openMyDatabase();
    await db.insert('students', {
      'name': nameController.text,
      'age': ageController.text,
    });
    clearBoxes();
    readStudents();
  }

  //Read/Fetch
  Future<void> readStudents() async {
    Database db = await openMyDatabase();
    List<Map<String, dynamic>> rows = await db.query('students');
    setState(() {
      students = rows;
    });
  }

  //Update
  Future<void> updateStudent() async {
    Database db = await openMyDatabase();
    await db.update(
      'students',
      {'name': nameController.text, 'age': ageController.text},
      where: 'id = ?', //Change only the specific student
      whereArgs: [editingId],
    );
    clearBoxes();
    readStudents();
  }

  //Delete
  Future<void> deleteStudent(int id) async {
    Database db = await openMyDatabase();
    await db.delete(
      'students',
      where: 'id = ?', //Delete only the specific student
      whereArgs: [id],
    );
    clearBoxes();
    readStudents();
  }

  void startEditing(Map<String, dynamic> student) {}

  void saveButtonPresses() {}

  void clearBoxes() {
    setState(() {
      editingId = null;
      nameController.clear();
      ageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CRUD Playground')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Center(child: Text('CRUD Playground')),
          ],
        ),
      ),
    );
  }
}
