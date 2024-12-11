import 'package:flutter/material.dart';
import 'package:flutter_schulung/presentation/pages/advice/widgets/advice_empty.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdviceEmpty - Golden Test', () {
    testWidgets('exampel golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
          home: AdviceEmpty(),
        ),
      );

      await expectLater(
        find.byType(AdviceEmpty),
        matchesGoldenFile('advice_empty.png'),
      );
    });
  });
}
