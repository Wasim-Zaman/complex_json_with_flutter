import "package:flutter/material.dart";

import "../json/products_data.dart";
import "../json/carts_data.dart";
import "../json/users_data.dart";

class DataModel with ChangeNotifier {
  final UIC = [];
  final PIC = [];

  final List<Map<String, Object>> _productsData = products;
  final List<Map<String, Object>> _cartsData = carts;
  final List<Map<String, Object>> _usersData = users;

  List<Map<String, Object>> get productsData {
    return [..._productsData];
  }

  List<Map<String, Object>> get cartsData {
    return [..._cartsData];
  }

  List<Map<String, Object>> get usersData {
    return [..._usersData];
  }
}
