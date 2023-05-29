import 'package:flutter/material.dart';
import 'package:parcial_3/navpages/profileScreen.dart';
import '../models/user.dart';
import 'configurationScreen.dart';
import 'homeScreen.dart';
import 'new_article.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.userInformation}) : super(key: key);
  final User userInformation;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late HomeScreen _homeScreen;
  late NewArticleScreen _newArticleScreen;
  late ProfileScreen _profileScreen;
  late ConfigurationScreen _configurationScreen;
  @override
  void initState() {
    super.initState();

    _homeScreen = HomeScreen(userInformation: widget.userInformation);
    _newArticleScreen =
        NewArticleScreen(userInformation: widget.userInformation);
    _profileScreen = ProfileScreen(userInformation: widget.userInformation);
    _configurationScreen =
        ConfigurationScreen(userInformation: widget.userInformation);
  }

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
