import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'SERVER_PATH', obfuscate: true)
  static final String serverPath = _Env.serverPath;
}
