import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) imagePickFn;
  const UserImagePicker({required this.imagePickFn, super.key});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;

  void _pickImage(bool cam) async {
    final pickedImageFile = await ImagePicker().pickImage(
      source: cam ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedImageFile == null) {
      return;
    }
    setState(() {
      _pickedImage = File(pickedImageFile.path);
    });
    widget.imagePickFn(_pickedImage as File);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage == null ? null : FileImage(_pickedImage as File),
          //child: _pickedImage == null ? const Icon(Icons.add) : null,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () => _pickImage(true),
              icon: const Icon(Icons.camera),
              label: const Text('Camera'),
            ),
            const SizedBox(width: 20),
            TextButton.icon(
              onPressed: () => _pickImage(false),
              icon: const Icon(Icons.image),
              label: const Text('Gallery'),
            ),
          ],
        )
      ],
    );
  }
}
