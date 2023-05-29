import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:parcial_3/models/article.dart';
import 'package:parcial_3/models/user.dart';
import '../models/article_user.dart';
import '../services/article.dart';
import '../utils/format_text.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          (widget.userInformation.profileImageUrl != null &&
                                  widget.userInformation.profileImageUrl!
                                      .isNotEmpty)
                              ? NetworkImage(
                                      widget.userInformation.profileImageUrl!)
                                  as ImageProvider<Object>?
                              : AssetImage('assets/images/DEFAULT_IMAGES.png'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: ListTile(
                      title: Text(
                        "Autor: ${widget.userInformation.name}",
                        style: TextStyles.titleStyleCard,
                      ),
                      subtitle: Text(
                          'Tu correo: ${widget.userInformation.email}',
                          style: TextStyles.subtitleStyleCard),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Text(
                      "Tus artículos",
                      style: TextStyles.buttonStyle,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              FutureBuilder<List<ArticleUser>>(
                future: _articleService
                    .fetchArticlesByOneUser(widget.userInformation.idObject),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Los datos están disponibles, muéstralos en los widgets CardArticlesPersonal
                    if (snapshot.hasData && snapshot.data!.isEmpty) {
                      return Text(
                        'Aún no has publicado artículos',
                        style: TextStyles.textStyleWarning,
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return CardArticlesPersonal(
                            article: snapshot.data![index].article,
                            user: snapshot.data![index].user,
                            category: snapshot.data![index].category,
                          );
                        },
                      );
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
