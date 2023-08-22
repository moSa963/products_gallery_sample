class ProductImage {
  final String data;

  ProductImage({required this.data});

  factory ProductImage.fromMap(Map<String, Object?> map) {
    return ProductImage(
      data: map["data"] as String,
    );
  }
}
