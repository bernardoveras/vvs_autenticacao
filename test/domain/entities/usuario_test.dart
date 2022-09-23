import 'package:test/test.dart';

import 'package:vvs_autenticacao/domain/entities/usuario.dart';

import '../../mocks/usuario_mock.dart';

void main() {
  final Usuario entity = usuarioMock;

  test('Deve retornar true caso a entidade seja idêntica', () {
    var newEntity = entity.copyWith();

    expect(newEntity == entity, true);
  });
  
  test('Deve retornar false caso a entidade não seja idêntica', () {
    var newEntity = entity.copyWith(email: 'different_email');

    expect(newEntity == entity, false);
  });
}
