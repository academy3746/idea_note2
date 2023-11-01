import 'package:flutter/material.dart';
import 'package:idea_note2/constants/sizes.dart';

class ConfirmButton extends StatelessWidget {
  final String text;

  const ConfirmButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: Sizes.size24,
      ),
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
