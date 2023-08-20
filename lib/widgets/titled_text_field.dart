import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TitledTextField extends StatelessWidget {
  const TitledTextField(
      {super.key,
      this.onChanged,
      this.label = "",
      this.keyboardType,
      this.inputFormatters});
  final void Function(String)? onChanged;
  final String label;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Container(
          color: Colors.white,
          child: TextFormField(
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              onChanged: onChanged,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: label,
                hintStyle: const TextStyle(color: Colors.grey)
              )),
        ),
      ],
    );
  }
}
