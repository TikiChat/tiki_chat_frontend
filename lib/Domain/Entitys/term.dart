import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tikichat_app/Data/Models/latest_terms_dto.dart';

part 'term.g.dart';
part 'term.freezed.dart';

@freezed
class Term with _$Term {
  const factory Term({
    required int id,
    required String version,
    required String termsType,
    required String content,
    required bool mandatory,
    required String effectiveAt,
  }) = _Term;

  factory Term.fromModel(LatestTermsDto dto) {
    return Term(
      id: dto.id ?? 0,
      version: dto.version ?? "",
      termsType: dto.termsType ?? "",
      content: dto.content ?? "",
      mandatory: dto.mandatory ?? false,
      effectiveAt: dto.effectiveAt ?? "",
    );
  }

  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);
}
