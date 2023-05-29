import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/article.dart';
import '../models/user.dart';
import '../screens/article_expanded.dart';
import 'format_text.dart';

class CardArticlesPersonal extends StatelessWidget {
  final Article article;
  final User user;
  final String category;

  const CardArticlesPersonal({
    required this.article,
    required this.user,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailScreen(
              article: article,
              user: user,
              category: category,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(category, style: TextStyles.titleStyleCard),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Lógica para eliminar el artículo
                    },
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                article.title,
                style: TextStyles.titleStyleCard,
              ),
              SizedBox(height: 8),
              Text(
                article.description,
                style: TextStyles.subtitleStyleCard,
                softWrap: true,
                maxLines: 4, // ajusta este número según tus necesidades
                overflow: TextOverflow
                    .ellipsis, // si el texto excede las líneas, agrega puntos suspensivos al final
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Fecha: ${article.date}',
                      style: TextStyles.autorStyleCard),
                  Text(
                      'Likes: ${article.likesUserId.length}', // Mostrando la cantidad de 'likes'
                      style: TextStyles.autorStyleCard),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
