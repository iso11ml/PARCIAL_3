class Comment {
  final String userId;
  final String description;
  final String timestamp;

  Comment({
    required this.userId,
    required this.description,
    required this.timestamp,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      userId: json['user_id'],
      description: json['description'],
      timestamp: json['timestamp'],
    );
  }
}
