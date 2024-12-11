import 'package:flutter_schulung/data/data_sources/advice_remote_data_source.dart';
import 'package:flutter_schulung/data/dtos/advice_dto.dart';
import 'package:flutter_schulung/data/exceptions/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group('AdviceRemoteDataSource', () {
    group('should return AdviceDto', () {
      test('if client response is 200 and has valid data', () async {
        final mockClient = MockClient();
        final dataSourceUnderTest = AdviceRestDataSource(client: mockClient);
        final responseBody = '{"advice": "test advice", "advice_id": 1}';

        when(
          mockClient.get(
            Uri.parse('https://api.flutter-community.com/api/v1/advice/'),
            headers: {
              'accept': 'application/json',
            },
          ),
        ).thenAnswer(
          (_) => Future.value(Response(responseBody, 200)),
        );

        final result = await dataSourceUnderTest.getAdvice();

        expect(result, AdviceDto(id: 1, advice: 'test advice'));
      });
    });

    group('should throw', () {
      // Aufgabe: schreibe einen Test, der prüft, dass ein Fehler bei einem invaliden JSON geworfen wird
      test('ServerException if client response is 403', () async {
        final mockClient = MockClient();
        final dataSourceUnderTest = AdviceRestDataSource(client: mockClient);
        final responseBody = '{"advice": "test advice", "advice_id": 1}';

        when(
          mockClient.get(
            any,
            headers: anyNamed('headers'),
          ),
        ).thenAnswer(
          (_) => Future.value(Response(responseBody, 403)),
        );

        expect(() => dataSourceUnderTest.getAdvice(), throwsA(isA<ServerException>()));
      });
    });
  });
}
