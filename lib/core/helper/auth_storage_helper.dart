import 'package:hive/hive.dart';

class AuthStorageHelper {
  static const String _boxName = 'loginBox';

  static const String _tokenKey = 'access_token';
  static const String _roleKey = 'role';
  static const String _userIdKey = 'user_id';
  static const String _userNameKey = 'user_name';
  static const String _isLoggedInKey = 'isLoggedIn';
 static Future<void> saveToken({
    required String token,
  }) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_tokenKey, token);
    await box.put(_isLoggedInKey, true);
  }
  static Future<void> saveAuthData({
    required String token,
    required String role,
    required String userId,
    required String userName,
  }) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_tokenKey, token);
    await box.put(_roleKey, role);
    await box.put(_userIdKey, userId);
    await box.put(_userNameKey, userName);
    await box.put(_isLoggedInKey, true);
  }

  static Future<void> clearAuthData() async {
    final box = await Hive.openBox(_boxName);
    await box.clear();
  }

  static Future<String?> getToken() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_tokenKey);
  }

  static Future<String?> getRole() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_roleKey);
  }

  static Future<String?> getUserId() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_userIdKey);
  }

  static Future<String?> getUserName() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_userNameKey);
  }

  static Future<bool> isLoggedIn() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_isLoggedInKey, defaultValue: false);
  }
}
