class TodoModel {
  final bool isDone;
  final String title;
  final DateTime createdAt;

  TodoModel({
    required this.isDone,
    required this.title,
    required this.createdAt,
  });

  TodoModel copyWith({
    String? title,
    bool? isDone,
    DateTime? createdAt,
  }) {
    return TodoModel(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
