import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_schulung/domain/use_cases/advice_use_case.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit({required this.useCase}) : super(AdviceEmptyState());

  final AdviceUseCase useCase;

  void getAdvice({String id = ''}) {
    emit(AdviceLoadingState());
    useCase.get(id: id).then(
      (value) {
        value.when(
          (success) => emit(AdviceLoadedState(text: success.advice)),
          (error) => emit(AdviceErrorState()),
        );
      },
    );
  }
}
