import 'package:flutter/widgets.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  _ConfigurationScreen createState() => _ConfigurationScreen();
}

class _ConfigurationScreen extends State<ConfigurationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text('Configuration Page')));
  }
}
