
import 'dart:convert';

import 'package:vvs_autenticacao/domain/entities/usuario.dart';

Usuario get usuarioMock => Usuario(
      id: usuarioMockMap['http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/id'],
      email: usuarioMockMap['http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/email'],
      login: usuarioMockMap['http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/login'],
      nome: usuarioMockMap['http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/nome'],
      telefonePrincipal: usuarioMockMap['http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/telefoneprincipal'],
      accessInfo: null,
    );

Usuario get usuarioKeycloakMock => Usuario(
      id: usuarioKeycloakMockMap['sub'],
      email: usuarioKeycloakMockMap['email'],
      login: usuarioKeycloakMockMap['email'],
      nome: usuarioKeycloakMockMap['name'],
      telefonePrincipal: '',
      accessInfo: null,
    );

Map<String, dynamic> get usuarioMockMap => jsonDecode(usuarioMockJson);

String get usuarioMockJson => """
{
  "sub": "07f121bc-714f-4ed3-aa01-2ea3ccc55c07",
  "locale": "pt-BR",
  "updated_at": "4/19/2022 12:00:00 PM",
  "profile": "http://api-identitymanager.desenvolvimento.vvssistemas.com.br",
  "website": "http://api-identitymanager.desenvolvimento.vvssistemas.com.br",
  "family_name": "Administrador",
  "zoneinfo": "Brasil/Rio de Janeiro",
  "given_name": "Administrador",
  "picture": "http://api-identitymanager.desenvolvimento.vvssistemas.com.br",
  "name": "Administrador",
  "nickname": "administrador@vvssistemas.com.br",
  "preferred_username": "Administrador",
  "middle_name": "",
  "http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/email": "administrador@vvssistemas.com.br",
  "http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/login": "administrador@vvssistemas.com.br",
  "http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/nome": "Administrador",
  "http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/id": "07f121bc-714f-4ed3-aa01-2ea3ccc55c07",
  "http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/telefoneprincipal": "2424753748",
  "http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/gruposEmpresa": "",
  "http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/gruposEmpresaResponsavel": ""
}
""";

String get usuarioKeycloakMockJson => """
{
	"sub": "234b0508-2b20-4a9c-9a5c-7bf53eed3e89",
	"email_verified": true,
	"name": "Vinicius Veras dos Santos",
	"preferred_username": "vinicius",
	"given_name": "Vinicius",
	"family_name": "Veras dos Santos",
	"email": "vinicius@vvssistemas.com.br"
}
""";

Map<String, dynamic> get usuarioKeycloakMockMap => jsonDecode(usuarioKeycloakMockJson);

Map<String, dynamic> get usuarioViniciusMockMap => jsonDecode(usuarioViniciusMockJson);

String get usuarioViniciusMockJson => """
{
	"sub": "aaae9987-6f38-4b5f-8548-6cc61236b807",
	"http://schemas.vvssistemas.com.br/ws/identity/permissao": "",
	"http://schemas.vvssistemas.com.br/ws/identity/claims/recurso/": [
		"{\\"Serial\\":\\"006490\\",\\"Recursos\\":[\\"urn:vvssistemas:modulo:centralDoCliente:arquivos\\",\\"urn:vvssistemas:modulo:centralDoCliente:atendimentos\\",\\"urn:vvssistemas:modulo:centralDoCliente:controleDeAcesso\\",\\"urn:vvssistemas:modulo:centralDoCliente:ferramentas\\",\\"urn:vvssistemas:modulo:centralDoCliente:financeiro\\",\\"urn:vvssistemas:modulo:centralDoCliente:licencas\\",\\"urn:vvssistemas:modulo:centralDoCliente:revenda\\"]}",
		"{\\"Serial\\":\\"009998\\",\\"Recursos\\":[\\"urn:vvssistemas:modulo:centralDoCliente:arquivos\\",\\"urn:vvssistemas:modulo:centralDoCliente:atendimentos\\",\\"urn:vvssistemas:modulo:centralDoCliente:controleDeAcesso\\",\\"urn:vvssistemas:modulo:centralDoCliente:ferramentas\\",\\"urn:vvssistemas:modulo:centralDoCliente:financeiro\\",\\"urn:vvssistemas:modulo:centralDoCliente:licencas\\",\\"urn:vvssistemas:modulo:centralDoCliente:revenda\\"]}",
		"{\\"Serial\\":\\"002718\\",\\"Recursos\\":[\\"urn:vvssistemas:modulo:centralDoCliente:arquivos\\",\\"urn:vvssistemas:modulo:centralDoCliente:atendimentos\\",\\"urn:vvssistemas:modulo:centralDoCliente:controleDeAcesso\\",\\"urn:vvssistemas:modulo:centralDoCliente:ferramentas\\",\\"urn:vvssistemas:modulo:centralDoCliente:financeiro\\",\\"urn:vvssistemas:modulo:centralDoCliente:licencas\\",\\"urn:vvssistemas:modulo:centralDoCliente:revenda\\"]}",
		"{\\"Serial\\":\\"032533\\",\\"Recursos\\":[\\"urn:vvssistemas:modulo:centralDoCliente:arquivos\\",\\"urn:vvssistemas:modulo:centralDoCliente:atendimentos\\",\\"urn:vvssistemas:modulo:centralDoCliente:controleDeAcesso\\",\\"urn:vvssistemas:modulo:centralDoCliente:ferramentas\\",\\"urn:vvssistemas:modulo:centralDoCliente:financeiro\\",\\"urn:vvssistemas:modulo:centralDoCliente:licencas\\",\\"urn:vvssistemas:modulo:centralDoCliente:revenda\\"]}",
		"{\\"Serial\\":\\"004210\\",\\"Recursos\\":[\\"urn:vvssistemas:modulo:centralDoCliente:arquivos\\",\\"urn:vvssistemas:modulo:centralDoCliente:atendimentos\\",\\"urn:vvssistemas:modulo:centralDoCliente:controleDeAcesso\\",\\"urn:vvssistemas:modulo:centralDoCliente:ferramentas\\",\\"urn:vvssistemas:modulo:centralDoCliente:financeiro\\",\\"urn:vvssistemas:modulo:centralDoCliente:licencas\\",\\"urn:vvssistemas:modulo:centralDoCliente:revenda\\"]}",
		"{\\"Serial\\":\\"002086\\",\\"Recursos\\":[\\"urn:vvssistemas:modulo:centralDoCliente:arquivos\\",\\"urn:vvssistemas:modulo:centralDoCliente:atendimentos\\",\\"urn:vvssistemas:modulo:centralDoCliente:controleDeAcesso\\",\\"urn:vvssistemas:modulo:centralDoCliente:ferramentas\\",\\"urn:vvssistemas:modulo:centralDoCliente:financeiro\\",\\"urn:vvssistemas:modulo:centralDoCliente:licencas\\",\\"urn:vvssistemas:modulo:centralDoCliente:revenda\\"]}",
		"{\\"Serial\\":\\"002015\\",\\"Recursos\\":[\\"urn:vvssistemas:modulo:centralDoCliente:arquivos\\",\\"urn:vvssistemas:modulo:centralDoCliente:atendimentos\\",\\"urn:vvssistemas:modulo:centralDoCliente:controleDeAcesso\\",\\"urn:vvssistemas:modulo:centralDoCliente:ferramentas\\",\\"urn:vvssistemas:modulo:centralDoCliente:financeiro\\",\\"urn:vvssistemas:modulo:centralDoCliente:licencas\\",\\"urn:vvssistemas:modulo:centralDoCliente:revenda\\",\\"urn:vvssistemas:modulo:centralDoCliente:administradorVVSSistemas\\",\\"urn:vvssistemas:modulo:centralDoCliente:arquivos\\",\\"urn:vvssistemas:modulo:centralDoCliente:atendimentos\\",\\"urn:vvssistemas:modulo:centralDoCliente:controleDeAcesso\\",\\"urn:vvssistemas:modulo:centralDoCliente:ferramentas\\",\\"urn:vvssistemas:modulo:centralDoCliente:financeiro\\",\\"urn:vvssistemas:modulo:centralDoCliente:licencas\\",\\"urn:vvssistemas:modulo:centralDoCliente:revenda\\"]}",
		"{\\"Serial\\":\\"021003\\",\\"Recursos\\":[\\"urn:vvssistemas:modulo:centralDoCliente:arquivos\\",\\"urn:vvssistemas:modulo:centralDoCliente:atendimentos\\",\\"urn:vvssistemas:modulo:centralDoCliente:controleDeAcesso\\",\\"urn:vvssistemas:modulo:centralDoCliente:ferramentas\\",\\"urn:vvssistemas:modulo:centralDoCliente:financeiro\\",\\"urn:vvssistemas:modulo:centralDoCliente:licencas\\",\\"urn:vvssistemas:modulo:centralDoCliente:revenda\\"]}",
		"{\\"Serial\\":\\"003582\\",\\"Recursos\\":[\\"urn:vvssistemas:modulo:centralDoCliente:arquivos\\",\\"urn:vvssistemas:modulo:centralDoCliente:atendimentos\\",\\"urn:vvssistemas:modulo:centralDoCliente:controleDeAcesso\\",\\"urn:vvssistemas:modulo:centralDoCliente:ferramentas\\",\\"urn:vvssistemas:modulo:centralDoCliente:financeiro\\",\\"urn:vvssistemas:modulo:centralDoCliente:licencas\\",\\"urn:vvssistemas:modulo:centralDoCliente:revenda\\"]}"
	],
	"locale": "pt-BR",
	"updated_at": "5/10/2022 12:56:20 PM",
	"profile": "http://api-identitymanager.desenvolvimento.vvssistemas.com.br",
	"website": "http://api-identitymanager.desenvolvimento.vvssistemas.com.br",
	"family_name": "Santos",
	"zoneinfo": "Brasil/Rio de Janeiro",
	"given_name": "Vinicius",
	"picture": "http://api-identitymanager.desenvolvimento.vvssistemas.com.br",
	"name": "Vinicius Veras dos Santos",
	"nickname": "vinicius@vvssistemas.com.br",
	"preferred_username": "Vinicius Veras dos Santos",
	"middle_name": "Verasdos",
	"http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/email": "vinicius@vvssistemas.com.br",
	"http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/login": "vinicius@vvssistemas.com.br",
	"http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/nome": "Vinicius Veras dos Santos",
	"http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/id": "aaae9987-6f38-4b5f-8548-6cc61236b807",
	"http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/telefoneprincipal": "",
	"http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/gruposEmpresa": [
		"006490",
		"009998",
		"002718",
		"032533",
		"004210",
		"002086",
		"002015",
		"021003",
		"003582"
	],
	"http://schemas.vvssistemas.com.br/ws/identity/claims/usuario/gruposEmpresaResponsavel": [
		"006490",
		"009998",
		"002718",
		"032533",
		"004210",
		"002086",
		"002015",
		"021003",
		"003582"
	]
}
""";
