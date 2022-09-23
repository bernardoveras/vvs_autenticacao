import '../../domain/value_objects/auth_params.dart';

abstract class IAuthDatasource {
  Future<Map<String, dynamic>> getAccessToken(AuthParams params);
  Future<Map<String, dynamic>> getUserInfo(String accessToken);
  Future<Map<String, dynamic>> getUserInfoKeycloak(String accessToken);
  Future<Map<String, dynamic>> getAccessTokenKeycloak(AuthParams params);
}
