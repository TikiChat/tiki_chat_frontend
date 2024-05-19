import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_terms_dto.g.dart';
part 'latest_terms_dto.freezed.dart';

@freezed
class LatestTermsDto with _$LatestTermsDto {
  const factory LatestTermsDto({
    int? id,
    String? version,
    String? termsType,
    String? content,
    bool? mandatory,
    String? effectiveAt,
  }) = _LatestTermsDto;

  factory LatestTermsDto.fromJson(Map<String, dynamic> json) => _$LatestTermsDtoFromJson(json);
}

LatestTermsDto Function(dynamic) termsDtoConverter = (json) => LatestTermsDto.fromJson(json);
