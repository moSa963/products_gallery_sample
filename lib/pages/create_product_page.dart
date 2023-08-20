import 'package:flutter/material.dart';
import 'package:task/widgets/styled_icon_button.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اضافة منتجات"),
        centerTitle: true,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledIconButton(onPressed: _back, icon: const Icon(Icons.arrow_back))
          ],
        ),
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }



  void _back() {
    Navigator.pop(context);
  }
}