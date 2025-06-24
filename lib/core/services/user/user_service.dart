// import 'package:hive/hive.dart';
// import 'package:logistic_app/core/models/user/user.dart';

// class UserService {
//   static final Box<LocalUserModel> _userBox = Hive.box<LocalUserModel>('user');
//   static final Box<String> _tokenBox = Hive.box<String>('token');

//   /// Save or Update User
//   static Future<void> saveUser(LocalUserModel user, {String? token}) async {
//     print('✅ Saving user...');
//     await _userBox.put('user', user);
//     if (token != null) {
//       await _tokenBox.put('token', token);
//     }
//   }

//   /// Get the saved user
//   static LocalUserModel? getUser() {
//     return _userBox.get('user');
//   }

//   /// Get the saved token
//   static String? getToken() {
//     return _tokenBox.get('token');
//   }

//   /// Update specific fields for User
//   static Future<void> updateUser({
//     String? name,
//     String? email,
//     String? image,
//     String? section,
    
//     String? mobile,
//     List<String>? roles,
//     List<String>? permissions,
//   }) async {
//     LocalUserModel? currentUser = _userBox.get('user');

//     if (currentUser != null) {
//       final updatedUser = LocalUserModel(
//         id: currentUser.id,
//         name: name ?? currentUser.name,
//         section: section ?? currentUser.section,
//         email: email ?? currentUser.email,
//         image: image ?? currentUser.image,
//         mobile: mobile ?? currentUser.mobile,
//         roles: roles ?? currentUser.roles,
//         permissions: permissions ?? currentUser.permissions,
//       );
//       await _userBox.put('user', updatedUser);
//     }
//   }

//   /// Update the token only
//   static Future<void> updateToken(String token) async {
//     print('🔄 Updating token...');
//     await _tokenBox.put('token', token);
//   }

//   /// Delete user and token
//   static Future<void> deleteUser() async {
//     print('🗑️ Deleting user and token...');
//     await _userBox.delete('user');
//     await _tokenBox.delete('token');
//   }

//   /// Check if user exists
//   static bool userExists() {
//     return _userBox.containsKey('user');
//   }

//   /// Check if token exists
//   static bool tokenExists() {
//     return _tokenBox.containsKey('token');
//   }
// }
