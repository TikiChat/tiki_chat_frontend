import 'package:get_it/get_it.dart';
import 'package:tikichat_app/Data/DataSource/remote_source.dart';
import 'package:tikichat_app/Data/Repository_impl/Auth/auth_repository_impl.dart';
import 'package:tikichat_app/Domain/Repository/Auth/auth_repository.dart';
import 'package:tikichat_app/Domain/UseCase/Auth/auth_usecase.dart';
import 'package:tikichat_app/Presentation/ViewModel/Auth/auth_view_model.dart';

GetIt locator = GetIt.instance;

Future initLocator() async {
  // DataSource
  locator.registerLazySingleton<RemoteSource>(() => RemoteSource());

  //Auth
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  locator.registerLazySingleton<AuthUseCase>(() => AuthUseCase());
  locator.registerLazySingleton<AuthViewModel>(() => AuthViewModel());
}
