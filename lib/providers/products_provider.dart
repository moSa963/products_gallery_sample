import 'package:flutter/material.dart';
import 'package:task/models/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _products = [];
  List<Product> get products => _products;
  

  void add(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _products.remove(product);
    notifyListeners();
  }
}
