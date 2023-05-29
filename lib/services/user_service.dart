import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class UserService {
  final String _baseUrl = 'http://34.168.92.0:8000';

  Future<User> createUser(
      String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/newUser'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        'name': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      Map<String, dynamic> errorDetails =
          jsonDecode(utf8.decode(response.bodyBytes));
      String errorMessage = errorDetails["detail"];
      throw Exception(errorMessage);
    }
  }

  Future<User> getUser(String email, String password) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/getUser/$email/$password'));
    if (response.statusCode == 200) {
      final json = jsonDecode(utf8.decode(response.bodyBytes));
      final user = User.fromJson(json);
      print(user.idObject); // --> Ya lo revise
      return user;
    } else {
      Map<String, dynamic> errorDetails =
          jsonDecode(utf8.decode(response.bodyBytes));
      String errorMessage = errorDetails["detail"];
      throw Exception(errorMessage);
    }
  }
}
