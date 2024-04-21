import 'package:flutter/material.dart';
import 'package:project_crud/routes/app_routes.dart';
import 'package:project_crud/views/user-form.dart';
import 'package:project_crud/views/user_list.dart';
import 'package:project_crud/provider/users.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UsersProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        title: 'To do List',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),
    );
  }
}
