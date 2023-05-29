import 'dart:convert';
import 'package:http/http.dart' as http;

class CommentService {
  final String _baseUrl = 'http://localhost:8000';

  Future<void> addComment(
      String articleId, String email, String description) async {
    final url = Uri.parse('$_baseUrl/addComment/$articleId/$email');

    final commentData = {
      'description': description,
    };

    final response = await http.post(
      url,
      body: jsonEncode(commentData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Comentario añadido');
    } else {
      // Error al agregar el comentario
      print('Error al agregar el comentario: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> getComments(String articleId) async {
    final url = Uri.parse('$_baseUrl/comments/$articleId');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> comments = jsonDecode(response.body);
      return comments;
    } else {
      // Error al obtener los comentarios
      print('Error al obtener los comentarios: ${response.statusCode}');
      return [];
    }
  }
}
