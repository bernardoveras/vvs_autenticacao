import 'package:equatable/equatable.dart';

class AccessInfo extends Equatable {
  final String accessToken;
  final int expiresIn;
  final String refreshToken;
  final String tokenType;

  const AccessInfo({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.tokenType,
  });

  AccessInfo copyWith({
    String? accessToken,
    int? expiresIn,
    String? refreshToken,
    String? tokenType,
  }) {
    return AccessInfo(
      accessToken: accessToken ?? this.accessToken,
      expiresIn: expiresIn ?? this.expiresIn,
      refreshToken: refreshToken ?? this.refreshToken,
      tokenType: tokenType ?? this.tokenType,
    );
  }

  @override
  List<Object?> get props => [accessToken, expiresIn, refreshToken, tokenType];
}
