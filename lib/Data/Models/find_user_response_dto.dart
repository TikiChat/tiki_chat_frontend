import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_user_response_dto.g.dart';
part 'find_user_response_dto.freezed.dart';

@freezed
class FindUserResponseDto with _$FindUserResponseDto {
  const factory FindUserResponseDto({
    String? email,
    bool? passwordExists,
  }) = _FindUserResponseDto;

  factory FindUserResponseDto.fromJson(Map<String, dynamic> json) =>
      _$FindUserResponseDtoFromJson(json);
}

FindUserResponseDto Function(dynamic) findUserResponseDtoConverter =
    (json) => FindUserResponseDto.fromJson(json);
