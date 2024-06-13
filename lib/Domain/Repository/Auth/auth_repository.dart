import 'package:tikichat_app/Data/Models/find_user_response_dto.dart';
import 'package:tikichat_app/Data/Models/latest_terms_response.dart';
import 'package:tikichat_app/Domain/Entitys/user_signup_request.dart';

abstract class AuthRepository {
  Future<FindUserResponseDto> searchUserEmail(String email);
  Future sendAuthCode(String email);
  Future getAuthVerify(String email, String certificationNumber);
  Future signupNormal(UserSignUpRequest data);
  Future<LatestTermsResponse> getAgreeTerms();
  Future signinNormal(Map<String, String> data);
  Future updatePasssword(Map<String, String> data, int userId);
  Future loginSocial({required String accessToken, required String registrationId});
}
