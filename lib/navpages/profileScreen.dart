import 'package:flutter/material.dart';
import 'package:parcial_3/models/user.dart';
import '../models/article_user.dart';
import '../services/article.dart';
import '../utils/widget_articles_personal.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
    required this.userInformation,
  }) : super(key: key);
  final User userInformation;

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  final ArticleService _articleService = ArticleService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 143, 150, 155),
        title: Text('Your Perfile'),
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
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //   fit: BoxFit.cover,
                      //   image: NetworkImage(widget.user.profileImageUrl ?? ''),
                      // ),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: Colors.white,
                        width: 4.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: ListTile(
                      // title: Text(
                      //   widget.user.name,
                      //   style: TextStyles.titleStyleCard,
                      // ),
                      // subtitle: Text(
                      //     'Artículos publicados: ${widget.articles.length}',
                      //     style: TextStyles.subtitleStyleCard),
                      ),
                ),
              ],
            ),
            SizedBox(height: 20),
            FutureBuilder<List<ArticleUser>>(
              future: _articleService.fetchArticlesByOneUser(widget
                  .userInformation
                  .idObject), // asumir que userInformation tiene un campo id
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Muestra un indicador de carga mientras los datos se están cargando
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Muestra un mensaje de error si algo sale mal
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Los datos están disponibles, muéstralos en los widgets CardArticlesPersonal
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return CardArticlesPersonal(
                        article: snapshot.data![index].article,
                        user: snapshot.data![index].user,
                      );
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
