import 'dart:convert';

import 'package:vvs_autenticacao/domain/entities/access_info.dart';

AccessInfo get accessInfoMock => AccessInfo(
      accessToken: accessInfoMockMap['access_token'],
      expiresIn: accessInfoMockMap['expires_in'],
      tokenType: accessInfoMockMap['token_type'],
      refreshToken: accessInfoMockMap['refresh_token'],
    );

Map<String, dynamic> get accessInfoMockMap => jsonDecode(accessInfoMockJson);

String get accessInfoMockJson => """
{
  "access_token":
  "urn:vvssistemas:securityToken:gzip:H4sIAAAAAAAEAI2QybayOBSFn4h/0YmXoSJdbsAL0k9ckKAEAVGkCU9f4VatqmmNkpyz98nZX0kBXyYHcibgOxI8AjVQFSba3pdwtQWX2IPd3QWs2Yrd6it6CFHGCyauGz403SEwdbEM07V8GO+sMwT/wvTtp8/+tx6of0oK6sJsmqLzb3nsbZ//+0adK9lkJkh0J2SG5NwMpBCzlvXHLFKrVHQbJDnb4qwfjZuf3WfUqm0eL83mxYkrpAnoC7qFiVYcGzSP1dSXgIBM1SiSI80St7IbnvWZlmzLR/X55EnOeiQw9hZnfXxcM11dystp7D9gnNJzwOonW3bEUE632a3xQcwbUzCnibtiUaWZBvAGFSf+M5H8vohZhloX3eCwuqsunU8H5mse6BcYOyUgbjvnzG/XT5JbPo8sR4H0N+uE4x2PJJa5y/pUDEeWk0/jSEYWYBzcCrbuVFx2BBF1xdYvlwr/zfSJLX9G63OColGnoiowvisSI4rbps4uO1pIfpUlFWMXsbo+Ms0HtoBCyeURVTdGE05AnSW/c5vSOvyTxdn9l2VHMsbACVLBOTmSEyDZsfg/Kez2UOYqbzELGQZyUdmYe1rLYTxzMNNuoq5Fn/ctjvb3t1gLgyxx636/HBblO6M7V/Xk+SvmTQAjfrms1ot4yqWzIOitHNJ4OGFjkvY1RUSUuNyL+k7/vur58eNcC344vW6tLR71plf9OFOSofe0vSIfLQM2g0emAp7j7BqttZof7/qB3u+duozRT6d3t9nTkgS1QVDVutkXhpYF8y6kCL84HVrvHMYkRcqXcLHxj1BeswkLt2X8ORVmdMzt2p3e4e7ZAqSdy6X5oOXQP40vn2sL5+sjGQrHgWvZyfks2POoPAfFI+v9JUYDdNBgga4BN1N7WTCcxuVqB1IpmvPdi+b7G6Kr9xcZMtiYvwMAAA==",
  "expires_in": 3600000,
  "refresh_token": "902f57c0fab84f0a71f0ce4f28b760ad",
  "token_type": "Bearer"
}
""";

String get accessInfoKeycloakMockJson => """
{
	"access_token": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJDUVhzYjFtTkV1VUlHQTdPWGoxRHVuME5EVW9Mdld3T2d2Sk1DRnVORnlvIn0.eyJleHAiOjE2NjM3NzA2OTEsImlhdCI6MTY2Mzc3MDM5MSwianRpIjoiNWQxMjkwZjctYmJkOS00YzRmLThlMWItYjRjNDQ0OTdjNDQzIiwiaXNzIjoiaHR0cHM6Ly9rZXljbG9hay5jcGx1cy5jb20uYnIvcmVhbG1zL3Z2c3Npc3RlbWFzIiwiYXVkIjoiYWNjb3VudCIsInN1YiI6IjIzNGIwNTA4LTJiMjAtNGE5Yy05YTVjLTdiZjUzZWVkM2U4OSIsInR5cCI6IkJlYXJlciIsImF6cCI6ImNlbnRyYWxkb2NsaWVudGUiLCJzZXNzaW9uX3N0YXRlIjoiN2RhM2Y0ODAtZGVlOS00ZDAzLWE0MTAtYjdkYjZiYjdmMTNiIiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy12dnNzaXN0ZW1hcyJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoiZW1haWwgcHJvZmlsZSIsInNpZCI6IjdkYTNmNDgwLWRlZTktNGQwMy1hNDEwLWI3ZGI2YmI3ZjEzYiIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJuYW1lIjoiVmluaWNpdXMgVmVyYXMgZG9zIFNhbnRvcyIsInByZWZlcnJlZF91c2VybmFtZSI6InZpbmljaXVzIiwiZ2l2ZW5fbmFtZSI6IlZpbmljaXVzIiwiZmFtaWx5X25hbWUiOiJWZXJhcyBkb3MgU2FudG9zIiwiZW1haWwiOiJ2aW5pY2l1c0B2dnNzaXN0ZW1hcy5jb20uYnIifQ.ThLJhufNJLmTpwtNCAZdNsOxHq3Ng2m7vQmqrIT47QgTbqEep93itqTA5M40f4C_i20L-OFnh1k2kSvG1fPhKw-F-ndLIn_VEdQ_eAY9A1czR1HG6qaAtJMLEBOeo9l1t4gjxW_rmGBkbM8xbgCXZan22_50Ej-Fi5DaljVJ5FIkf7UeCknMuhLNY9RON19VGkMTcqDg-sq6xTdEA_UNOajKWnPfZQrBCo_JLoqAJ8ZCMpzoIyYb24HrAEvhJJPW9qmMBJFXb0BY_352LM-PhOZbOVQ2NRhch5VEIFYAPBpgxTBMGxcp_Z8VOwuGUGIUQrMB8VExNYcw1WGeS-74ig",
	"expires_in": 300,
	"refresh_expires_in": 1800,
	"refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI3ZjgxZjA2MS0wYmQyLTQwMTgtODExYy1lODViYjNhZmE4YmQifQ.eyJleHAiOjE2NjM3NzIxOTEsImlhdCI6MTY2Mzc3MDM5MSwianRpIjoiMmRhOTQxYjEtNWNiYS00YzQ5LWI0MjUtZDUxOTI2NjZmY2FhIiwiaXNzIjoiaHR0cHM6Ly9rZXljbG9hay5jcGx1cy5jb20uYnIvcmVhbG1zL3Z2c3Npc3RlbWFzIiwiYXVkIjoiaHR0cHM6Ly9rZXljbG9hay5jcGx1cy5jb20uYnIvcmVhbG1zL3Z2c3Npc3RlbWFzIiwic3ViIjoiMjM0YjA1MDgtMmIyMC00YTljLTlhNWMtN2JmNTNlZWQzZTg5IiwidHlwIjoiUmVmcmVzaCIsImF6cCI6ImNlbnRyYWxkb2NsaWVudGUiLCJzZXNzaW9uX3N0YXRlIjoiN2RhM2Y0ODAtZGVlOS00ZDAzLWE0MTAtYjdkYjZiYjdmMTNiIiwic2NvcGUiOiJlbWFpbCBwcm9maWxlIiwic2lkIjoiN2RhM2Y0ODAtZGVlOS00ZDAzLWE0MTAtYjdkYjZiYjdmMTNiIn0.wcvWcOb3HhU7ShB_m2hydVL5tw2qrrNIueomfJtv860",
	"token_type": "Bearer",
	"not-before-policy": 1663557345,
	"session_state": "7da3f480-dee9-4d03-a410-b7db6bb7f13b",
	"scope": "email profile"
}
""";
