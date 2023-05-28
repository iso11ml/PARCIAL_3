import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parcial_3/navpages/profileScreen.dart';
import 'configurationScreen.dart';
import 'homeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> pages = [HomeScreen(), ProfileScreen(), ConfigurationScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
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
                  icon: Icon(Icons.person),
                  label: 'Your Perfil',
                  backgroundColor: Colors.lightGreen[200],
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                  backgroundColor: Colors.yellow[200],
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
