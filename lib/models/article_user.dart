import 'package:parcial_3/models/user.dart';

import 'article.dart';

class ArticleUser {
  final User user;
  final Article article;

  ArticleUser({required this.user, required this.article});

  factory ArticleUser.fromJson(Map<String, dynamic> json) {
    return ArticleUser(
      user: User.fromJson(json['user']),
      article: Article.fromJson(json['article']),
    );
  }
}
