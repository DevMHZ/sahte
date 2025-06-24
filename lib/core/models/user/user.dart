// import 'package:hive/hive.dart';

// part 'user.g.dart'; // مهم لتوليد كود Hive

// @HiveType(typeId: 1)
// class LocalUserModel extends HiveObject {
//   @HiveField(1)
//   final int id;

//   @HiveField(2)
//   final String name;

//   @HiveField(3)
//   final String email;

//   @HiveField(4)
//   final String? image;

//   @HiveField(5)
//   final String mobile;

//   @HiveField(6)
//   final List<String> roles;

//   @HiveField(7)
//   final List<String> permissions;
//   @HiveField(8)
//   final String section;

//   LocalUserModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.image,
//     required this.mobile,
//     required this.roles,
//     required this.section,
//     required this.permissions,
//   });

//   factory LocalUserModel.fromJson(Map<String, dynamic> json) {
//     final user = json['user'];
//     return LocalUserModel(
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
//     if (roles.any((role) => role.toLowerCase().contains('admin'))) {
//       return UserType.admin;
//     } else if (roles.any((role) => role.toLowerCase().contains('driver'))) {
//       return UserType.driver;
//     } else {
//       return UserType.employee;
//     }
//   }
// }
