import 'package:flutter/material.dart';
import 'package:idea_note2/data/db_config.dart';

//ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  static String routeName = "/detail";

  IdeaInfo? ideaInfo;

  DetailScreen({super.key, this.ideaInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "4차 산업혁명 시대에 개발자로 살아남기",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
