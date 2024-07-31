import 'package:flutter/material.dart';

const List<String> fontStyle = ["Option1", "Option2", "Option3"];
const List<int> fontSize = [12, 14, 16, 18, 20];
const List<String> fontColor = ["White", "Blue", "Red", "Orange"];

Color getColorFromName(String colorName) {
  switch (colorName) {
    case "White":
      return Colors.white;
    case "Blue":
      return Colors.blue;
    case "Red":
      return Colors.red;
    case "Orange":
      return Colors.orange;
    default:
      return Colors.black;
  }
}