//Created by Nimish Nandwana on 17/11/2021.

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../api_controller.dart';
import '../api_constants.dart';
import 'custom_interceptors.dart';

///var s1 = DioProvider();
///var s2 = DioProvider();
///print(identical(s1, s2));  // true
///print(s1 == s2);           // true

class DioProvider {
  //return the previously created instance
  factory DioProvider() {
    return _instance;
  }

  // private constructor restricted to this class itself
  DioProvider._internal();

  static final DioProvider _instance = DioProvider._internal();

  static Function()? forceLogout;

  static Dio? _dio;

  static Dio getDio({bool forceRefresh = false}) {
    if (_dio != null && !forceRefresh) {
      return _dio!;
    }
    _dio = Dio();
    // _dio!.addSentry(
    //   captureFailedRequests: true,
    // );

    final reqHeaders = {'Authorization': 'Bearer ${Prefs().accessToken}'};

    final dioOptions = BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: reqHeaders,
    )..baseUrl = getBaseURL(Prefs().getHost);

    _dio!.options = dioOptions;
    //_dio!.interceptors.add(AliceProvider().getAlice.getDioInterceptor());
    _dio!.interceptors.add(CustomInterceptor());
    _dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ));
    // _dio!.interceptors.add(refreshTokenInterceptor());

    return _dio!;
  }

  static Dio getCustomDio() {
    final customDio = Dio();
    // customDio.addSentry(
    //   captureFailedRequests: true,
    // );

    final reqHeaders = <String, String>{};

    final dioOptions = BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: reqHeaders,
    );

    customDio.options = dioOptions;
    //customDio.interceptors.add(AliceProvider().getAlice.getDioInterceptor());
    customDio.interceptors.add(CustomInterceptor());
    customDio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ));
    // customDio.interceptors.add(refreshTokenInterceptor());

    return customDio;
  }

  // static QueuedInterceptorsWrapper refreshTokenInterceptor() =>
  //     QueuedInterceptorsWrapper(onError: ((e, handler) async {
  //       if (e.response?.statusCode == 401) {
  //         try {
  //           if (e.requestOptions.path == apiRefreshToken) {
  //             throw Exception('Refresh Token Expired!');
  //           }
  //           final prefs = Prefs();
  //           final refreshTokenResponse =
  //               await ApiProvider().getAuthenticatedUser(prefs.refreshToken!);

  //           refreshTokenResponse.fold((error) {
  //             throw Exception(error.errorMessage);
  //           }, (refreshTokenUser) async {
  //             prefs
  //               ..setUser = Auth0User(
  //                 name: refreshTokenUser.name,
  //                 picture: refreshTokenUser.profilePicture,
  //                 userId: refreshTokenUser.userId,
  //                 nickname: refreshTokenUser.nickName,
  //                 updatedAt: refreshTokenUser.updatedAt,
  //               )
  //               ..setUserId = refreshTokenUser.userId
  //               ..setAuthenticatedUser = refreshTokenUser
  //               ..setAccessToken = refreshTokenUser.accessToken
  //               ..setHost = getHost(refreshTokenUser.accessToken)
  //               ..setRefreshToken = refreshTokenUser.refreshToken;

  //             e.requestOptions.headers["Authorization"] =
  //                 "Bearer " + refreshTokenUser.accessToken;
  //             final opts = new Options(
  //                 method: e.requestOptions.method,
  //                 headers: e.requestOptions.headers);
  //             final cloneReq = await _dio!.request(e.requestOptions.path,
  //                 options: opts,
  //                 data: e.requestOptions.data,
  //                 queryParameters: e.requestOptions.queryParameters);
  //             return handler.resolve(cloneReq);
  //           });
  //         } catch (ex) {
  //           //logout user & redirect to login screen
  //           if (forceLogout != null) {
  //             forceLogout!();
  //           }
  //           handler.reject(e);
  //         }
  //       } else {
  //         handler.next(e);
  //       }
  //     }));
}
