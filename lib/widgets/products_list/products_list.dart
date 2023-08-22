


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/products_provider.dart';
import 'package:task/widgets/products_list/product_item.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for(final i in context.watch<ProductsProvider>().products) 
        ProductItem(product: i)
      ],
    );
  }
}