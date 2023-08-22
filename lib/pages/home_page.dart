import 'package:flutter/material.dart';
import 'package:task/pages/create_product_page.dart';
import 'package:task/widgets/styled_icon_button.dart';
import 'package:task/widgets/types_selector/types_selector.dart';
import 'package:task/constants/types.dart';
import 'package:task/models/type.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Type _type = types[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المنتجات",
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        centerTitle: true,
        actions: [
          StyledIconButton(
                  onPressed: _openCreateProductPage,
                  icon: const Icon(Icons.add)),
          const SizedBox(width: 10,),
        ],
      ),
      body: ListView(
        children: [
          TypesSelector(value: _type, onChange: (type) => setState(() {
            _type = type;
          }),),
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
