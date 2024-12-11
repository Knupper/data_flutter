import 'package:flutter_schulung/data/repositories/advice_repo_impl.dart';
import 'package:flutter_schulung/domain/entities/advice.dart';
import 'package:flutter_schulung/domain/failures/failure.dart';
import 'package:flutter_schulung/domain/use_cases/advice_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import 'advice_use_case_test.mocks.dart';

// class AdviceRepoMock extends Mock implements AdviceRepoImpl {}

@GenerateNiceMocks([MockSpec<AdviceRepoImpl>()])
void main() {
  group('AdviceUseCase', () {
    test('should return Advice', () async {
      provideDummy<Result<Advice, Failure>>(
        Success(
          Advice(advice: 'dummy', id: 0),
        ),
      );

      final mockRepo = MockAdviceRepoImpl();
      final useCaseUnderTest = AdviceUseCase(repository: mockRepo);

      when(mockRepo.getAdvice(id: anyNamed('id'))).thenAnswer(
        (_) => Future.value(
          Success<Advice, Failure>(
            Advice(id: 3, advice: 'advice3'),
          ),
        ),
      );
      final result = await useCaseUnderTest.get();

      expect(result.isSuccess(), true);
      expect(result, Success(Advice(advice: 'advice3', id: 3)));
    });
  });
}
