import 'package:flutter/material.dart';
import 'package:task/pages/create_product_page.dart';
import 'package:task/widgets/styled_icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        children: [],
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
