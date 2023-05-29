import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/article.dart';
import '../models/user.dart';
import '../services/article.dart';
import '../utils/format_text.dart';
import 'package:http/http.dart' as http;
//

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
  final ValueNotifier<bool> _isArticleLiked = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _isArticleLiked.value =
        isArticleLikedByCurrentUser(widget.article, widget.user.idObject);
  }

  bool isArticleLikedByCurrentUser(Article article, String currentUserId) {
    return article.likesUserId.contains(currentUserId);
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
                  child: Text(
                    widget.article.description,
                    style: TextStyle(fontSize: 14),
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
                  onPressed: () {
                    // TODO: implement comment functionality
                  },
                  icon: Icon(Icons.comment),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
