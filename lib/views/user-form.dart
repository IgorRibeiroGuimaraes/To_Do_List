import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState?.validate();

                if (isValid != null) {
                  _form.currentState?.save();
                  Navigator.of(context).pop();
                }
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
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome Inválido';
                  }
                },
                onSaved: (value) {
                  print(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-Mail'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL do Avatar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
