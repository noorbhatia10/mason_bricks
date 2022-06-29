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

  set setUser(Auth0User user) {
    _prefs.setString(userObject, json.encode(user));
  }

  Auth0User? get getUser {
    final userJson = _prefs.getString(userObject) ?? '';
    if (userJson.isEmpty) {
      return null;
    }
    return Auth0User.fromJson(json.decode(userJson));
  }

  set setAuthenticatedUser(AuthenticatedUser user) {
    _prefs.setString(_authenticatedUser, json.encode(user.toJson()));
  }

  AuthenticatedUser? get getAuthenticatedUser {
    final userJson = _prefs.getString(_authenticatedUser) ?? '';
    if (userJson.isEmpty) {
      return null;
    }
    return AuthenticatedUser.fromJson(json.decode(userJson));
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

  static set newSFRequest(bool newRequest) {
    _prefs.setBool(isNewSFRequest, newRequest);
  }

  static bool get newSFRequest {
    return _prefs.getBool(isNewSFRequest) ?? false;
  }

  static set newAssistanceRequest(bool newRequest) {
    _prefs.setBool(isNewAssistanceRequest, newRequest);
  }

  static bool get newAssistanceRequest {
    return _prefs.getBool(isNewAssistanceRequest) ?? false;
  }

  static set productPlaceholder(String productPlaceholder) {
    _prefs.setString(_productKey, productPlaceholder);
  }

  static String get productPlaceholder {
    return _prefs.getString(_productKey) ?? '';
  }

  static set sizeProductGroupPlaceholder(String sizeProductGroupPlaceholder) {
    _prefs.setString(_sizeProductGroupKey, sizeProductGroupPlaceholder);
  }

  static String get sizeProductGroupPlaceholder {
    return _prefs.getString(_sizeProductGroupKey) ?? '';
  }

  static set colorSizeProductGroupPlaceholder(
      String colorSizeProductGroupPlaceholder) {
    _prefs.setString(
        _colorSizeProductGroupKey, colorSizeProductGroupPlaceholder);
  }

  static String get colorSizeProductGroupPlaceholder {
    return _prefs.getString(_colorSizeProductGroupKey) ?? '';
  }
}

mixin Clearable {
  Future<bool> clear();
}

const userObject = 'userObject';
const _accessToken = 'accessToken';
const _refreshToken = 'refreshToken';
const _authenticatedUser = 'authenticated_user';
const _userId = '_userId';
const _escapedUserId = '_escaped_user_id';
const userAuthTokenKey = 'userAuthTokenKey';
const isFirebaseTokenUpdatedKey = 'isFirebaseTokenUpdatedKey';
const firebaseDeviceTokenKey = 'firebaseDeviceTokenKey';
const isNewSFRequest = 'isNewSFRequest';
const isNewAssistanceRequest = 'isNewAssistanceRequest';
const _host = 'host';
const _productKey = 'productKey';
const _sizeProductGroupKey = 'sizeProductGroupKey';
const _colorSizeProductGroupKey = 'colorSizeProductGroupKey';
