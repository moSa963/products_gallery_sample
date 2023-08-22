import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task/constants/types.dart';
import 'package:task/models/product.dart';
import 'package:task/providers/products_provider.dart';
import 'package:task/widgets/image_picker/image_picker.dart';
import 'package:task/widgets/styled_drop_down.dart';
import 'package:task/widgets/styled_elevated_button.dart';
import 'package:task/widgets/styled_icon_button.dart';
import 'package:task/widgets/titled_text_field.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final List<File> images = [];
  final Product product = Product(images: [], type: types.first);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("اضافة منتجات"),
          centerTitle: true,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledIconButton(
                  onPressed: _back, icon: const Icon(Icons.arrow_back))
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              const Text("صور المنتج",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              ImagePicker(
                images: images,
                onAdd: (file) {
                  setState(() {
                    images.add(file);
                  });
                },
                onRemove: (file) {
                  setState(() {
                    images.remove(file);
                  });
                },
              ),
              TitledTextField(
                label: "اسم المنتج",
                onChanged: (value) => (product.name = value),
              ),
              TitledTextField(
                label: "اسم المتجر",
                onChanged: (value) => (product.shop = value),
              ),
              TitledTextField(
                  label: "السعر",
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) => (product.price = double.parse(value))),
              const SizedBox(
                height: 25,
              ),
              const Text("التصنيف",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              StyledDropdown(
                items: [
                  for (final type in types)
                    DropdownMenuItem(
                      value: type.id,
                      child: Text(type.name),
                    )
                ],
                value: product.type.id,
                onChanged: (value) {
                  setState(() {
                    product.type = types.where((e) => e.id == value).first;
                  });
                },
              ),
              const SizedBox(
                height: 25,
              ),
              StyledElevatedButton(
                onPressed: _handleAdd,
                child: const Text("اضف منتج"),
              )
            ],
          ),
        ));
  }

  void _back() {
    Navigator.pop(context);
  }

  void _handleAdd() async {
    await context.read<ProductsProvider>().add(product, images);
    _back();
  }
}
