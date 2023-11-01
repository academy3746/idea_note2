import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idea_note2/constants/gaps.dart';
import 'package:idea_note2/constants/sizes.dart';
import 'package:idea_note2/data/database_helper.dart';
import 'package:idea_note2/data/db_config.dart';
import 'package:idea_note2/features/screens/edit_screen/edit_screen.dart';
import 'package:idea_note2/features/screens/edit_screen/widgets/confirm_button.dart';

//ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  static String routeName = "/detail";

  IdeaInfo? ideaInfo;

  DetailScreen({super.key, this.ideaInfo});

  final dbHelper = DatabaseHelper();

  Future<void> _setDeleteIdeaInfo(int id) async {
    await dbHelper.initDatabase();
    await dbHelper.deleteIdeaInfo(id);
  }

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
            size: Sizes.size24,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              /// Delete Process
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("주의"),
                      content: const Text("정말로 삭제 하시겠습니까?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "취소",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await _setDeleteIdeaInfo(ideaInfo!.id!);
                            if (context.mounted) {
                              Navigator.of(context).pop();
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            "확인",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            },
            child: const Text(
              "삭제",
              style: TextStyle(
                color: Colors.red,
                fontSize: Sizes.size16,
              ),
            ),
          ),
        ],
        title: Text(
          ideaInfo!.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(
                  Sizes.size20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// motive
                    const Text(
                      "아이디어를 떠올린 계기",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      ideaInfo!.motive,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Gaps.v28,

                    /// content
                    const Text(
                      "아이디어 내용",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      ideaInfo!.content,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Gaps.v28,

                    /// importance
                    const Text(
                      "아이디어 중요도 점수",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v10,
                    RatingBar.builder(
                      initialRating: ideaInfo!.importance.toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemSize: Sizes.size34,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(
                        horizontal: 0,
                      ),
                      ignoreGestures: true,
                      updateOnDrag: false,
                      itemBuilder: (BuildContext context, int index) {
                        return const FaIcon(
                          FontAwesomeIcons.star,
                          color: Colors.amberAccent,
                        );
                      },
                      onRatingUpdate: (double value) {},
                    ),
                    Gaps.v28,

                    /// feedback
                    const Text(
                      "유저 피드백 사항",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      ideaInfo!.feedback,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Edit Button
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                EditScreen.routeName,
                arguments: ideaInfo,
              );
            },
            child: const ConfirmButton(
              text: "수정하기",
              margin: EdgeInsets.symmetric(
                vertical: Sizes.size16,
                horizontal: Sizes.size16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
