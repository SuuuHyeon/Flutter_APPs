import 'package:d_day_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Sunflower', // 기본 글씨체
        textTheme: TextTheme(    // 글짜 테마 적용 클래스
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 80,
            fontWeight: FontWeight.w700,
            fontFamily: 'parisienne',
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      home: const HomeScreen(),
    ),
  );
}
