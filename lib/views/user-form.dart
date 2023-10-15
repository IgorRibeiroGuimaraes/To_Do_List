import 'package:flutter/material.dart';
import 'package:project_crud/models/user.dart';
import 'package:project_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User? user) { // Temos 2 páginas no nosso app, a primeira e a de cadastro, correto? Quando clicamos em cadastrar um novo usuario, as informações das fields vão estar vazias.
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments
        as User?; //se tirar o ! ele xia

    if (user != null) {
      _loadFormData(user); // ai como to chamando ele aqui pra dentro do app, precisa chamar um if pra ter ctz q o usuario n é null pq se for essa porra n funciona e é isso ai
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                _form.currentState?.save(); // se tirar o interrogação ele xia

                String id = _formData['id'] ?? '';
                String name = _formData['name'] ?? '';
                String email = _formData['email'] ?? '';
                String avatarUrl = _formData['avatarUrl'] ?? '';

                Provider.of<UsersProvider>(context, listen: false).put(
                  User(id: id, name: name, email: email, avatarUrl: avatarUrl),
                );
                Navigator.of(context).pop();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                onSaved: (newValue) => _formData['name'] = newValue!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (newValue) => _formData['email'] = newValue!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (newValue) => _formData['avatarUrl'] = newValue!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
