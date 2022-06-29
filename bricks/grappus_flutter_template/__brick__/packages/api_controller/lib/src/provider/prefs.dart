/*
 * Created by Nimish Nandwana on 17/11/2021.
 * Description -
 */

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../api_controller.dart';

class Prefs with Clearable {
  factory Prefs() {
    return _singleton;
  }

  static late SharedPreferences _prefs;

  Prefs._internal() {
    init();
  }

  static final _singleton = Prefs._internal();

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> clear() {
    return _prefs.clear();
  }

  static bool get isLoggedIn {
    return userAuthToken.isNotEmpty;
  }

  static set authToken(String token) {
    _prefs.setString(userAuthTokenKey, token);
  }

  static String get userAuthToken {
    return _prefs.getString(userAuthTokenKey) ?? '';
  }

  set firebaseTokenUpdated(bool updated) {
    _prefs.setBool(isFirebaseTokenUpdatedKey, updated);
  }

  bool get firebaseTokenUpdated {
    return _prefs.getBool(isFirebaseTokenUpdatedKey) ?? false;
  }

  static set firebaseDeviceToken(String deviceToken) {
    _prefs.setString(firebaseDeviceTokenKey, deviceToken);
  }

  static String get firebaseDeviceToken {
    return _prefs.getString(firebaseDeviceTokenKey) ?? '';
  }

  set setAccessToken(String value) {
    _prefs.setString(_accessToken, value);
  }

  get accessToken {
    return _prefs.getString(_accessToken);
  }

  set setRefreshToken(String value) {
    _prefs.setString(_refreshToken, value);
  }

  String? get refreshToken {
    return _prefs.getString(_refreshToken);
  }

  

  set setUserId(String userId) {
    _prefs.setString(_userId, userId);
  }

  String get getUserId {
    return _prefs.getString(_userId) ?? '';
  }

  set setHost(String host) {
    _prefs.setString(_host, host);
  }

  String? get getHost {
    return _prefs.getString(_host);
  }

  set setEscapedUserId(String userId) {
    _prefs.setString(_escapedUserId, userId);
  }

  String get getEscapedUserId {
    return _prefs.getString(_escapedUserId) ?? '';
  }


}

mixin Clearable {
  Future<bool> clear();
}

const userObject = 'userObject';
const _accessToken = 'accessToken';
const _refreshToken = 'refreshToken';
const _userId = '_userId';
const _escapedUserId = '_escaped_user_id';
const userAuthTokenKey = 'userAuthTokenKey';
const isFirebaseTokenUpdatedKey = 'isFirebaseTokenUpdatedKey';
const firebaseDeviceTokenKey = 'firebaseDeviceTokenKey';
const _host = 'host';

