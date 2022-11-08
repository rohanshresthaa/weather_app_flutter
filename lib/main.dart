import 'package:flutter/material.dart';
import 'package:weather_app/screens/Loading.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Color(0xFF15B9F1),
          foregroundColor: Color(0xFFDFE5E3),
        ),
      ),
      home: LoadingScreen(),
    ),
  );
}
