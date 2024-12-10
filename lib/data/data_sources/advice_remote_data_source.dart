import 'dart:convert';

import 'package:flutter_schulung/data/dtos/advice_dto.dart';
import 'package:flutter_schulung/data/exceptions/exceptions.dart';
import 'package:http/http.dart';

abstract class AdviceRemoteDataSource {
  Future<AdviceDto> getAdvice();
}

class AdviceRestDataSource extends AdviceRemoteDataSource {
  AdviceRestDataSource({required this.client});

  final Client client;

  @override
  Future<AdviceDto> getAdvice() async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
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
