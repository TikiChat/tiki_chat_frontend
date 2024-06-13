import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:tikichat_app/DI/locator.dart';
import 'package:tikichat_app/Domain/Entitys/find_user_response.dart';
import 'package:tikichat_app/Domain/Entitys/terms.dart';
import 'package:tikichat_app/Domain/Entitys/user_signup_request.dart';
import 'package:tikichat_app/Domain/Repository/Auth/auth_repository.dart';
import 'package:tikichat_app/Utils/Enum/common_enum.dart';
import 'package:tikichat_app/Utils/Exception/tk_exception.dart';

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

  Future loginSocial({required String accessToken, required String registrationId}) async {
    return await authRepository.loginSocial(
      accessToken: accessToken,
      registrationId: registrationId,
    );
  }

  Future loginKakao({required String accessToken, required String registrationId}) async {
    bool isInstalled = await isKakaoTalkInstalled();
    if (isInstalled) {
      try {
        await loginSocial(accessToken: accessToken, registrationId: SocialEnum.KAKAO.name);
      } on TkException catch (_) {
        rethrow;
      } catch (error) {
        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') return;
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        await UserApi.instance.loginWithKakaoAccount();
      }
    } else {
      await UserApi.instance.loginWithKakaoAccount();
    }
  }
}
