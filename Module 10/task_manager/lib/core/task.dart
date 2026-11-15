class Task {
  Task({
    this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    required this.createdDate,
    this.isCompleted = false,
  });

  final int? id;
  final String title;
  final String description;
  final String dueDate;
  final String priority;
  final String createdDate;
  bool isCompleted;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'priority': priority,
      'createdDate': createdDate,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> mp) {
    return Task(
      id: mp['id'] as int?,
      title: mp['title'],
      description: mp['description'],
      dueDate: mp['dueDate'],
      priority: mp['priority'],
      createdDate: mp['createdDate'],
      isCompleted: mp['isCompleted'] == 1,
    );
  }
}
