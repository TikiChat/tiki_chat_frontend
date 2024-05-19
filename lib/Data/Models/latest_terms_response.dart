import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tikichat_app/Data/Models/latest_terms_dto.dart';

part 'latest_terms_response.g.dart';
part 'latest_terms_response.freezed.dart';

@freezed
class LatestTermsResponse with _$LatestTermsResponse {
  const factory LatestTermsResponse({
    List<LatestTermsDto>? termsDtos,
  }) = _LatestTermsResponse;

  factory LatestTermsResponse.fromJson(Map<String, dynamic> json) =>
      _$LatestTermsResponseFromJson(json);
}

LatestTermsResponse Function(dynamic) latestTermsResponseConverter =
    (json) => LatestTermsResponse.fromJson(json);
