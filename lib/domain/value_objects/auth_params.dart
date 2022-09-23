import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../enums/software.dart';

class AuthParams extends Equatable {
  const AuthParams(
    this.email,
    this.senha, {
    this.software,
  });

  final String email;
  final String senha;
  final Software? software;

  Map<String, dynamic> toMap() => {
        'username': email,
        'password': senha,
        'software': software?.index,
      };

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [email, senha, software];
}
