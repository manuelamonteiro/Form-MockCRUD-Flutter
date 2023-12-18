import 'package:crud_app/widgets/container_all.dart';
import 'package:crud_app/widgets/field_form.dart';
import 'package:crud_app/models/user_provider.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  UserView({super.key});

  String title = "Show User";
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;
    int? index;

    if (userProvider.indexUser != null) {
      index = userProvider.indexUser;
      controllerName.text = userProvider.userSelected!.name;
      controllerEmail.text = userProvider.userSelected!.email;
      controllerPassword.text = userProvider.userSelected!.password;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            margin: const EdgeInsets.all(8),
            child: TextButton(
              child: const Text("User List"),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/list");
              },
            ),
          )
        ],
      ),
      body: ContainerAll(
        child: Center(
            child: Column(children: [
          FieldForm(
            label: "Name",
            isPassword: false,
            controller: controllerName,
            isForm: false,
            isEmail: false,
          ),
          const SizedBox(height: 16),
          FieldForm(
            label: "E-mail",
            isPassword: false,
            controller: controllerEmail,
            isForm: false,
            isEmail: true,
          ),
          const SizedBox(height: 16),
          FieldForm(
            label: "Password",
            isPassword: false,
            controller: controllerPassword,
            isForm: false,
            isEmail: false,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                userProvider.indexUser = null;
                userProvider.users.removeAt(index!);
                Navigator.popAndPushNamed(context, "/create");
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              child: const Text("Delete"),
            ),
          )
        ])),
      ),
    );
  }
}
