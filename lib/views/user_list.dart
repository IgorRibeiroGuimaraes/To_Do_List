import 'package:flutter/material.dart';
import 'package:project_crud/components/user_tile.dart';
import 'package:project_crud/provider/users.dart';
import 'package:project_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of<UsersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: ListView.builder(
        itemCount: users.count + 1, 
        itemBuilder: (ctx, i) {
          if (i == 0) {
            return Padding(padding: EdgeInsets.only(top: 50)); 
          }
        
          return UserTile(users.byIndex(i - 1));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop, 
    );
  }
}

