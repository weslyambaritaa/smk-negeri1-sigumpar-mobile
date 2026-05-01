class AppConstants {
  // Gunakan 10.0.2.2 karena kamu mendevelop di Emulator Android
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://10.0.2.2:8001/api',
  );

  // URL untuk Token Keycloak
  static const String keycloakTokenUrl = String.fromEnvironment(
    'KEYCLOAK_URL',
    defaultValue: 'http://10.0.2.2:8080/auth/realms/smkn1sigumpar/protocol/openid-connect/token',
  );
}