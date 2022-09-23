import 'dart:convert';

import 'package:vvs_core/vvs_core.dart';

import '../../domain/constants/auth_constants.dart';
import '../../domain/enums/software.dart';
import '../../domain/value_objects/auth_params.dart';
import '../../infra/datasources/auth_datasource.dart';
import '../api_constants.dart';

class AuthDatasource implements IAuthDatasource {
  AuthDatasource(this._client);

  final IHttpClient _client;

  String _generateBasicBase64(Software? software) {
    var bytes = utf8.encode(AuthConstants.secretKey);

    if (software == Software.centralDoCliente) {
      bytes = utf8.encode('centralDoCliente:secret');
    }

    return "Basic " + base64.encode(bytes);
  }

  @override
  Future<Map<String, dynamic>> getAccessToken(AuthParams params) async {
    String scope = 'openid profile usuarioXGrupoEmpresa usuario offline_access';

    if (params.software == Software.centralDoCliente) {
      scope += ' permissoes';
    }

    var response = await _client.post(
      ApiConstants.authUrl,
      body: {
        "username": params.email,
        "password": params.senha,
        "compression": "gzip",
        "scope": scope,
        "grant_type": "password",
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": _generateBasicBase64(params.software),
      },
    );

    var result = (response.data as Map<String, dynamic>?);

    if (result == null) {
      throw HttpError(
        message: 'Erro ao obter as informações de acesso',
        statusCode: response.statusCode,
      );
    }

    if (result.containsKey('error')) {
      if (result['error'] == 'invalid_grant') {
        throw UnauthorizedHttpError(statusCode: response.statusCode);
      }

      throw HttpError(
        message: result['error'] ?? response.statusMessage ?? 'Ocorreu um erro inesperado.',
        errorType: HttpErrorType.serverError,
        statusCode: response.statusCode,
      );
    }

    return result;
  }

  @override
  Future<Map<String, dynamic>> getAccessTokenKeycloak(AuthParams params) async {
    String clientId = '';
    String clientSecret = '';

    if (params.software == null) {
      throw Exception('Informe o software.');
    }

    if (params.software == Software.centralDoCliente) {
      clientId = 'centraldocliente';
      clientSecret = 'nzpQTTIBBvD2hKslcCwiBRSGmfP14V83';
    } else if (params.software == Software.smartPedidos) {
      clientId = 'smartpedidos';
      clientSecret = 'm82GvOLpiMum7ufwKrqGZLK2RZ4WgDZ7';
    } else if (params.software == Software.minhaConta) {
      clientId = 'minhaconta';
      clientSecret = 'iR8qqAVa0myJLGp5p2edoz778cDIpg5G';
    }

    var response = await _client.post(
      ApiConstants.authKeycloakUrl,
      body: {
        "username": params.email,
        "password": params.senha,
        "grant_type": "password",
        "client_id": clientId,
        "client_secret": clientSecret,
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );

    var result = (response.data as Map<String, dynamic>?);

    if (result == null) {
      throw HttpError(
        message: 'Erro ao obter as informações de acesso',
        statusCode: response.statusCode,
      );
    }

    if (result.containsKey('error')) {
      if (result['error'] == 'invalid_grant') {
        throw UnauthorizedHttpError(statusCode: response.statusCode);
      }

      throw HttpError(
        message: result['error'] ?? response.statusMessage ?? 'Ocorreu um erro inesperado.',
        errorType: HttpErrorType.serverError,
        statusCode: response.statusCode,
      );
    }

    return result;
  }

  @override
  Future<Map<String, dynamic>> getUserInfo(String accessToken) async {
    var response = await _client.post(
      ApiConstants.userInfoUrl,
      headers: {"Authorization": "Bearer $accessToken"},
    );

    var result = (response.data as Map<String, dynamic>?);

    if (result == null) {
      throw HttpError(
        message: 'Erro ao obter as informações do usuário',
        statusCode: response.statusCode,
      );
    }

    return result;
  }
  
  @override
  Future<Map<String, dynamic>> getUserInfoKeycloak(String accessToken) async {
    var response = await _client.get(
      ApiConstants.userInfoKeycloakUrl,
      headers: {"Authorization": "Bearer $accessToken"},
    );

    var result = (response.data as Map<String, dynamic>?);

    if (result == null) {
      throw HttpError(
        message: 'Erro ao obter as informações do usuário',
        statusCode: response.statusCode,
      );
    }

    return result;
  }
}
