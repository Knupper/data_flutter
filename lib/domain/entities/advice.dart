import 'package:equatable/equatable.dart';

class Advice extends Equatable {
  const Advice({required this.advice, required this.id});

  final String advice;
  final int id;

  @override
  List<Object?> get props => [
        advice,
        id,
      ];
}
