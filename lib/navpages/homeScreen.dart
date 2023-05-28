import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/article.dart';
import '../models/comment.dart';
import '../models/user.dart';
import '../utils/button_filter.dart';
import '../utils/format_text.dart';
import '../utils/widget_article_recently.dart';
import '../utils/widget_artilcles_all.dart';

User user = User(
    idObject: "1",
    name: "John Doe",
    email: "johndoe@example.com",
    password: "password",
    profileImageUrl:
        'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/1966.png&w=350&h=254');
Comment comment = Comment(
    userId: "1",
    description: "This is a comment",
    timestamp: DateTime.now().toIso8601String());
Article article = Article(
    idObject: "1",
    title: "Article title",
    description: "Article description",
    date: DateTime.now().toIso8601String(),
    userId: "1",
    likesUserId: [],
    comments: [comment]);

User user2 = User(
    idObject: "1",
    name: "John Doe",
    email: "johndoe@example.com",
    password: "password",
    profileImageUrl: '');
Comment comment2 = Comment(
    userId: "1",
    description: "This is a comment",
    timestamp: DateTime.now().toIso8601String());
Article article2 = Article(
    idObject: "1",
    title: "Article title",
    description: "Article description",
    date: DateTime.now().toIso8601String(),
    userId: "1",
    likesUserId: [],
    comments: [comment]);

User user3 = User(
    idObject: "1",
    name: "John Doe",
    email: "johndoe@example.com",
    password: "password",
    profileImageUrl:
        'https://forbes.cl/_next/image?url=https%3A%2F%2Fcdn.forbes.cl%2F2023%2F01%2FBillGates.jpg&w=1920&q=75');
Comment comment3 = Comment(
    userId: "1",
    description: "This is a comment",
    timestamp: DateTime.now().toIso8601String());
Article article3 = Article(
    idObject: "1",
    title: "Article title",
    description: "Article description",
    date: DateTime.now().toIso8601String(),
    userId: "1",
    likesUserId: [],
    comments: [comment]);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(
            255, 143, 150, 155), // Cambia el color de fondo de la AppBar a azul
        title: Text('Bienvenid@ Isaay'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Navigator.of(context).pop();
            },
            iconSize: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              // color: Colors.amber,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("New Articles This Week",
                          style: TextStyles.titleStyleText),
                    ),
                  ),
                  Positioned(
                    top: 40, // Ajusta esta posición según tus necesidades
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CardArticlesShort(article: article, user: user),
                        CardArticlesShort(article: article, user: user),
                        CardArticlesShort(article: article, user: user)
                
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 85,
              // color: const Color.fromARGB(255, 123, 255, 7),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child:
                          Text("Filter By", style: TextStyles.titleStyleText),
                    ),
                  ),
                  Positioned(
                    top: 40, // Ajusta esta posición según tus necesidades
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          FilterButton(
                            label: "Todos",
                            onPressed: () {
                              // Acción cuando se presiona el botón "Todos"
                            },
                          ),
                          SizedBox(
                              width:
                                  16), // Ajusta el espaciado entre botones según tus necesidades
                          FilterButton(
                            label: "Fecha Publición",
                            onPressed: () {
                              // Acción cuando se presiona el botón "Todos"
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              // color: Color.fromARGB(255, 255, 106, 245),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("Articles", style: TextStyles.titleStyleText),
                    ),
                  ),
                  Positioned(
                    top: 40, // Ajusta esta posición según tus necesidades
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        // scrollDirection: Axis.vertical,
                        children: [
                          CardArticlesLarge(article: article2, user: user2),
                          CardArticlesLarge(article: article, user: user),
                          CardArticlesLarge(article: article3, user: user3),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )

            // Resto de tus widgets en el Column
          ],
        ),
      ),
      // Resto de tu código...
    );
  }
}
