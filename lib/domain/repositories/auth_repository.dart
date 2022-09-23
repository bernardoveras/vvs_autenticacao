import '../entities/access_info.dart';
import '../entities/usuario.dart';
import '../value_objects/auth_params.dart';

abstract class IAuthRepository {
  Future<AccessInfo> getAccessToken(AuthParams params);
  Future<AccessInfo> getAccessTokenKeycloak(AuthParams params);
  Future<Usuario> getUserInfo(String accessToken);
  Future<Usuario> getUserInfoKeycloak(String accessToken);
}