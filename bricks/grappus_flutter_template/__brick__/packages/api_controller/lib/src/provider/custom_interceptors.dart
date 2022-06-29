import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.contentType = Headers.jsonContentType;
    return super.onRequest(options, handler);
  }
}
