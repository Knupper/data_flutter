import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_schulung/presentation/pages/advice/advice_page.dart';
import 'package:flutter_schulung/presentation/pages/advice/cubit/advice_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAdviceCubit extends MockCubit<AdviceState> implements AdviceCubit {}

void main() {
  group('AdvicePage', () {
    late MockAdviceCubit mockCubit;

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: BlocProvider<AdviceCubit>(
          create: (context) => mockCubit,
          child: AdvicePage(),
        ),
      );
    }

    setUp(() {
      mockCubit = MockAdviceCubit();
    });

    testWidgets('should show loading state', (tester) async {
      whenListen(
        mockCubit,
        Stream.fromIterable(
          [
            AdviceLoadingState(),
          ],
        ),
        initialState: AdviceLoadingState(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should show error state', (tester) async {
      whenListen(
        mockCubit,
        Stream.fromIterable(
          [
            AdviceErrorState(),
          ],
        ),
        initialState: AdviceErrorState(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('ERROR'), findsOneWidget);
    });

    testWidgets('should show empty state', (tester) async {
      whenListen(
        mockCubit,
        Stream.fromIterable(
          [
            AdviceEmptyState(),
          ],
        ),
        initialState: AdviceEmptyState(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.textContaining('Daten'), findsOneWidget);
      // expect(find.byType(AdviceEmpty), findsOneWidget);
    });

    testWidgets('should show loaded state', (tester) async {
      whenListen(
        mockCubit,
        Stream.fromIterable(
          [
            AdviceLoadedState(text: 'loaded'),
          ],
        ),
        initialState: AdviceLoadedState(text: 'loaded'),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byKey(Key('LOADED')), findsOneWidget);
    });

    testWidgets('should handle random button correctly', (tester) async {
      when(() => mockCubit.getAdvice(id: '')).thenAnswer((_) async {});

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final button = find.byKey(Key('random'));

      await tester.tap(button);

      verify(() => mockCubit.getAdvice(id: '')).called(1);
    });

    testWidgets(
      'should handle 42 button correctly',
      (tester) async {
        // Aufgabe: diesen test implementieren
      },
      skip: true,
    );
  });
}
