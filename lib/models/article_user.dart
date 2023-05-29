import 'package:parcial_3/models/user.dart';
import 'article.dart';

class ArticleUser {
  final User user;
  final Article article;
  final String category;

  ArticleUser(
      {required this.user, required this.article, required this.category});

  factory ArticleUser.fromJson(Map<String, dynamic> json) {
    return ArticleUser(
      user: User.fromJson(json['user']),
      article: Article.fromJson(json['article']),
      category: json['category'],
    );
  }
}
