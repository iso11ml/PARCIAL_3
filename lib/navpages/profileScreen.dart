import 'package:flutter/material.dart';
import 'package:parcial_3/models/user.dart';
import 'package:parcial_3/models/article.dart';
import '../utils/format_text.dart';
import '../utils/widget_artilcles_all.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  final List<Article> articles;

  ProfileScreen({
    required this.user,
    required this.articles,
  });

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
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
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.user.profileImageUrl ?? ''),
                      ),
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
                    title: Text(
                      widget.user.name,
                      style: TextStyles.titleStyleCard,
                    ),
                    subtitle: Text(
                        'Artículos publicados: ${widget.articles.length}',
                        style: TextStyles.subtitleStyleCard),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true, // para evitar errores de renderizado
              physics:
                  NeverScrollableScrollPhysics(), // para evitar errores de scroll anidado
              itemCount: widget.articles.length,
              itemBuilder: (context, index) {
                return CardArticlesLarge(
                  article: widget.articles[index],
                  user: widget.user,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
