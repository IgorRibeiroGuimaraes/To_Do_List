import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importe o pacote intl para formatar a data
import 'package:project_crud/models/doing.dart';
import 'package:project_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};
  DateTime? _selectedDate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Doing? doing = ModalRoute.of(context)?.settings.arguments as Doing?;
    if (doing != null) {
      _formData['id'] = doing.id;
      _formData['name'] = doing.name;
      _formData['dueDate'] =
          _selectedDate; // Garante que o formData esteja correto.
    }
  }



  void _saveForm() {
    _form.currentState?.save();

    String id = _formData['id'] ?? '';
    String name = _formData['name'] ?? '';
    DateTime dueDate = _formData['dueDate'] ??
        DateTime.now(); // Certifique-se de usar _formData['dueDate']

    Provider.of<UsersProvider>(context, listen: false).put(
      Doing(id: id, name: name),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            _formData.containsKey('id') ? 'Editar Tarefa' : 'Adicionar Tarefa'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome da Tarefa'),
                onSaved: (newValue) {
                  if (newValue != null) _formData['name'] = newValue;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
