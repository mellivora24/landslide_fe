import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:landslide_fe/service/base_connect.dart';
import 'package:landslide_fe/utils/widget/loading_interceptor.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;
  static NetworkService get instance => _instance;

  late Dio dio;
  late BaseConnect baseConnect;

  // Quản lý trạng thái loading
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  NetworkService._internal() {
    baseConnect = BaseConnect();
    dio = baseConnect.httpClient;

    // Thêm interceptor
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    // Thêm LoadingInterceptor
    dio.interceptors.add(LoadingInterceptor(isLoading));
  }

  BaseConnect getBaseConnect() => baseConnect;

  // Phương thức cập nhật URL cho Dio
  void updateBaseUrl(String newBaseUrl) {
    dio.options.baseUrl = newBaseUrl;
    print('--Dio baseUrl updated to: $newBaseUrl--');
  }
}
