import 'package:dio/dio.dart';
import '../storage/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService _secureStorage;

  AuthInterceptor(this._secureStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Ambil token dari storage
    final token = await _secureStorage.getAccessToken();

    // Kalau token ada, sisipkan ke header Authorization
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // Melanjutkan request (Modern approach)
    handler.next(options);
  }
}