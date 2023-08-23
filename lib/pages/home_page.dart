import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/pages/create_product_page.dart';
import 'package:task/providers/products_provider.dart';
import 'package:task/widgets/products_list/products_list.dart';
import 'package:task/widgets/styled_icon_button.dart';
import 'package:task/widgets/types_selector/types_selector.dart';
import 'package:task/constants/types.dart';
import 'package:task/models/type.dart';
import 'package:task/widgets/view_style_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Type _type = types[0];
  ViewStyle _style = ViewStyle.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المنتجات",
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        centerTitle: true,
        actions: [
          StyledIconButton(
              onPressed: _openCreateProductPage, icon: const Icon(Icons.add)),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          TypesSelector(
            value: _type,
            onChange: (type) => setState(() {
              _type = type;
              context.read<ProductsProvider>().load(_type.id);
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ViewStyleButton(
                  value: _style,
                  onChange: (style) => setState(() => (_style = style)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ProductsList(style: _style),
          )
        ],
      ),
    );
  }

  void _openCreateProductPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateProductPage(),
      ),
    );
  }
}
