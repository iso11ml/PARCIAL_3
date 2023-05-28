import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../utils/custom_dialogs.dart';
import '../utils/format_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 400,
                width: 400,
                // color: Colors.blue, // Agrega el color deseado aquí
                child: Lottie.network(
                  'https://assets6.lottiefiles.com/packages/lf20_kcxosgub.json', // Reemplaza la URL con la dirección de tu animación Lottie
                  width: 300,
                  height: 300,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Medium',
                style: TextStyles.titleStyle,
              ),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  'Nuestra plataforma te permite publicar cualquier artículo sobre cualquier tema.',
                  style: TextStyles.subtitleStyle.copyWith(height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCustomDialogs.generalButton(
                      context, Icons.person, 'Create Account', '1'),
                  const SizedBox(width: 20),
                  MyCustomDialogs.generalButton(
                      context, Icons.person, 'Sign In', '2')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
