// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tikichat_app/Domain/Entitys/term_agreement.dart';

part 'user_signup_term_agree.g.dart';
part 'user_signup_term_agree.freezed.dart';

@freezed
class UserSignupTermAgree with _$UserSignupTermAgree {
  @JsonSerializable(explicitToJson: true)
  const factory UserSignupTermAgree({
    required List<TermsAgreement> agreements,
  }) = _UserSignupTermAgree;

  factory UserSignupTermAgree.fromJson(Map<String, dynamic> json) =>
      _$UserSignupTermAgreeFromJson(json);
}
