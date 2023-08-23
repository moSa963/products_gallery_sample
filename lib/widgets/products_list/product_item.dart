import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task/models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key, this.direction = Axis.horizontal, required this.product});
  final Axis direction;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: direction == Axis.horizontal ? 130 : null,
      width: direction == Axis.horizontal ? null : 130,
      child: Flex(
        direction: direction,
        children: [
          _image(),
          SizedBox(
            height: direction == Axis.horizontal ? null : 10,
            width: direction == Axis.horizontal ? 10 : null,
          ),
          Expanded(
              flex: direction == Axis.horizontal ? 1 : 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: Theme.of(context).textTheme.headlineSmall, overflow: TextOverflow.ellipsis),
                  Row(
                    children: [
                      Text(product.price.toString(),
                          textScaleFactor: 1.2,
                          style: const TextStyle(color: Colors.green), overflow: TextOverflow.ellipsis),
                      const Text("دولار")
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Color.fromARGB(138, 203, 203, 203),
                    ),
                    child: Text(product.shop,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 153, 153, 153)), overflow: TextOverflow.ellipsis),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.memory(base64Decode(product.images[0].data),
            fit: BoxFit.cover),
      ),
    );
  }
}
