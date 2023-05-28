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
      print(jsonResponse); // Decodificar utilizando UTF-8
      return jsonResponse.map((item) => ArticleUser.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ArticleUser>> fetchArticlesByOneUser(String idUser) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/getAllArticlesOneUser/$idUser'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((item) => ArticleUser.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
