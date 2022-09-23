import 'package:test/test.dart';

import 'package:vvs_autenticacao/domain/entities/access_info.dart';
import 'package:vvs_autenticacao/infra/mappers/access_info_mapper.dart';

import '../../mocks/access_info_mock.dart';

void main() {
  final AccessInfo entity = accessInfoMock;

  test('Deve retornar um Map com as keys certas', () {
    var entityFromMap = AccessInfoMapper.fromMap(accessInfoMockMap);

    expect(entityFromMap, entity);
  });

  test('Deve retornar uma String do Json', () {
    var entityFromJson = AccessInfoMapper.fromJson(accessInfoMockJson);

    expect(entityFromJson, entity);
  });

  test('Deve retornar um Map com as keys certas', () {
    var map = AccessInfoMapper.toMap(entity);

    expect(map.containsKey('access_token'), true);
    expect(map.containsKey('expires_in'), true);
    expect(map.containsKey('refresh_token'), true);
    expect(map.containsKey('token_type'), true);
  });

  test('Deve retornar uma String do Json', () {
    var json = AccessInfoMapper.toJson(entity);

    expect(json.contains('"access_token":"${entity.accessToken}"'), true);
    expect(json.contains('"expires_in":${entity.expiresIn}'), true);
    expect(json.contains('"refresh_token":"${entity.refreshToken}"'), true);
    expect(json.contains('"token_type":"${entity.tokenType}"'), true);
  });
}
