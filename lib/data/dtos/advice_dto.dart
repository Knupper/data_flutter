import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'advice_dto.g.dart';

@JsonSerializable()
class AdviceDto extends Equatable {
  const AdviceDto({required this.id, required this.advice});

  @JsonKey(name: 'advice_id')
  final int id;
  final String advice;

  factory AdviceDto.fromJson(Map<String, dynamic> json) => _$AdviceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AdviceDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        advice,
      ];
}
