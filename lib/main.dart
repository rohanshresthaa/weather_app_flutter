import 'package:flutter/material.dart';
import 'package:weather_app/screens/Loading.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF24142c),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Color(0xFF24142c),
          foregroundColor: Color(0xFFE3F4FE),
        ),
      ),
      home: const LoadingScreen(),
    ),
  );
}
