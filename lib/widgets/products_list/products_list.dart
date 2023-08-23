import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/products_provider.dart';
import 'package:task/widgets/products_list/product_item.dart';
import 'package:task/widgets/view_style_button.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, this.style = ViewStyle.list});
  final ViewStyle style;

  @override
  Widget build(BuildContext context) {
    if (style == ViewStyle.grid) {
      return _grid(context);
    }

    return _list(context);
  }

  Widget _list(BuildContext context) {
    return ListView(
      children: [
        for (final i in context.watch<ProductsProvider>().products)
          ProductItem(key: Key("product ${i.id}"), product: i)
      ],
    );
  }

  Widget _grid(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: [
          for (final i in context.watch<ProductsProvider>().products)
            ProductItem(
              key: Key("product ${i.id}"),
              product: i,
              direction: Axis.vertical,
            )
        ],
      ),
    );
  }
}
