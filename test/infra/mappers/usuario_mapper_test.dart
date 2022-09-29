import 'package:test/test.dart';

import 'package:vvs_autenticacao/domain/entities/usuario.dart';
import 'package:vvs_autenticacao/infra/mappers/usuario_mapper.dart';

import '../../mocks/usuario_mock.dart';

void main() {
  final Usuario entity = usuarioMock;

  test('Deve retornar um Map com as keys certas', () {
    var entityFromMap = UsuarioMapper.fromMap(usuarioMockMap);

    expect(entityFromMap, entity);

    entityFromMap = UsuarioMapper.fromMap(usuarioViniciusMockMap);

    expect(entityFromMap.gruposEmpresa.isEmpty, false);

    expect(entityFromMap.recursos.isEmpty, false);
  });

  test('Deve retornar uma String do Json', () {
    var entityFromJson = UsuarioMapper.fromJson(usuarioMockJson);

    expect(entityFromJson, entity);

    entityFromJson = UsuarioMapper.fromJson(usuarioViniciusMockJson);

    expect(entityFromJson.gruposEmpresa, isNotEmpty);
    expect(entityFromJson.recursos, isNotEmpty);
  });

  test('Deve retornar uma String do Json sem recurso', () {
    var entityFromJson = UsuarioMapper.fromJson(usuarioSemRecursoJson);

    expect(entityFromJson.gruposEmpresa, isNotEmpty);
    expect(entityFromJson.recursos, isEmpty);
  });

  test('Deve retornar um Map com as keys certas', () {
    var map = UsuarioMapper.toMap(entity);

    expect(map.containsKey('http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/id'), true);
    expect(map.containsKey('http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/email'), true);
    expect(map.containsKey('http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/nome'), true);
    expect(map.containsKey('http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/telefoneprincipal'), true);
  });

  test('Deve retornar uma String do Json', () {
    var json = UsuarioMapper.toJson(entity);

    expect(json.contains('"http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/id":"${entity.id}"'), true);
    expect(json.contains('"http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/email":"${entity.email}"'), true);
    expect(json.contains('"http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/nome":"${entity.nome}"'), true);
    expect(json.contains('"http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/telefoneprincipal":"${entity.telefonePrincipal}"'), true);

    var entity2 = UsuarioMapper.fromMap(usuarioViniciusMockMap);
    json = UsuarioMapper.toJson(entity2);

    var json2 = UsuarioMapper.fromJson(json);

    expect(json2, isA<Usuario>());
  });
}
