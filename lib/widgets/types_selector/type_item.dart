import 'package:flutter/material.dart';
import 'package:task/models/type.dart';

class TypeItem extends StatelessWidget {
  const TypeItem(
      {super.key, this.selected = false, required this.type, this.onTap});
  final bool selected;
  final Type type;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: AspectRatio(
            aspectRatio: 0.9,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: selected ? Colors.green : Colors.transparent,
                      width: 0.5)),
              child: Column(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1.1,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Image.asset(
                          "lib/assets/images/${type.image}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(type.name),
                ],
              ),
            )),
      ),
    );
  }
}
