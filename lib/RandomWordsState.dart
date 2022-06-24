import 'package:english_words/english_words.dart';
import 'package:first_project/RandomWords.dart';
import 'package:flutter/material.dart';

class RandomWordsState extends State<RandomWords> {

  final suggestions = <WordPair>[];
  final saved = <WordPair>{};
  static const biggerFont = TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(
      title: const Text('Startup Name Generator'),
      actions: [
        IconButton(
          icon: const Icon(Icons.list),
          onPressed: pushSaved,
          tooltip: 'Saved Suggestions',
        ),
      ],
    ),

    body: ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= suggestions.length) {
          suggestions.addAll(generateWordPairs().take(10));
        }

        final alreadySaved = saved.contains(suggestions[index]); // boolean to check after if specific word is on the Set.

        return ListTile(
          title: Text(
            suggestions[index].asString,
            style: biggerFont,
          ),
          trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border, // Ternary condition to change icon
            color: alreadySaved ? Colors.red : null, // Ternary condition to change color
            semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
          ),
          onTap: () {
            setState(() {
              if (alreadySaved) {
                saved.remove(suggestions[index]); // If word is already on set, he is remove of set.
              } else {
                saved.add(suggestions[index]); // If word is not on set, he is add.
              }
            });
          },
        );
      },
    ),
    );
  }

  void pushSaved() {
    Navigator.of(context).push(
      // Add lines from here of liked words.
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = saved.map(
                (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ), // ...to here.
    );
  }
}