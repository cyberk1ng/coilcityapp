import 'package:flutter/material.dart';

Border buildCustomBorder() {
  return Border(
    top: BorderSide(
      color: Colors.teal,
      width: 5.0,
    ),
    bottom: BorderSide(
      color: Colors.teal,
      width: 5.0,
    ),
    left: BorderSide(
      color: Colors.teal,
      width: 1.0,
    ),
    right: BorderSide(
      color: Colors.teal,
      width: 1.0,
    ),
  );
}

const double inputBorderRadius = 10;
