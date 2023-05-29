import 'package:flutter/material.dart';

abstract class TextStyles {
  // Estos son los textos del LoginPage
  static const TextStyle titleStyle = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Comfortaa');

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    fontFamily: 'Raleway',
    color: Colors.black,
  );

  static const TextStyle textStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Raleway',
    color: Colors.black,
  );

  static const TextStyle buttonStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Urbanist',
    color: Colors.black,
  );

  static const TextStyle titleStyleCard = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Comfortaa');

  static const TextStyle subtitleStyleCard = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    fontFamily: 'Raleway',
    color: Colors.black,
  );

  static const TextStyle autorStyleCard = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'Urbanist',
    color: Colors.black,
  );

  static const TextStyle titleStyleText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poiret_One',
    color: Colors.black,
  );

  static const TextStyle textStyleWarning = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Urbanist',
    color: Colors.black,
  );
}
