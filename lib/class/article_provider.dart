import 'package:flutter/foundation.dart';

import '../models/pre_article.dart';

class ArticleProvider extends ChangeNotifier {
  PreArticle _article = PreArticle(
    title: '',
    content: '',
    tags: '',
    category: '',
  );

  PreArticle get article => _article;

  set article(PreArticle article) {
    _article = article;
    notifyListeners();
  }
}
