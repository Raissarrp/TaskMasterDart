class Task {
  const Task({
    required this.id,
    required this.title,
    required this.description,
    this.category = '',
    this.dueDate,
    this.isCompleted = false,
  });

  final String id;
  final String title;
  final String description;
  final String category;
  final DateTime? dueDate;
  final bool isCompleted;
}
