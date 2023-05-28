import 'package:flutter/material.dart';
import 'package:parcial_3/navpages/profileScreen.dart';
import '../models/article.dart';
import '../models/user.dart';
import '../models/comment.dart';

import 'configurationScreen.dart';
import 'homeScreen.dart';
import 'new_article.dart';

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
    comments: []);

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Definir las pantallas como miembros de la clase
  final HomeScreen _homeScreen = HomeScreen();
  final NewArticleScreen _newArticleScreen = NewArticleScreen();
  final ProfileScreen _profileScreen = ProfileScreen(
    articles: [article, article2],
    user: user,
  );
  final ConfigurationScreen _configurationScreen = ConfigurationScreen();

  @override
  Widget build(BuildContext context) {
    Widget _currentScreen = _homeScreen; // Valor inicial
    switch (_selectedIndex) {
      case 0:
        _currentScreen = _homeScreen;
        break;
      case 1:
        _currentScreen = _newArticleScreen;
        break;
      case 2:
        _currentScreen = _profileScreen;
        break;
      case 3:
        _currentScreen = _configurationScreen;
        break;
    }

    return Scaffold(
      body: _currentScreen,
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: DefaultTextStyle(
            style: TextStyle(fontFamily: 'Raleway'),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
              unselectedItemColor: const Color.fromARGB(255, 136, 136, 136),
              currentIndex: _selectedIndex,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: 'Home',
                  backgroundColor: const Color.fromARGB(255, 149, 210, 238),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'New Article',
                  backgroundColor: const Color.fromARGB(255, 149, 210, 238),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Your Perfil',
                  backgroundColor: const Color.fromARGB(255, 149, 210, 238),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                  backgroundColor: const Color.fromARGB(255, 149, 210, 238),
                ),
              ],
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
