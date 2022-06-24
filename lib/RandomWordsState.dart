import 'package:english_words/english_words.dart';
import 'package:first_project/RandomWords.dart';
import 'package:flutter/cupertino.dart';

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random(); // Var to randomize word.
    return Text(wordPair.asString); // Random word parse as String.
  }
}