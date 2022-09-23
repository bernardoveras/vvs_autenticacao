import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:vvs_autenticacao/domain/repositories/auth_repository.dart';
import 'package:vvs_autenticacao/domain/value_objects/auth_params.dart';
import 'package:vvs_autenticacao/infra/datasources/auth_datasource.dart';
import 'package:vvs_autenticacao/infra/repositories/auth_repository_impl.dart';

import '../../mocks/datasource_mock.dart';
import '../../mocks/access_info_mock.dart';
import '../../mocks/usuario_mock.dart';

void main() {
  const AuthParams params = AuthParams('teste@email.com', 'admins');
  late final IAuthDatasource datasource;
  late final IAuthRepository repository;

  setUpAll(() {
    datasource = AuthDatasourceMock();
    repository = AuthRepository(datasource);
  });

  test('Deve retornar as informações do acesso caso for sucesso', () async {
    when(() => datasource.getAccessToken(params)).thenAnswer((_) async => accessInfoMockMap);

    var result = await repository.getAccessToken(params);

    expect(result, accessInfoMock);
  });

  test('Deve retornar as informações do usuário caso for sucesso', () async {
    when(() => datasource.getUserInfo(any())).thenAnswer((_) async => usuarioMockMap);

    var result = await repository.getUserInfo(accessInfoMock.accessToken);

    expect(result, usuarioMock);
  });

  test('Deve retornar as informações do usuário do keycloak caso for sucesso', () async {
    when(() => datasource.getUserInfo(any())).thenAnswer((_) async => usuarioMockMap);

    var result = await repository.getUserInfo(accessInfoMock.accessToken);

    expect(result, usuarioMock);
  });
}
