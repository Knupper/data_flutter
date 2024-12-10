part of 'advice_cubit.dart';

sealed class AdviceState extends Equatable {
  const AdviceState();

  @override
  List<Object?> get props => [];
}

class AdviceEmptyState extends AdviceState {
  const AdviceEmptyState();
}

class AdviceLoadingState extends AdviceState {}

class AdviceLoadedState extends AdviceState {
  final String text;

  const AdviceLoadedState({required this.text});

  @override
  List<Object?> get props => [text];
}

class AdviceErrorState extends AdviceState {}
