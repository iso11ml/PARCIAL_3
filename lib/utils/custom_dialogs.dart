import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parcial_3/navpages/mainScreen.dart';
import '../models/user.dart';
import '../services/user_service.dart';
import 'format_text.dart';

UserService userService = UserService();

class MyCustomDialogs {
  static void _showDialogOld(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width *
                .5, // Aquí se ajusta el ancho de la ventana emergente
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: _isLoading,
                      builder: (context, isLoading, child) {
                        return isLoading
                            ? Lottie.network(
                                'https://assets5.lottiefiles.com/packages/lf20_p8bfn5to.json',
                                width: 50,
                                height: 50,
                              )
                            : SizedBox
                                .shrink(); // Add a default widget when isLoading is false
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text("Back"),
              onPressed: () {
                _closeDialog(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(120, 40),
                textStyle: TextStyles.buttonStyle,
                primary: Colors.yellow,
                onPrimary: Colors.black87,
                elevation: 15,
                shadowColor: Colors.yellow,
                // side: BorderSide(color: Colors.black87, width: 2)
              ),
            ),
            ElevatedButton(
              child: Text("Continue"),
              onPressed: () async {
                String email = _emailController.text;
                String password = _passwordController.text;
                if (email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Exception: No se puede registrar al usuario, campos vacíos.'),
                    ),
                  );
                } else {
                  _isLoading.value = true;
                  try {
                    await Future.delayed(const Duration(seconds: 2));
                    User user = await userService.getUser(email, password);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MainScreen(userInformation: user),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  } finally {
                    _isLoading.value = false;
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(120, 40),
                textStyle: TextStyles.buttonStyle,
                primary: Colors.yellow,
                onPrimary: Colors.black87,
                elevation: 15,
                shadowColor: Colors.yellow,
                // side: BorderSide(color: Colors.black87, width: 2)
              ),
            )
          ],
        );
      },
    );
  }

  static void _showDialogNew(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width *
                .5, // Aquí se ajusta el ancho de la ventana emergente
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Create New Account',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: _isLoading,
                      builder: (context, isLoading, child) {
                        return isLoading
                            ? Lottie.network(
                                'https://assets5.lottiefiles.com/packages/lf20_p8bfn5to.json',
                                width: 50,
                                height: 50,
                              )
                            : SizedBox
                                .shrink(); // Add a default widget when isLoading is false
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text("Back"),
              onPressed: () {
                _closeDialog(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(120, 40),
                textStyle: TextStyles.buttonStyle,
                primary: Colors.yellow,
                onPrimary: Colors.black87,
                elevation: 15,
                shadowColor: Colors.yellow,
                // side: BorderSide(color: Colors.black87, width: 2)
              ),
            ),
            ElevatedButton(
              child: Text("Continue"),
              onPressed: () async {
                String username = _nameController.text;
                String email = _emailController.text;
                String password = _passwordController.text;

                if (username.isEmpty || email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Exception: No se puede registrar al usuario, campos vacíos.'),
                    ),
                  );
                } else {
                  _isLoading.value = true;
                  try {
                    await Future.delayed(const Duration(seconds: 2));
                    User user =
                        await userService.createUser(username, email, password);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => HomePage(user: user),
                    //   ),
                    // );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  } finally {
                    _isLoading.value = false;
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(120, 40),
                textStyle: TextStyles.buttonStyle,
                primary: Colors.yellow,
                onPrimary: Colors.black87,
                elevation: 15,
                shadowColor: Colors.yellow,
                // side: BorderSide(color: Colors.black87, width: 2)
              ),
            )
          ],
        );
      },
    );
  }

  static void _closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Widget generalButton(
      BuildContext context, IconData icon, String text, String wichUse) {
    return Card(
      elevation: 5,
      child: InkWell(
        hoverColor: Colors.grey,
        splashColor: Colors.grey,
        onTap: () {
          if (wichUse == '1') {
            _showDialogNew(context);
          } else {
            _showDialogOld(context);
          }
        },
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 60,
          width: 180,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon),
                const SizedBox(width: 15),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
