import 'access_info_mock.dart';

String get authSuccessResponseJsonMock => accessInfoMockJson;
String get authKeycloakSuccessResponseJsonMock => accessInfoKeycloakMockJson;
String get authErrorResponseJsonMock => '{"error": "invalid_grant"}';