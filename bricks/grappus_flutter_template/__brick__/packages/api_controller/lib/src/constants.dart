//Created by Nimish Nandwana on 17/05/2021.

import '../api_controller.dart';

const appMethodChannel = '';
const loginMethodName = 'login';
const logoutMethodName = 'logout';

String getBaseURL(String? host) {
  var uri = Uri.parse(Keys.baseUrl);
  if (host != null) {
    uri = uri.replace(host: '$host.${uri.host}');
  }
  return uri.toString();
}

class DevConstants {
  static const String backendBaseUrl = '';
  static const String baseAuthUrl = '';
  static const String authClientId = '';
}

class MockServerConstants {
  static const String backendBaseUrl = '';
  static const String baseAuthUrl = '';
  static const String authClientId = '';
}

class ProdConstants {
  static const String backendBaseUrl = '';
  static const String baseAuthUrl = '';
  static const String authClientId = '';
}

class Auth0Constants {
  static const LOGIN_SCOPE = ['openid', 'profile', 'offline_access'];
  static const PROMT_LOGIN = 'login';
  static const AUTH0_REDIRECT_URI = '';
  static final AUTH_CODE_REGEX = RegExp('code=(.*)&state=');
  static final ENTER_PASSWORD_REGEX = '';
}

class KDateFormats {
  static const DATE_FORMAT_1 = "yyyy-MM-dd";
  static const DATE_FORMAT_2 = "yyyy/MM/dd";
  static const DATE_FORMAT_3 = "dd/MM/yy";
  static const DATE_FORMAT_4 = "EEEE | d MMM yyy";
  static const DATE_FORMAT_5 = "d' 'MMM' '''yy";
  static const DATE_FORMAT_6 = "d MMM yyy";
  static const DATE_FORMAT_7 = "hh:mma";
  static const DATE_FORMAT_8 = "dd/MM";
  static const DATE_FORMAT_9 = "dd MMM | hh:mm a";
  static const DATE_FORMAT_10 = "dd MMM, hh:mm a";
}

class KTimeFormat {
  static const timeFormat1 = 'hh:mm a';
  static const timeFormat2 = 'HH:mm';
  static const timeFormat3 = 'hh:mm';
}

const shortestSideInPixels = 600;
