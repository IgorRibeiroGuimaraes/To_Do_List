// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:project_crud/models/user.dart';
import 'package:project_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                _form.currentState?.save();
                Provider.of<UsersProvider>(context, listen: false).put(
                  User(
                    id: _formData['id'] ?? 'null',
                    name: _formData['name'] ?? 'null',
                    email: _formData['email'] ?? 'null',
                    avatarUrl: _formData['avatarUrl'] ?? 'null',
                  ),
                );
                Navigator.of(context).pop();
              }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-Mail'),
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
