import 'comment.dart';

class Article {
  final String idObject;
  final String title;
  final String description;
  final String date;
  final String userId;
  final List<String> likesUserId;
  final List<Comment> comments;

  Article({
    required this.idObject,
    required this.title,
    required this.description,
    required this.date,
    required this.userId,
    required this.likesUserId,
    required this.comments,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      idObject: json['_id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      userId: json['user_id'],
      likesUserId: List<String>.from(json['likesUserID']),
      comments: List<Comment>.from(
          json['comments'].map((comment) => Comment.fromJson(comment))),
    );
  }
}
