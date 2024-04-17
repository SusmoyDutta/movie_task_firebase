import 'package:flutter/material.dart';

AppBar buttonAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.grey.shade200,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 25,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3
          ..color = Colors.black38,
      ),
    ),
  );
}
