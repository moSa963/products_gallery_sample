import 'package:flutter/material.dart';

class StyledIconButton extends StatelessWidget {
  const StyledIconButton(
      {super.key, required this.onPressed, required this.icon});
  final void Function() onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.grey, width: 0.4)
        ),
        child: icon,
      ),
    );
  }
}
