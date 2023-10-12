import 'package:flutter/material.dart';
import 'package:project_crud/components/user_tile.dart';
import 'package:project_crud/models/user.dart';
import 'package:project_crud/provider/users.dart';
import 'package:project_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuário'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
             Navigator.of(context).pushNamed(
              AppRoutes.USER_FORM
             );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
