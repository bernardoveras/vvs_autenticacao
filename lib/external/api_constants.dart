class ApiConstants {
  const ApiConstants._();

  static String get authUrl => 'https://accountsservice.rotaexpressa.com.br/sts/connect/token';
  static String get authKeycloakUrl => 'https://keycloak.cplus.com.br/realms/vvssistemas/protocol/openid-connect/token';
  static String get userInfoKeycloakUrl => 'https://keycloak.cplus.com.br/realms/vvssistemas/protocol/openid-connect/userinfo';
  static String get userInfoUrl => 'https://accountsservice.rotaexpressa.com.br/sts/connect/userinfo';
}