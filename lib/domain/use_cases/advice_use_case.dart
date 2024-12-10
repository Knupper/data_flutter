import 'package:flutter_schulung/domain/entities/advice.dart';
import 'package:flutter_schulung/domain/failures/failure.dart';
import 'package:flutter_schulung/domain/repositories/advice_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class AdviceUseCase {
  AdviceUseCase({required this.repository});

  final AdviceRepo repository;

  Future<Result<Advice, Failure>> get() {
    // special business logic
    return repository.getAdvice();
  }
}
