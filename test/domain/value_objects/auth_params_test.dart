import 'package:test/test.dart';

import 'package:vvs_autenticacao/domain/value_objects/auth_params.dart';

void main() {
  const String email = 'teste@email.com';
  const String senha = 'admin';
  const AuthParams dto = AuthParams(email, senha);
  
  test('Deve retornar um Map', () {
    var map = dto.toMap();

    expect(map.containsKey('username'), true);
    expect(map.containsKey('password'), true);
  });

  test('Deve retornar uma String do Json', () {
    var json = dto.toJson();

    expect(json.contains('"username":"$email"'), true);
    expect(json.contains('"password":"$senha"'), true);
  });

  test('Deve retornar true caso a comparação for verdadeira', () {
    var params = dto;

    expect(params == dto, true);
  });
  test('Deve retornar false caso a comparação não for verdadeira', () {
    var params = const AuthParams('different_email', 'different_senha');

    expect(params == dto, false);
  });
}
