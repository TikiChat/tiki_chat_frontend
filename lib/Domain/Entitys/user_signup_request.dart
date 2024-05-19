// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tikichat_app/Domain/Entitys/user_signup_term_agree.dart';

part 'user_signup_request.g.dart';
part 'user_signup_request.freezed.dart';

@freezed
class UserSignUpRequest with _$UserSignUpRequest {
  @JsonSerializable(explicitToJson: true)
  const factory UserSignUpRequest({
    String? email,
    String? password,
    String? nickname,
    UserSignupTermAgree? termsAgreementDto,
  }) = _UserSignUpRequest;

  factory UserSignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpRequestFromJson(json);
}
