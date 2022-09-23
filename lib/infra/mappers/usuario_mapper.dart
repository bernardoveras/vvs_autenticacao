import 'dart:convert';

import 'package:vvs_autenticacao/infra/mappers/recurso_do_usuario_mapper.dart';

import '../../domain/entities/access_info.dart';
import '../../domain/entities/usuario.dart';
import '../../domain/value_objects/recurso_do_usuario.dart';
import 'access_info_mapper.dart';

class UsuarioMapper {
  const UsuarioMapper._();

  static Usuario fromMap(Map<String, dynamic> map, {AccessInfo? accessInfo}) {
    return Usuario(
      id: map['http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/id'],
      email: map['http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/email'],
      login: map['http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/login'],
      nome: map['http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/nome'],
      telefonePrincipal: map['http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/telefoneprincipal'],
      accessInfo: map['access_info'] != null ? AccessInfoMapper.fromMap(map['access_info']) : accessInfo,
      gruposEmpresa: _obterGruposEmpresa(map),
      recursos: _obterRecursos(map),
    );
  }

  static Map<String, dynamic> toMap(Usuario entity) {
    return {
      'http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/id': entity.id,
      'http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/email': entity.email,
      'http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/login': entity.login,
      'http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/nome': entity.nome,
      'http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/telefoneprincipal': entity.telefonePrincipal,
      'access_info': entity.accessInfo == null ? null : AccessInfoMapper.toMap(entity.accessInfo!),
      'http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/gruposEmpresa': entity.gruposEmpresa,
      'http://schemas.vvssistemas.com.br/ws/identity/claims/recurso/': entity.recursos.map((e) => RecursoDoUsuarioMapper.toMap(e)).toList(),
    };
  }

  static Usuario fromJson(String json) => fromMap(jsonDecode(json));

  static String toJson(Usuario entity) {
    var map = toMap(entity);
    var recursos = entity.recursos;

    map.update('http://schemas.vvssistemas.com.br/ws/identity/claims/recurso/',
        (_) => recursos.map((recurso) => RecursoDoUsuarioMapper.toJson(recurso)).toList());

    return json.encode(map);
  }

  static List<String> _obterGruposEmpresa(Map<String, dynamic> map) {
    const String gruposEmpresaKey = 'http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/gruposEmpresa';
    final dynamic gruposEmpresa = map[gruposEmpresaKey];

    if (gruposEmpresa != null) {
      if (gruposEmpresa is String && gruposEmpresa.isNotEmpty) {
        return <String>[gruposEmpresa];
      } else if (gruposEmpresa is List) {
        return <String>[...gruposEmpresa];
      }
    }

    return [];
  }

  static List<RecursoDoUsuario> _obterRecursos(Map<String, dynamic> map) {
    const String recursosKey = 'http://schemas.vvssistemas.com.br/ws/identity/claims/recurso/';
    final List<RecursoDoUsuario> recursos = <RecursoDoUsuario>[];
    final dynamic recursosMap = map[recursosKey];

    if (recursosMap != null) {
      if (recursosMap is List && recursosMap.isNotEmpty) {
        for (var recurso in recursosMap) {
          recursos.add(_decodeRecurso(recurso));
        }
      } else if (recursosMap is String) {
        recursos.add(_decodeRecurso(recursosMap));
      }
    }

    return recursos;
  }

  static RecursoDoUsuario _decodeRecurso(String json) {
    var recursoStringFormatted = json.replaceAll('\\', '');
    var recursoDecoded = jsonDecode(recursoStringFormatted);

    return RecursoDoUsuarioMapper.fromMap(recursoDecoded);
  }
}
