import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_schulung/domain/entities/advice.dart';
import 'package:flutter_schulung/domain/failures/failure.dart';
import 'package:flutter_schulung/domain/use_cases/advice_use_case.dart';
import 'package:flutter_schulung/presentation/pages/advice/cubit/advice_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import 'advice_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceUseCase>()])
void main() {
  group('AdviceCubit', () {
    group('should emit', () {
      late MockAdviceUseCase mockUseCase;

      setUp(() {
        mockUseCase = MockAdviceUseCase();
        provideDummy<Result<Advice, Failure>>(
          Success(
            Advice(advice: 'dummy', id: 0),
          ),
        );
      });

      blocTest(
        '[AdviceLoadingState, AdviceLoadedState] if getAdvice() is called',
        setUp: () {
          when(mockUseCase.get(id: anyNamed('id'))).thenAnswer(
            (realInvocation) async => Success(
              Advice(advice: 'text', id: 4),
            ),
          );
        },
        build: () => AdviceCubit(useCase: mockUseCase),
        act: (bloc) => bloc.getAdvice(id: '4'),
        expect: () => <AdviceState>[
          AdviceLoadingState(),
          AdviceLoadedState(text: 'text'),
        ],
        verify: (bloc) => expect(bloc.state is AdviceEmptyState, true),
      );

      blocTest(
        '[AdviceEmptyState] if nothing is called',
        build: () => AdviceCubit(useCase: mockUseCase),
        verify: (bloc) => expect(bloc.state is AdviceEmptyState, true),
      );
    });
    // Aufgabe: AdviceErrorState testen
  });
}
