import 'package:hive/hive.dart';
import 'package:sahte/core/services/dio_factory.dart';

class AuthStorageHelper {
  static const String _tokenKey = 'auth_token';
  static const String _authBoxName = 'auth_box';

  /// Save the authentication token
  static Future<void> saveToken(String token) async {
    final box = await Hive.openBox(_authBoxName);
    await box.put(_tokenKey, token);
    print('✅ Token saved successfully');
  }

  /// Get the stored authentication token
  static Future<String?> getToken() async {
    final box = await Hive.openBox(_authBoxName);
    return box.get(_tokenKey);
  }

  /// Check if token exists
  static Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  /// Remove the stored token (logout)
  static Future<void> removeToken() async {
    final box = await Hive.openBox(_authBoxName);
    await box.delete(_tokenKey);
    print('🗑️ Token removed successfully');
  }

  /// Logout - remove token and clear Dio headers
  static Future<void> logout() async {
    await removeToken();
    DioFactory.removeTokenFromHeaders();
    print('🚪 Logout completed');
  }

  /// Clear all auth data
  static Future<void> clearAuthData() async {
    final box = await Hive.openBox(_authBoxName);
    await box.clear();
    DioFactory.removeTokenFromHeaders();
    print('🧹 All auth data cleared');
  }

  /// Get token synchronously (for immediate use)
  static String? getTokenSync() {
    try {
      final box = Hive.box(_authBoxName);
      return box.get(_tokenKey);
    } catch (e) {
      print('⚠️ Error getting token synchronously: $e');
      return null;
    }
  }

  /// Check if token exists synchronously
  static bool hasTokenSync() {
    final token = getTokenSync();
    return token != null && token.isNotEmpty;
  }
} 