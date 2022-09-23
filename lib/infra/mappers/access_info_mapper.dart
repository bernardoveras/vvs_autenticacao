import 'dart:convert';

import '../../domain/entities/access_info.dart';

class AccessInfoMapper {
  const AccessInfoMapper._();

  static AccessInfo fromMap(Map<String, dynamic> map) {
    return AccessInfo(
      accessToken: map['access_token'],
      expiresIn: map['expires_in'],
      refreshToken: map['refresh_token'],
      tokenType: map['token_type'],
    );
  }

  static Map<String, dynamic> toMap(AccessInfo entity) {
    return {
      'access_token': entity.accessToken,
      'expires_in': entity.expiresIn,
      'refresh_token': entity.refreshToken,
      'token_type': entity.tokenType,
    };
  }

  static AccessInfo fromJson(String json) => fromMap(jsonDecode(json));

  static String toJson(AccessInfo entity) => json.encode(toMap(entity));
}
