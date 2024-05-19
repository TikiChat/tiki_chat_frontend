import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tikichat_app/Data/Models/find_user_response_dto.dart';

part 'find_user_response.g.dart';
part 'find_user_response.freezed.dart';

@freezed
class FindUserResponse with _$FindUserResponse {
  const factory FindUserResponse({
    required String email,
    required bool passwordExists,
  }) = _FindUserResponse;

  factory FindUserResponse.fromModel(FindUserResponseDto dto) {
    return FindUserResponse(
      email: dto.email ?? "",
      passwordExists: dto.passwordExists ?? false,
    );
  }

  factory FindUserResponse.fromJson(Map<String, dynamic> json) => _$FindUserResponseFromJson(json);
}
