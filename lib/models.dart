class Exercise {
  final int? id;
  final String title;
  final String description;
  final String category;
  final String steps;

  Exercise({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.steps,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'steps': steps,
    };
  }
}
