import 'package:flutter/material.dart';
import 'package:idea_note2/constants/sizes.dart';

class ImportanceButton extends StatelessWidget {
  final int score;
  final bool isClicked;

  const ImportanceButton({
    super.key,
    required this.score,
    required this.isClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: Sizes.size10,
      ),
      decoration: ShapeDecoration(
        color: isClicked ? Colors.grey.shade400 : Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(Sizes.size10),
        ),
      ),
      height: Sizes.size40,
      width: Sizes.size50,
      child: Text(
        score.toString(),
        style: const TextStyle(
          fontSize: Sizes.size14,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
