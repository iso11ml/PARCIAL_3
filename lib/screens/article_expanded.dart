import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/article.dart';
import '../models/user.dart';
import '../services/comment_service.dart';
import '../utils/format_text.dart';
import 'package:http/http.dart' as http;

class ArticleDetailScreen extends StatefulWidget {
  final Article article;
  final User user;
  final String category;

  const ArticleDetailScreen({
    required this.article,
    required this.user,
    required this.category,
  });

  @override
  _ArticleDetailScreenState createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  final _commentController = TextEditingController();

  final ValueNotifier<bool> _isArticleLiked = ValueNotifier<bool>(false);
  List<dynamic> _comments = [];

  @override
  void initState() {
    super.initState();
    _isArticleLiked.value =
        isArticleLikedByCurrentUser(widget.article, widget.user.idObject);
    fetchComments(); // Cargar los comentarios al ingresar a la pantalla
  }

  bool isArticleLikedByCurrentUser(Article article, String currentUserId) {
    return article.likesUserId.contains(currentUserId);
  }

  Future<void> fetchComments() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:8000/comments/${widget.article.idObject}'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> comments = jsonDecode(response.body);
        setState(() {
          _comments = comments;
        });
      } else {
        print('Error al obtener los comentarios: ${response.statusCode}');
      }
    } catch (error) {
      print('Error al obtener los comentarios: $error');
    }
  }

  Future<bool> likeArticle(String articleId, String userId) async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/likeArticle/$articleId/$userId'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['likeStatus'] == 1;
    } else {
      throw Exception('Error al actualizar el like');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 143, 150, 155),
        title: Text('Article Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: <Widget>[
            Text(
              widget.article.title,
              style: TextStyles.titleStyleCard,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Author: ${widget.user.name}",
                  style: TextStyles.titleStyleCard,
                ),
                Text(
                  'Category: ${widget.category}',
                  style: TextStyles.subtitleStyleCard,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(height: 15),
            Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.article.description,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Comentarios",
              style: TextStyles.titleStyleCard,
            ),
            SizedBox(height: 15),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _comments.isEmpty
                      ? Text(
                          'Aún no hay comentarios',
                          style: TextStyles.textStyleWarning,
                        )
                      : Column(
                          children: _comments
                              .map((comment) => Text(
                                    comment['description'],
                                    style: TextStyle(fontSize: 14),
                                  ))
                              .toList(),
                        ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: _isArticleLiked,
                  builder: (BuildContext context, bool isLiked, Widget? child) {
                    return IconButton(
                      icon: Icon(
                        isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                        color: isLiked ? Colors.blue : Colors.black,
                      ),
                      onPressed: () async {
                        bool newLikeStatus = await likeArticle(
                            widget.article.idObject, widget.user.idObject);
                        if (newLikeStatus != isLiked) {
                          _isArticleLiked.value = newLikeStatus;
                        }
                      },
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add_comment),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('New Comment'),
                          content: TextField(
                            controller: _commentController,
                            decoration: InputDecoration(
                              hintText: 'Ingrese su comentario',
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: Text('Publicar'),
                              onPressed: () async {
                                String commentText = _commentController.text;

                                if (commentText.isEmpty) {
                                  print("El comentario no puede estar vacío.");
                                  return;
                                }

                                CommentService commentService =
                                    CommentService();
                                await commentService.addComment(
                                  widget.article.idObject,
                                  widget.user.email,
                                  commentText,
                                );

                                _commentController.clear();
                                Navigator.of(context).pop();
                                await fetchComments();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
