import '../../domain/entities/access_info.dart';
import '../../domain/entities/usuario.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/value_objects/auth_params.dart';
import '../datasources/auth_datasource.dart';
import '../mappers/access_info_mapper.dart';
import '../mappers/usuario_keycloak_mapper.dart';
import '../mappers/usuario_mapper.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository(this._datasource);

  final IAuthDatasource _datasource;

  @override
  Future<AccessInfo> getAccessToken(AuthParams params) async {
    var result = await _datasource.getAccessToken(params);

    return AccessInfoMapper.fromMap(result);
  }

  @override
  Future<Usuario> getUserInfo(String accessToken) async {
    var result = await _datasource.getUserInfo(accessToken);

    return UsuarioMapper.fromMap(result);
  }

  @override
  Future<Usuario> getUserInfoKeycloak(String accessToken) async {
    var result = await _datasource.getUserInfoKeycloak(accessToken);

    return UsuarioKeycloakMapper.fromMap(result);
  }

  @override
  Future<AccessInfo> getAccessTokenKeycloak(AuthParams params) async {
    var result = await _datasource.getAccessTokenKeycloak(params);

    return AccessInfoMapper.fromMap(result);
  }
}
