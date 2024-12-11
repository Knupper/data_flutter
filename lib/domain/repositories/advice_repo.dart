import 'package:flutter_schulung/domain/entities/advice.dart';
import 'package:flutter_schulung/domain/failures/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class AdviceRepo {
  Future<Result<Advice, Failure>> getAdvice({String id = ''});
}
