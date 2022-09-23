import 'package:equatable/equatable.dart';

import '../value_objects/recurso_do_usuario.dart';
import 'access_info.dart';

// ignore: must_be_immutable
class Usuario extends Equatable {
  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefonePrincipal,
    this.login,
    this.accessInfo,
    this.gruposEmpresa = const [],
    this.recursos = const [],
  });

  final String id;
  final String nome;
  final String email;
  final String? login;
  final String telefonePrincipal;
  AccessInfo? accessInfo;
  final List<String> gruposEmpresa;
  final List<RecursoDoUsuario> recursos;

  Usuario copyWith({
    String? id,
    String? nome,
    String? email,
    String? telefonePrincipal,
    String? login,
    AccessInfo? accessInfo,
    List<String>? gruposEmpresa,
    List<RecursoDoUsuario>? recursos,
  }) {
    return Usuario(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      telefonePrincipal: telefonePrincipal ?? this.telefonePrincipal,
      accessInfo: accessInfo ?? this.accessInfo,
      gruposEmpresa: gruposEmpresa ?? this.gruposEmpresa,
      recursos: recursos ?? this.recursos,
      login: login ?? this.login,
    );
  }

  @override
  List<Object?> get props => [
        id,
        nome,
        email,
        telefonePrincipal,
        accessInfo,
        gruposEmpresa,
        recursos,
        login,
      ];
}
