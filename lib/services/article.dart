import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/article_user.dart';

class ArticleService {
  final String _baseUrl = 'http://localhost:8000';

  Future<List<ArticleUser>> fetchArticleUsers() async {
    final response = await http.get(Uri.parse('$_baseUrl/getAllArticles'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(
          utf8.decode(response.bodyBytes)); // Decodificar utilizando UTF-8
      return jsonResponse.map((item) => ArticleUser.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ArticleUser>> fetchArticleUsersByWeek() async {
    final response =
        await http.get(Uri.parse('$_baseUrl/getAllArticlesByWeek'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      print(jsonResponse);
      return jsonResponse.map((item) => ArticleUser.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ArticleUser>> fetchArticlesByOneUser(String idUser) async {
    print(idUser);
    final response =
        await http.get(Uri.parse('$_baseUrl/getAllArticlesOneUser/$idUser'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      print(response.body);
      return jsonResponse.map((item) => ArticleUser.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<String> createArticle(
      String title, String description, String userId, String tags) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/newArticle'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'title': title,
        'description': description,
        'user_id': userId,
        'tags': tags
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create article');
    }
  }

  Future<String> addArticleToCategory(
      String articleId, String categoryName) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/addArticleToCategory'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'article_id': articleId,
        'category_name': categoryName,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      return responseBody['message'] as String;
    } else {
      throw Exception(': No se pudo realizar la operación');
    }
  }
}
