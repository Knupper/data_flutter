import 'dart:convert';
import 'dart:math';

import 'package:flutter_schulung/data/dtos/advice_dto.dart';
import 'package:flutter_schulung/data/exceptions/exceptions.dart';
import 'package:http/http.dart';

abstract class AdviceRemoteDataSource {
  Future<AdviceDto> getAdvice({String id = ''});
}

class AdviceRestDataSource extends AdviceRemoteDataSource {
  AdviceRestDataSource({required this.client});

  final Client client;

  @override
  Future<AdviceDto> getAdvice({String id = ''}) async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice/$id'),
      headers: {
        'accept': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceDto.fromJson(responseBody);
    }
  }
}

class AdviceMockDataSource extends AdviceRemoteDataSource {
  AdviceMockDataSource();

  final List<AdviceDto> _mockData = [
    AdviceDto(id: 1, advice: 'Hallo Welt'),
    AdviceDto(id: 2, advice: 'Hallo World'),
    AdviceDto(id: 3, advice: 'Hallo Baum'),
    AdviceDto(id: 4, advice: 'Hallo Sonne'),
    AdviceDto(id: 5, advice: 'Hallo Mond'),
  ];

  @override
  Future<AdviceDto> getAdvice({String id = ''}) async {
    final randomId = Random().nextInt(5);

    return _mockData[randomId];
  }
}
