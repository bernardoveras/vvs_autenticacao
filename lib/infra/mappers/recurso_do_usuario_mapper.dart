import 'dart:convert';

import '../../domain/value_objects/recurso_do_usuario.dart';

class RecursoDoUsuarioMapper {
  const RecursoDoUsuarioMapper._();

  static RecursoDoUsuario fromMap(Map<String, dynamic> map) {
    return RecursoDoUsuario(
      serial: map['Serial'],
      recursos: map['Recursos'] is List ? <String>[...map['Recursos']] : [],
    );
  }

  static Map<String, dynamic> toMap(RecursoDoUsuario entity) {
    return {
      'Serial': entity.serial,
      'Recursos': entity.recursos,
    };
  }

  static RecursoDoUsuario fromJson(String json) => fromMap(jsonDecode(json));

  static String toJson(RecursoDoUsuario entity) => json.encode(toMap(entity));
}
