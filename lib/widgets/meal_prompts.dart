import 'package:flutter/material.dart';

class MealPrompts {
  static const String clickMealPrompt = 'Click your meal';
  static const String confirmMealPrompt = 'Will you eat this?';

  static TextStyle getPromptTextStyle(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double fontSize = screenWidth * 0.07; // Adjust the multiplier as needed

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      fontFamily: 'andika',
    );
  }
}
