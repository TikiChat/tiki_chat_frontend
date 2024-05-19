import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tikichat_app/Data/Models/latest_terms_response.dart';
import 'package:tikichat_app/Domain/Entitys/term.dart';

part 'terms.g.dart';
part 'terms.freezed.dart';

@freezed
class Terms with _$Terms {
  const factory Terms({
    required List<Term> terms,
  }) = _Terms;

  factory Terms.fromModel(LatestTermsResponse dto) {
    return Terms(
      terms: dto.termsDtos != null ? dto.termsDtos!.map((e) => Term.fromModel(e)).toList() : [],
    );
  }

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);
}
