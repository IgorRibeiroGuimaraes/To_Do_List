import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_crud/models/doing.dart';
import 'package:project_crud/provider/users.dart';
import 'package:project_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final Doing doing;

  const UserTile(this.doing, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(doing.name),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.green,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: doing,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                Provider.of<UsersProvider>(context, listen: false)
                    .remove(doing);
              },
            ),
          ],
        ),
      ),
    );
  }
}
