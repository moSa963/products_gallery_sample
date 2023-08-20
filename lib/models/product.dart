import 'package:task/models/product_Image.dart';

class Product {
  int id;
  String name;
  String shop;
  double price;
  Type type;
  List<ProductImage> images;

  Product(
      {required this.id,
      required this.name,
      required this.shop,
      required this.price,
      required this.images,
      required this.type});
}
