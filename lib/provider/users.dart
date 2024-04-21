import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project_crud/data/dummy-users.dart';
import 'package:project_crud/models/doing.dart';

class UsersProvider with ChangeNotifier {
  Map<String, Doing> _items = {...TO_DO};

  List<Doing> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Doing byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Doing doing) {
  if (doing.id.trim().isNotEmpty && _items.containsKey(doing.id)) {
    _items.update(
      doing.id,
      (_) => Doing(
        id: doing.id,
        name: doing.name,
      ),
    );
  } else {
 
    final id = Random().nextDouble().toString(); 
    _items.putIfAbsent(
      id,
      () => Doing(
        id: id,
        name: doing.name,
      ),
    );
  }

  notifyListeners();
}

  void remove(Doing doing) {
    if (doing != null && doing.id != null) {
      _items.remove(doing.id);
      notifyListeners();
    }
  }
}
