import 'package:flutter_schulung/data/data_sources/advice_remote_data_source.dart';
import 'package:flutter_schulung/data/exceptions/exceptions.dart';
import 'package:flutter_schulung/domain/entities/advice.dart';
import 'package:flutter_schulung/domain/failures/failure.dart';
import 'package:flutter_schulung/domain/repositories/advice_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class AdviceRepoImpl implements AdviceRepo {
  AdviceRepoImpl({required this.dataSource});

  final AdviceRemoteDataSource dataSource;

  @override
  Future<Result<Advice, Failure>> getAdvice() async {
    try {
      final result = await dataSource.getAdvice();

      return Success(
        Advice(advice: result.advice, id: result.id),
      );
    } on ServerException catch (_) {
      return Error(
        ServerFailure(),
      );
    }
  }
}
