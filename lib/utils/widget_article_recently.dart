import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/article.dart';
import '../models/user.dart';
import 'format_text.dart';

class CardArticlesShort extends StatelessWidget {
  final Article article;
  final User user;
  final String category;

  const CardArticlesShort({
    required this.article,
    required this.user,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Aquí colocas lo que quieres que haga al ser presionado.
        print('Card pressed');
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 220,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  Text('Author: ${user.name}',
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
