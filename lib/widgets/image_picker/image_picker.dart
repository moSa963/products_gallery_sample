import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:task/widgets/image_picker/image_picker_item.dart';
import 'package:task/widgets/styled_elevated_button.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker(
      {super.key, required this.images, this.onRemove, this.onAdd});
  final List<File> images;
  final void Function(File file)? onRemove;
  final void Function(File file)? onAdd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var image in images)
                  ImagePickerItem(
                      file: image, onRemove: () => onRemove?.call(image)),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          StyledElevatedButton(
            onPressed: _handlePickImage,
            child: const Wrap(
              children: [Icon(Icons.add), Text("اضغط لاضافة الصور")],
            ),
          )
        ],
      ),
    );
  }

  void _handlePickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);

    if (result == null) return;

    for (var file in result.files) {
      if (file.path != null) {
        onAdd?.call(File(file.path!));
      }
    }
  }
}
