import 'package:task/constants/types.dart';
import 'package:task/models/product_image.dart';
import 'package:task/models/type.dart';

class Product {
  int id;
  String name;
  String shop;
  double price;
  Type type;
  List<ProductImage> images;

  Product(
      {this.id = 0,
      this.name = "",
      this.shop = "",
      this.price = 0,
      required this.images,
      required this.type});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'shop': shop,
      'price': price,
      'type': type.id,
    };
  }

  factory Product.fromMap(Map<String, Object?> map) {
    return Product(
      id: map["id"] as int,
      name: map["name"] as String,
      shop: map["shop"] as String,
      price: map["price"] as double,
      type: types[map["type"] as int],
      images: []
    );
  }
}
