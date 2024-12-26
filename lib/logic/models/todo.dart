class Todo {
  final String taskId;
  final int status;
  final String name;
  final int type;
  final String description;
  final String? file;
  final DateTime finishDate;
  final int urgent;
  final DateTime? syncTime;

  const Todo({
    required this.taskId,
    required this.status,
    required this.name,
    required this.type,
    required this.description,
    this.file,
    required this.finishDate,
    required this.urgent,
    this.syncTime,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      taskId: json['taskId']?.toString() ?? '',
      status: json['status'] is String
          ? int.tryParse(json['status']) ?? 0
          : json['status'] ?? 0,
      name: json['name'] ?? '',
      type: json['type'] is String
          ? int.tryParse(json['type']) ?? 0
          : json['type'] ?? 0,
      description: json['description'] ?? '',
      file: json['file'] ?? '',
      finishDate:
          DateTime.parse(json['finishDate'] ?? DateTime.now().toString()),
      urgent: json['urgent'] is String
          ? int.tryParse(json['urgent']) ?? 0
          : json['urgent'] ?? 0,
      syncTime:
          json['syncTime'] != null ? DateTime.parse(json['syncTime']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskId': taskId,
      'status': status,
      'name': name,
      'type': type,
      'description': description,
      'file': file,
      'finishDate': finishDate.toIso8601String(),
      'urgent': urgent,
      'syncTime': syncTime?.toIso8601String(),
    };
  }
}
