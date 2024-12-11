import 'package:flutter_schulung/data/data_sources/advice_remote_data_source.dart';
import 'package:flutter_schulung/data/dtos/advice_dto.dart';
import 'package:flutter_schulung/data/repositories/advice_repo_impl.dart';
import 'package:flutter_schulung/domain/entities/advice.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import 'advice_repo_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRemoteDataSource>()])
void main() {
  group('AdviceRepoImpl', () {
    group('should return Advice', () {
      test('if dataSource returns an valid AdviceDto', () async {
        final mockDataSource = MockAdviceRemoteDataSource();
        final repoUnderTest = AdviceRepoImpl(dataSource: mockDataSource);

        when(mockDataSource.getAdvice()).thenAnswer(
          (realInvocation) => Future.value(
            AdviceDto(id: 2, advice: 'advice2'),
          ),
        );
        final result = await repoUnderTest.getAdvice();

        expect(result.isSuccess(), true);
        expect(result, Success(Advice(advice: 'advice2', id: 2)));
        verify(mockDataSource.getAdvice()).called(1);
        verifyNoMoreInteractions(mockDataSource);
      });
    });

    // Aufgabe: Schreibe Tests für den error case
  });
}
