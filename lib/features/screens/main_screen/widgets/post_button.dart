// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:idea_note2/constants/sizes.dart';
import 'package:idea_note2/features/screens/edit_screen/edit_screen.dart';

class PostButton extends StatelessWidget {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.7),
      onPressed: () {
        /// 게시글 POST
        Navigator.pushNamed(context, EditScreen.routeName);
      },
      child: Image.asset(
        "assets/images/post.png",
        width: Sizes.size28,
        height: Sizes.size28,
        color: Colors.white,
      ),
    );
  }
}
