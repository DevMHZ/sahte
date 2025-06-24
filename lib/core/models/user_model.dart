// import 'package:logistic_app/core/services/permition_manger.dart';

// class UserModel {
//   final int id;
//   final String name;
//   final String email;
//   final String? image;
//   final String mobile;
//   final String section;

//   final List<String> roles;
//   final List<String> permissions;

//   UserModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.image,
//     required this.mobile,
//     required this.section,
//     required this.roles,
//     required this.permissions,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     final user = json['data']['user']; // Fix the nested structure

//     return UserModel(
//       id: user['id'],
//       name: user['name'],
//       email: user['email'],
//       image: user['image'], 
//       mobile: user['mobile'],
//       section: user['section'],
//       roles: List<String>.from(user['roles'] ?? []),
//       permissions: List<String>.from(user['permissions'] ?? []),
//     );
//   }

//   UserType get userType {
//     final lowerRoles = roles.map((e) => e.toLowerCase()).toList();
//     if (lowerRoles.any((role) => role.contains('direct manager'))) {
//       return UserType.admin;
//     } else if (lowerRoles.any((role) => role.contains('driver'))) {
//       return UserType.driver;
//     } else {
//       return UserType.employee;
//     }
//   }
// }
