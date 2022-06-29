/*
 * Created by Nimish Nandwana on 30/08/2021.
 * Description - 
 */

class Keys {
  factory Keys() {
    return _singleton;
  }

  Keys._internal();

  static final _singleton = Keys._internal();

  static late String baseUrl;
  static late String baseAuthUrl;
  static late String authClientId;

  @override
  String toString() {
    return 'Keys{ '
        'baseUrl -> $baseUrl\n'
        'baseAuthUrl -> $baseAuthUrl\n'
        'authClientId -> $authClientId\n'
        '}';
  }
}
