import 'package:task/models/product_Image.dart';
import 'package:task/models/Type.dart';

class Product {
  int id;
  String name;
  String shop;
  double price;
  Type type;
  List<ProductImage> images;

  Product(
      {this.id=0,
      this.name="",
      this.shop="",
      this.price=0,
      required this.images,
      required this.type});
}
