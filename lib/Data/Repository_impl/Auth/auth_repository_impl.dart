import 'package:tikichat_app/DI/locator.dart';
import 'package:tikichat_app/Data/DataSource/remote_source.dart';
import 'package:tikichat_app/Data/Models/find_user_response_dto.dart';
import 'package:tikichat_app/Data/Models/latest_terms_response.dart';
import 'package:tikichat_app/Domain/Entitys/user_signup_request.dart';
import 'package:tikichat_app/Domain/Repository/Auth/auth_repository.dart';
import 'package:tikichat_app/Utils/Enum/api_enum.dart';

class AuthRepositoryImpl extends AuthRepository {
  RemoteSource remoteSource = locator<RemoteSource>();

  @override
  Future<FindUserResponseDto> searchUserEmail(String email) async {
    return await remoteSource.request(
      type: ApiTypeEnum.GET,
      path: ApiPathEnum.USER_SEARCH.path,
      query: {"email": email},
      converter: findUserResponseDtoConverter,
    );
  }

  @override
  Future<LatestTermsResponse> getAgreeTerms() async {
    return await remoteSource.request(
      type: ApiTypeEnum.GET,
      path: ApiPathEnum.AGREE_TERM.path,
      converter: latestTermsResponseConverter,
    );
  }

  @override
  Future sendAuthCode(String email) async {
    return await remoteSource.request(
      type: ApiTypeEnum.POST,
      path: ApiPathEnum.SEND_AUTHCODE.path,
      data: {'email': email},
      converter: null,
    );
  }

  @override
  Future getAuthVerify(String email, String certificationNumber) async {
    return await remoteSource.request(
      type: ApiTypeEnum.GET,
      path: ApiPathEnum.AUTH_VERIFY.path,
      query: {'email': email, 'certificationNumber': certificationNumber},
      converter: null,
    );
  }

  @override
  Future signupNormal(UserSignUpRequest data) async {
    return await remoteSource.request(
      type: ApiTypeEnum.POST,
      path: ApiPathEnum.NORMAL_SIGNUP.path,
      data: data.toJson(),
      converter: null,
    );
  }

  @override
  Future signinNormal(Map<String, String> data) async {
    return await remoteSource.request(
      type: ApiTypeEnum.POST,
      path: ApiPathEnum.LOGIN.path,
      data: data,
      converter: null,
    );
  }

  @override
  Future updatePasssword(Map<String, String> data, int userId) async {
    return await remoteSource.request(
      type: ApiTypeEnum.PUT,
      path: "$ApiPathEnum.USER.path}/$userId/password",
      data: data,
      converter: null,
    );
  }
}
