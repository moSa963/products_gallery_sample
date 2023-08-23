import 'package:flutter/material.dart';

export './view_style_button.dart' show ViewStyle;

enum ViewStyle { grid, list }

class ViewStyleButton extends StatelessWidget {
  const ViewStyleButton({super.key, required this.value, this.onChange});
  final ViewStyle value;
  final void Function(ViewStyle style)? onChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChange
          ?.call(value == ViewStyle.grid ? ViewStyle.list : ViewStyle.grid),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.grid_view,
              color: Colors.red,
            ),
            Text(
                "تغيير عرض المنتجات الى ${value == ViewStyle.grid ? "عمودي" : "افقي"}",
                style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
