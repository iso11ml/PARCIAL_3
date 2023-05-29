import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/article_user.dart';
import '../models/user.dart';
import '../services/article.dart';
import '../utils/button_filter.dart';
import '../utils/format_text.dart';
import '../utils/widget_article_recently.dart';
import '../utils/widget_artilcles_all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.userInformation,
  }) : super(key: key);
  final User userInformation;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ArticleService _articleService = ArticleService();
  late Future<List<ArticleUser>> _articleUsersFuture;
  late Future<List<ArticleUser>> _articleUsersFutureByWeek;

  @override
  void initState() {
    super.initState();
    _articleUsersFuture = _articleService.fetchArticleUsers();
    _articleUsersFutureByWeek = _articleService.fetchArticleUsersByWeek();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 143, 150, 155),
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
                    top: 40,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: FutureBuilder<List<ArticleUser>>(
                      future: _articleUsersFutureByWeek,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final articleUsers = snapshot.data!;
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: articleUsers.length,
                            itemBuilder: (context, index) {
                              final articleUser = articleUsers[index];
                              return CardArticlesShort(
                                article: articleUser.article,
                                user: articleUser.user,
                                category: articleUser.category,
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        return Lottie.network(
                            'https://assets5.lottiefiles.com/private_files/lf30_fup2uejx.json');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 85,
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
                    top: 40,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          FilterButton(
                            label: "Autor",
                            onPressed: () {
                              // Acción cuando se presiona el botón "Todos"
                            },
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          FilterButton(
                            label: "Categoría",
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
                    top: 40,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: FutureBuilder<List<ArticleUser>>(
                      future: _articleUsersFuture,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final articleUsers = snapshot.data!;
                          return ListView.builder(
                            itemCount: articleUsers.length,
                            itemBuilder: (context, index) {
                              final articleUser = articleUsers[index];
                              return CardArticlesLarge(
                                article: articleUser.article,
                                user: articleUser.user,
                                category: articleUser.category,
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        return Lottie.network(
                            'https://assets5.lottiefiles.com/private_files/lf30_fup2uejx.json');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
