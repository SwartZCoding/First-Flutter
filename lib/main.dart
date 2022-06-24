import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'RandomWords.dart';

void main() {
  runApp(const StartupNameGenerator());
}

class StartupNameGenerator extends StatelessWidget {

  const StartupNameGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator', // Name on the header
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const RandomWords(), // Name of home widget
    );
  }
}