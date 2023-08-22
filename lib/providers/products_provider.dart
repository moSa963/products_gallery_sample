import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task/models/product.dart';
import 'package:task/models/product_image.dart';
import 'package:task/services/database_service.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;
  final _service = DatabaseService();

  ProductsProvider() {
    load(null);
  }

  void load(int? type) async {
    _products = await _service.select(type);
    notifyListeners();
  }

  Future<void> add(Product product, List<File> images) async {
    for (final image in images) {
      product.images.add(ProductImage(
        data: base64Encode(image.readAsBytesSync()),
      ));
    }

    await _service.insert(product);
    _products.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _products.remove(product);
    notifyListeners();
  }
}
