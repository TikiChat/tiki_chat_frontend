import 'package:tikichat_app/DI/locator.dart';
import 'package:tikichat_app/Domain/Entitys/find_user_response.dart';
import 'package:tikichat_app/Domain/Entitys/terms.dart';
import 'package:tikichat_app/Domain/Entitys/user_signup_request.dart';
import 'package:tikichat_app/Domain/Repository/Auth/auth_repository.dart';

class AuthUseCase {
  AuthRepository authRepository = locator<AuthRepository>();

  Future<FindUserResponse> searchUserEmail(String email) async {
    final dto = await authRepository.searchUserEmail(email);
    return FindUserResponse.fromModel(dto);
  }

  Future sendAuthCode(String email) async {
    return await authRepository.sendAuthCode(email);
  }

  Future getAuthVerify(String email, String certificationNumber) async {
    return await authRepository.getAuthVerify(email, certificationNumber);
  }

  Future signupNormal(UserSignUpRequest data) async {
    return await authRepository.signupNormal(data);
  }

  Future<Terms> getAgreeTerms() async {
    final dto = await authRepository.getAgreeTerms();
    return Terms.fromModel(dto);
  }

  Future signinNormal(Map<String, String> data) async {
    return await authRepository.signinNormal(data);
  }

  Future updatePasssword(Map<String, String> data, int userId) async {
    return await authRepository.updatePasssword(data, userId);
  }
}
