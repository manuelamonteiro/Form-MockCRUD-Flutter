import 'package:crud_app/user_form.dart';
import 'package:crud_app/user_list.dart';
import 'package:crud_app/user_provider.dart';
import 'package:crud_app/user_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        title: 'CRUD APP',
        home: const UserForm(),
        routes: {
          "/create": (_) => const UserForm(),
          "/list": (_) => const UserList(),
          "/show": (_) => UserView(),
        },
      ),
    );
  }
}
