import 'package:flutter/material.dart';
import 'package:task/constants/types.dart';
import 'package:task/models/type.dart';
import 'package:task/widgets/types_selector/type_item.dart';

class TypesSelector extends StatelessWidget {
  const TypesSelector({super.key, required this.value, this.onChange});
  final Type value;
  final void Function(Type type)? onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: types
            .map<TypeItem>((e) => TypeItem(
                  type: e,
                  selected: e.id == value.id,
                  onTap: () => onChange?.call(e),
                ))
            .toList(),
      ),
    );
  }
}
