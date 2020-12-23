import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final String characterName;
  final String characterImageLink;

  CharacterCard(this.characterName, this.characterImageLink);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.loose,
            flex: 2,
            child: Image.network(characterImageLink),
          ),
          Text(characterName),
        ],
      ),
    );
  }
}
