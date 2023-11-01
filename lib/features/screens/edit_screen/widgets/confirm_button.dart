import 'package:flutter/material.dart';
import 'package:idea_note2/constants/sizes.dart';

class ConfirmButton extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? margin;

  const ConfirmButton({
    super.key,
    required this.text, this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: Sizes.size64,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 0.7,
          ),
          borderRadius: BorderRadius.circular(Sizes.size10),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: Sizes.size16,
        ),
      ),
    );
  }
}
