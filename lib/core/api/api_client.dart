import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:production_ready_flutter_app/core/api/api_config.dart';

class ApiClient {
  Dio getDio() {
    Dio dio = Dio();

    dio.options.baseUrl = ApiConfig.BASE_URL;
    dio.interceptors.add(
      PrettyDioLogger(
        compact: false,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );

    return dio;
  }
}
