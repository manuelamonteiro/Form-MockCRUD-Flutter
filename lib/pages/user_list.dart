import 'package:crud_app/widgets/container_all.dart';
import 'package:crud_app/models/user.dart';
import 'package:crud_app/providers/user_provider.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    List<User> users = userProvider.users;
    int usersLength = users.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
        leading: BackButton(
          onPressed: () {
            userProvider.indexUser = null;
            Navigator.popAndPushNamed(context, "/create");
            },
        ),
      ),
      body: ContainerAll(
        child: ListView.builder(
            itemCount: usersLength,
            itemBuilder: (BuildContext contextBuilder, indexBuilder) => Container(
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.4))),
                  child: ListTile(
                    title: Text(users[indexBuilder].name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () {
                          userProvider.userSelected = users[indexBuilder];
                          userProvider.indexUser = indexBuilder;
                          Navigator.popAndPushNamed(context, "/create");
                        }, icon: const Icon(Icons.edit)),
                        IconButton(onPressed: () {
                          userProvider.userSelected = users[indexBuilder];
                          userProvider.indexUser = indexBuilder;
                          Navigator.popAndPushNamed(context, "/show");
                        }, icon: const Icon(Icons.visibility, color: Colors.blue,)),
                         IconButton(onPressed: () {
                          userProvider.indexUser = null;
                          userProvider.users.removeAt(indexBuilder);
                          Navigator.popAndPushNamed(context, "/create");
                        }, icon: const Icon(Icons.delete, color: Colors.red,)),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
