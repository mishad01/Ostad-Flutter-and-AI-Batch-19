import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager/core/task.dart';

class DatabaseHelper {
  static Future<Database> getDatabase() async {
    String folder = await getDatabasesPath();
    String path = join(folder, 'task_manager.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE tasks (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          description TEXT NOT NULL,
          dueDate TEXT NOT NULL,
          priority TEXT NOT NULL,
          createdDate TEXT NOT NULL,
          isCompleted INTEGER NOT NULL
        )
      ''');
      },
    );
  }

  //Add Task
  static Future<void> insertTask(Task task) async {
    final db = await getDatabase();
    await db.insert('tasks', task.toMap());
  }

  //Get Task
  static Future<List<Task>> getTasks() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> rows = await db.query(
      'tasks',
      orderBy: 'id DESC ',
    );

    List<Task> tasks = [];

    for (Map<String, dynamic> row in rows) {
      tasks.add(Task.fromMap(row));
    }
    return tasks;
  }

  //Update/Edit Task
  static Future<void> updateTask(Task task) async {
    final db = await getDatabase();
    await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  //Delete Task
  static Future<void> deleteTask(int id) async {
    final db = await getDatabase();
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
