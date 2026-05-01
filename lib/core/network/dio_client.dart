import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // Dibutuhkan untuk kDebugMode
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/app_constants.dart';
import '../storage/secure_storage_service.dart';
import 'auth_interceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // Pasang interceptor autentikasi
  dio.interceptors.add(AuthInterceptor(secureStorage));

  // LogInterceptor hanya aktif saat debug mode
  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }

  return dio;
});