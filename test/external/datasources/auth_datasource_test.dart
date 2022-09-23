import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vvs_autenticacao/domain/entities/access_info.dart';
import 'package:vvs_autenticacao/domain/enums/software.dart';
import 'package:vvs_autenticacao/domain/value_objects/auth_params.dart';
import 'package:vvs_autenticacao/external/api_constants.dart';
import 'package:vvs_autenticacao/external/datasources/auth_datasource.dart';
import 'package:vvs_autenticacao/infra/mappers/access_info_mapper.dart';
import 'package:vvs_autenticacao/infra/mappers/usuario_keycloak_mapper.dart';
import 'package:vvs_autenticacao/infra/mappers/usuario_mapper.dart';
import 'package:vvs_core/vvs_core.dart';

import '../../mocks/auth_response_mock.dart';
import '../../mocks/usuario_mock.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late final DioMock dio;
  late final DioClientAdapter adapter;
  late final AuthDatasource datasource;

  const String email = 'teste@email.com';
  const String senha = 'admin';

  Response successResponse({required String url, payload}) => Response(
        requestOptions: RequestOptions(path: url),
        data: payload,
        statusCode: 200,
      );

  Response errorResponse({required String url, payload}) => Response(
        requestOptions: RequestOptions(path: url),
        data: payload,
        statusCode: 400,
      );

  void mock(String url, Future<Response<dynamic>> Function(Invocation) answer) {
    return when(() => dio.post(
          url,
          options: any(named: 'options'),
          data: any(named: 'data'),
        )).thenAnswer(answer);
  }

  void mockSuccess(String url, payload) => mock(url, (_) async => successResponse(url: url, payload: payload));

  void mockError(String url, payload) => mock(url, (_) async => errorResponse(url: url, payload: payload));

  setUpAll(() async {
    dio = DioMock();
    adapter = DioClientAdapter(dio);
    datasource = AuthDatasource(adapter);
  });

  group('Autenticação', () {
    final String successPayload = authSuccessResponseJsonMock;
    final String errorPayload = authErrorResponseJsonMock;

    setUp(() {
      mockSuccess(ApiConstants.authUrl, successPayload);
    });
    test('Deve retornar um AccessInfo caso autentique com sucesso.', () async {
      var result = await datasource.getAccessToken(const AuthParams(email, senha));

      var accessInfo = AccessInfoMapper.fromMap(result);
      var decodedPayload = json.decode(successPayload);

      expect(result, isA<Map<String, dynamic>>());
      expect(result, decodedPayload);

      expect(accessInfo, isA<AccessInfo>());
      expect(accessInfo.accessToken, decodedPayload['access_token']);
      expect(accessInfo.expiresIn, decodedPayload['expires_in']);
      expect(accessInfo.refreshToken, decodedPayload['refresh_token']);
      expect(accessInfo.tokenType, decodedPayload['token_type']);
    });

    test('Deve chamar o POST com o body correto', () async {
      await datasource.getAccessToken(const AuthParams(email, senha));

      verify(
        () => dio.post(
          ApiConstants.authUrl,
          //TODO: Verificar como testar o "options" passando somente o header.
          options: any(named: 'options'),
          data: {
            "username": email,
            "password": senha,
            "compression": "gzip",
            "scope": "openid profile usuarioXGrupoEmpresa usuario offline_access",
            "grant_type": "password",
          },
        ),
      );
    });

    test('Deve chamar o POST com o body correto do Software Central do Cliente', () async {
      await datasource.getAccessToken(const AuthParams(email, senha, software: Software.centralDoCliente));

      verify(
        () => dio.post(
          ApiConstants.authUrl,
          //TODO: Verificar como testar o "options" passando somente o header.
          options: any(named: 'options'),
          data: {
            "username": email,
            "password": senha,
            "compression": "gzip",
            "scope": "openid profile usuarioXGrupoEmpresa usuario offline_access permissoes",
            "grant_type": "password",
          },
        ),
      );
    });

    test('Deve retornar um erro caso houver uma falha na autenticação.', () async {
      mockError(ApiConstants.authUrl, errorPayload);

      var future = datasource.getAccessToken(
        const AuthParams(email, 'invalid_password'),
      );

      expect(future, throwsA(isA<UnauthorizedHttpError>()));
    });
  });
  group('Autenticação Keycloak - Central do Cliente', () {
    final String successPayload = authKeycloakSuccessResponseJsonMock;
    final String errorPayload = authErrorResponseJsonMock;

    setUp(() {
      mockSuccess(ApiConstants.authKeycloakUrl, successPayload);
    });
    test('Deve retornar um AccessInfo caso autentique com sucesso.', () async {
      var result = await datasource.getAccessTokenKeycloak(const AuthParams(email, senha, software: Software.centralDoCliente));

      var accessInfo = AccessInfoMapper.fromMap(result);
      var decodedPayload = json.decode(successPayload);

      expect(result, isA<Map<String, dynamic>>());
      expect(result, decodedPayload);

      expect(accessInfo, isA<AccessInfo>());
      expect(accessInfo.accessToken, decodedPayload['access_token']);
      expect(accessInfo.expiresIn, decodedPayload['expires_in']);
      expect(accessInfo.refreshToken, decodedPayload['refresh_token']);
      expect(accessInfo.tokenType, decodedPayload['token_type']);
    });

    test('Deve chamar o POST com o body correto', () async {
      await datasource.getAccessTokenKeycloak(const AuthParams(email, senha, software: Software.centralDoCliente));

      verify(
        () => dio.post(
          ApiConstants.authKeycloakUrl,
          //TODO: Verificar como testar o "options" passando somente o header.
          options: any(named: 'options'),
          data: {
            "username": email,
            "password": senha,
            "client_id": "centraldocliente",
            "grant_type": "password",
            "client_secret": "nzpQTTIBBvD2hKslcCwiBRSGmfP14V83",
          },
        ),
      );
    });

    test('Deve retornar um erro caso houver uma falha na autenticação.', () async {
      mockError(ApiConstants.authKeycloakUrl, errorPayload);

      var future = datasource.getAccessTokenKeycloak(
        const AuthParams(email, 'invalid_password', software: Software.centralDoCliente),
      );

      expect(future, throwsA(isA<UnauthorizedHttpError>()));
    });
  });

  group('Informações do Usuário', () {
    final String successPayload = usuarioMockJson;

    setUp(() {
      mockSuccess(ApiConstants.userInfoUrl, successPayload);
    });
    test('Deve retornar um Usuario caso obter o usuário com sucesso.', () async {
      var result = await datasource.getUserInfo('generic_access_token');

      var userInfo = UsuarioMapper.fromMap(result);

      var decodedPayload = json.decode(successPayload);

      expect(result, isA<Map<String, dynamic>>());
      expect(result, decodedPayload);

      expect(userInfo, usuarioMock);
    });

    test('Deve retornar um Usuario do Keycloak caso obter o usuário com sucesso.', () async {
      mockSuccess(ApiConstants.userInfoUrl, usuarioKeycloakMockJson);

      var result = await datasource.getUserInfo('generic_access_token');

      var userInfo = UsuarioKeycloakMapper.fromMap(result);

      var decodedPayload = json.decode(usuarioKeycloakMockJson);

      expect(result, isA<Map<String, dynamic>>());
      expect(result, decodedPayload);

      expect(userInfo, usuarioKeycloakMock);
    });
  });
}
