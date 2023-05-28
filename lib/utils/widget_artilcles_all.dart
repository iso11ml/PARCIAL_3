import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/article.dart';
import '../models/user.dart';
import 'format_text.dart';

class CardArticlesLarge extends StatelessWidget {
  final Article article;
  final User user;

  const CardArticlesLarge({
    required this.article,
    required this.user,
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
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    // Un Row dentro de otro Row para colocar el CircleAvatar junto al nombre del autor
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: (user.profileImageUrl != null &&
                                user.profileImageUrl.isNotEmpty)
                            ? NetworkImage(user.profileImageUrl)
                                as ImageProvider<Object>?
                            : AssetImage('assets/images/DEFAULT_IMAGES.png')
                                as ImageProvider<Object>?,
                        backgroundColor: Colors.transparent,
                      ),

                      SizedBox(
                          width:
                              8), // Para dar un poco de espacio entre la imagen y el nombre
                      Text('Author: ${user.name}',
                          style: TextStyles.autorStyleCard),
                    ],
                  ),
                  Text(
                    article.idObject,
                    style: TextStyles.titleStyleCard,
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
                "Este es una breve descripción para corroborar como funciona el widget para más inforamción presiona el Card y veamos que pasa",
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
