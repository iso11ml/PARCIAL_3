import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../utils/format_text.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({Key? key, required this.userInformation})
      : super(key: key);
  final User userInformation;

  @override
  _ConfigurationScreen createState() => _ConfigurationScreen();
}

class _ConfigurationScreen extends State<ConfigurationScreen> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 143, 150, 155),
        title: Text('Settings'),
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Change Name',
                labelStyle: TextStyles.titleStyleCard,
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey[100]!),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Change Password',
                labelStyle: TextStyles.titleStyleCard,
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey[100]!),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              child: Text("Save"),
              onPressed: () {
                String newName = _nameController.text;
                String newPassword = _passwordController.text;

                // Perform the necessary actions to save the changes
                // such as updating the user's name and password.

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Changes saved successfully.'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(120, 40),
                textStyle: TextStyles.buttonStyle,
                primary: Colors.yellow,
                onPrimary: Colors.black87,
                elevation: 15,
                shadowColor: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
