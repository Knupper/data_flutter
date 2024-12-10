import 'package:flutter/material.dart';

// Aufgabe 2:
// Unten stehende Karteikarte nachbauen, Bild kann durch Placeholder ersetzt werden
// https://img.freepik.com/vektoren-premium/farbige-profilkarte-mit-einem-benutzer-symbol-und-einzelheiten_1294240-68100.jpg?w=1800
class PersonCard extends StatelessWidget {
  const PersonCard({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    print('$id build');

    return Container(
      width: 600,
      height: 400,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Row(
              children: [
                const Placeholder(
                  fallbackWidth: 200,
                  color: Colors.amber,
                ),
                const SizedBox.square(
                  dimension: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$id - HEADLINE' * 19,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Expanded(
                        child: Text('Fließtext'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              alignment: Alignment.topCenter,
              child: Text('Lorem Ipsum' * 12),
            ),
          ),
        ],
      ),
    );
  }
}
