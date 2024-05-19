import 'package:tikichat_app/DI/locator.dart';
import 'package:tikichat_app/Domain/Entitys/terms.dart';
import 'package:tikichat_app/Domain/Entitys/user_signup_request.dart';
import 'package:tikichat_app/Domain/UseCase/Auth/auth_usecase.dart';
import 'package:tikichat_app/Presentation/ViewModel/Common/cubit_state.dart';
import 'package:tikichat_app/Utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthViewModel extends Cubit<CubitState<Terms>> {
  AuthViewModel() : super(ItemsInitial());

  AuthUseCase authUseCase = locator<AuthUseCase>();
  UserSignUpRequest userData = const UserSignUpRequest();
  List termAgreeList = [];

  Future<bool> searchUserEmail(String email) async {
    try {
      await authUseCase.searchUserEmail(email);
      return success(true);
    } catch (e) {
      return false;
    }
  }

  Future sendAuthCode(String email) async {
    try {
      await authUseCase.sendAuthCode(email);
      return success(true);
    } catch (e) {
      fail(e.toString());
    }
  }

  Future<bool> getAuthVerify(String email, String certificationNumber) async {
    try {
      await authUseCase.getAuthVerify(email, certificationNumber);
      return success(true);
    } catch (e) {
      return fail(e.toString());
    }
  }

  Future<bool> signupNormal(UserSignUpRequest data) async {
    try {
      await authUseCase.signupNormal(data);
      return success(true);
    } catch (e) {
      return fail(e.toString());
    }
  }

  Future<Terms?> getAgreeTerms() async {
    try {
      emit(ItemsLoading<Terms>());
      final terms = await authUseCase.getAgreeTerms();
      emit(ItemsLoaded<Terms>([terms]));
      return success(terms);
    } catch (e) {
      emit(ItemsError<Terms>('Failed to load items'));
      fail(e.toString());
      return null;
    }
  }

  Future<bool> signinNormal(Map<String, String> data) async {
    try {
      await authUseCase.signinNormal(data);
      return success(true);
    } catch (e) {
      return fail(e.toString());
    }
  }

  Future updatePasssword(Map<String, String> data, int userId) async {
    try {
      await authUseCase.updatePasssword(data, userId);
      return success(true);
    } catch (e) {
      return fail(e.toString());
    }
  }
}
