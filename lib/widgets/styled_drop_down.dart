import 'package:flutter/material.dart';

class StyledDropdown<InvalidType> extends StatelessWidget {
  const StyledDropdown({super.key, this.items, this.onChanged, this.value});
  final List<DropdownMenuItem<InvalidType>>? items;
  final void Function(InvalidType?)? onChanged;
  final InvalidType? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(2),
      child: DropdownButton(
          iconEnabledColor: Colors.blue,
          icon: const Icon(Icons.arrow_drop_down_circle_outlined),
          focusColor: Colors.transparent,
          dropdownColor: Colors.white,
          underline: Container(),
          isExpanded: true,
          value: value,
          items: items,
          onChanged: onChanged),
    );
  }
}
