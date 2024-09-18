import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Image Picking Function :-> 
pickImage(ImageSource img) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: img);

  if (file != null) {
    return await file.readAsBytes();
  }
  print("No Image Selected");
}

// showing Snackbar Function :-> 
showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content:  Text(content , style: const TextStyle(
      fontWeight: FontWeight.bold ,
      fontSize: 14
       ),)
  ));
}
