import 'package:test/test.dart';

import 'package:vvs_autenticacao/domain/entities/access_info.dart';

import '../../mocks/access_info_mock.dart';

void main() {
  final AccessInfo entity = accessInfoMock;

  test('Deve retornar true caso a entidade seja idêntica', () {
    var newEntity = entity.copyWith();

    expect(newEntity == entity, true);
  });
  test('Deve retornar false caso a entidade não seja idêntica', () {
    var newEntity = entity.copyWith(accessToken: 'different_access_token');

    expect(newEntity == entity, false);
  });
}
