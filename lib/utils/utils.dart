import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  // ignore: no_leading_underscores_for_local_identifiers
  XFile? _image = await imagePicker.pickImage(source: source);
  if (_image != null) {
    return await _image.readAsBytes();
  }
  return null;
}

showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
