import 'package:freezed_annotation/freezed_annotation.dart';

part 'term_agreement.g.dart';
part 'term_agreement.freezed.dart';

@freezed
class TermsAgreement with _$TermsAgreement {
  const factory TermsAgreement({
    required int termsId,
    required bool consentGiven,
    required String ipAddress,
    required String deviceInformation,
  }) = _TermsAgreement;

  factory TermsAgreement.fromJson(Map<String, dynamic> json) => _$TermsAgreementFromJson(json);
}
