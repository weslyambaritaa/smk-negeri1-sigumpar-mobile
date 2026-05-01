class AppConstants {
  // Mengambil URL dari argumen build, defaultnya ke IP lokal jika tidak ada argumen.
  // Cara run: flutter run --dart-define=BASE_URL=http://192.168.x.x/api
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://192.168.x.x/api', // TODO: Sesuaikan dengan IP Nginx
  );

  // URL untuk Token Keycloak
  static const String keycloakTokenUrl = String.fromEnvironment(
    'KEYCLOAK_URL',
    defaultValue: 'http://192.168.x.x/auth/realms/smkn1sigumpar/protocol/openid-connect/token',
  );
}