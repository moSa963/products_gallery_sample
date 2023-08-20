import 'dart:io';

import 'package:flutter/material.dart';

class ImagePickerItem extends StatelessWidget {
  const ImagePickerItem({super.key, required this.file, this.onRemove});
  final File file;
  final void Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: const EdgeInsets.all(3),
                child: Image.file(file, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                  onPressed: () => onRemove?.call(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  )),
            )
          ],
        ));
  }
}
