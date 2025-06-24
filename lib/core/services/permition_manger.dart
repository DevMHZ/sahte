// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
 

// class PermissionManager {
//   static late UserModel _user;

//   static void init(UserModel user) {
//     _user = user;
//   }

//   static bool hasPermission(String permission) {
//     return _user.permissions.contains(permission);
//   }

//   static bool hasRole(String role) {
//     return _user.roles.contains(role);
//   }
// }
// enum UserType { admin, employee, driver }
// void navigateAfterLogin(BuildContext context, UserModel user) {
//   if (UserService.userExists()==false) {
//       UserService.saveUser(LocalUserModel(id: user.id, name: user.name, email: user.email, image: user.image, mobile: user.mobile, roles: user.roles, permissions:user.permissions,section: user.section));
//   }
//   switch (user.userType) {

//     case UserType.admin:
//       // context.go(RouteNames.managerHome);
//       context.go(RouteNames.employeeHome);
//       break;
//     case UserType.employee:
//       context.go(RouteNames.employeeHome);
//       break;
//     case UserType.driver:
//       context.go(RouteNames.driverHome);
//       break;
//   }
// }
