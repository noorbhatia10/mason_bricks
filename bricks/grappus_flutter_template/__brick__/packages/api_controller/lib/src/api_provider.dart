import 'dart:collection';
import 'dart:convert';
import 'package:api_controller/src/provider/dio_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../api_controller.dart';
import 'api_constants.dart';
import 'models/response/select_realm/select_realm_response.dart';

class ApiProvider {
  factory ApiProvider() {
    return _instance;
  }

  ApiProvider._internal();

  static final ApiProvider _instance = ApiProvider._internal();
  Dio _dio = DioProvider.getDio();

  void setForcedLogout(Function() forceLogout) {
    DioProvider.forceLogout = forceLogout;
  }

  void refreshDio() {
    _dio = DioProvider.getDio(forceRefresh: true);
  }

 
}
