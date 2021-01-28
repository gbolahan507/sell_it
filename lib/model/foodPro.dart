import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sell_its/model/products.dart';

class ProductNotifier extends ChangeNotifier {
  List<Products> _productlist = [];
  Products _currentproduct;

  UnmodifiableListView<Products> get productlist =>
      UnmodifiableListView(_productlist); // getter method for list

  Products get currentproduct => _currentproduct; // getter method of variable

  set productlist(List<Products> productlist) {
    _productlist = productlist;
    notifyListeners(); // setter method fro list
  }

  set currentproduct(Products products) {
    _currentproduct = products;
    notifyListeners(); // setter method
  }
}
