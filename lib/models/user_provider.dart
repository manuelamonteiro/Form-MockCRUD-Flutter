import 'package:crud_app/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends InheritedWidget {
  @override
  final Widget child;
  final List<User> users = [];
  User? userSelected;
  int? indexUser;

  UserProvider({
    super.key,
    required this.child,
  }) : super(child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return true;
  }
}
