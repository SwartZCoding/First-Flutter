import 'package:english_words/english_words.dart';
import 'package:first_project/RandomWords.dart';
import 'package:flutter/material.dart';

class RandomWordsState extends State<RandomWords> {

  @override
  Widget build(BuildContext context) {

    final suggestions = <WordPair>[];
    const biggerFont = TextStyle(fontSize: 18);

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= suggestions.length) {
          suggestions.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Text(
            suggestions[index].asString,
            style: biggerFont,
          ),
        );
      },
    );
  }
}