import 'package:flutter/material.dart';
import 'package:idea_note2/constants/sizes.dart';

class TextFieldController extends StatelessWidget {
  final double? height;
  final double vertical;
  final double horizontal;
  final String? hintText;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextEditingController controller;

  const TextFieldController({
    super.key,
    required this.controller,
    this.hintText,
    this.maxLines,
    this.maxLength,
    this.height,
    required this.vertical,
    required this.horizontal,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(
        top: Sizes.size10,
      ),
      child: TextField(
        textInputAction: textInputAction,
        maxLines: maxLines,
        maxLength: maxLength,
        controller: controller,
        style: const TextStyle(
          fontSize: Sizes.size12,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: vertical,
            horizontal: horizontal,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(
              Sizes.size8,
            ),
          ),
        ),
      ),
    );
  }
}
