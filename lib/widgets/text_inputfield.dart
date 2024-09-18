import 'package:flutter/material.dart';

class TextInputfield extends StatefulWidget {
  const TextInputfield({
    super.key,
    required this.hintText,
    this.isPass = false,
    required this.textEditingController,
    required this.textInputType,
    this.prefixIcon,
  });

  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final Icon? prefixIcon;

  @override
  TextInputfieldState createState() => TextInputfieldState();
}

class TextInputfieldState extends State<TextInputfield> {
  bool isPasswordVisible = false; // Moved isPasswordVisible to State

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
        prefixIcon: widget.prefixIcon, // Added prefixIcon
        suffixIcon: widget.isPass
            ? IconButton(
                icon: Icon(
                  isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off, // Show/hide icon
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible; // Toggle visibility
                  });
                },
              )
            : null, // Add suffix icon only for password field
      ),
      keyboardType: widget.textInputType,
      obscureText: widget.isPass ? !isPasswordVisible : false, // Hide/Show password
    );
  }
}
