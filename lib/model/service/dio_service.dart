import 'package:dio/dio.dart';
import 'package:e_commerce_complete_fake_api/model/core/api_urls.dart';

class DioService {
  static final DioService _singleton = DioService._internal();
  late final Dio? _dio;

  factory DioService() {
    return _singleton;
  }

  DioService._internal() {
    setup();
  }

  Future<void> setup() async {
    _dio = Dio(BaseOptions(
      baseUrl: ApiUrls().baseUrl,
    ));
    _dio!.interceptors.add(LogInterceptor(
        requestBody: true, responseBody: true,requestHeader: true,responseHeader: true
    ));
  }

  Future<Response?> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio!.get(path, queryParameters: queryParameters);
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }
}

