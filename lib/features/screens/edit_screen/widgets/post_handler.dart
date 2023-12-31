import 'package:flutter/material.dart';
import 'package:idea_note2/data/database_helper.dart';
import 'package:idea_note2/data/db_config.dart';

class PostHandler {
  final BuildContext context;
  final String titleValue;
  final String motiveValue;
  final String contentValue;
  final String feedbackValue;
  final int importanceScore;
  final DatabaseHelper dbHelper;
  IdeaInfo? ideaInfo;

  PostHandler({
    required this.titleValue,
    required this.motiveValue,
    required this.contentValue,
    required this.feedbackValue,
    required this.importanceScore,
    required this.dbHelper,
    required this.context,
    this.ideaInfo,
  });

  Future<void> databaseHandler() async {
    if (titleValue.isEmpty || motiveValue.isEmpty || contentValue.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("필수로 입력해야 하는 필드입니다!"),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    if (ideaInfo == null) {
      /// 새 게시물 작성
      var ideaInfo = IdeaInfo(
        title: titleValue,
        motive: motiveValue,
        content: contentValue,
        importance: importanceScore,
        feedback: feedbackValue.isNotEmpty ? feedbackValue : "",
        datetime: DateTime.now().millisecondsSinceEpoch,
      );

      await setInsertIdeaInfo(ideaInfo);

      if (context.mounted) {
        /// 작성완료 후 이전 화면으로 Direction
        Navigator.pop(context, "insert");
      }
    } else if (ideaInfo != null) {
      /// 기존 게시물 수정
      var ideaInfoModify = ideaInfo;
      ideaInfoModify?.title = titleValue;
      ideaInfoModify?.motive = motiveValue;
      ideaInfoModify?.content = contentValue;
      ideaInfoModify?.importance = importanceScore;
      ideaInfoModify?.feedback = feedbackValue.isNotEmpty ? feedbackValue : "";

      await setUpdateIdeaInfo(ideaInfoModify!);

      /// Close current Edit Screen
      if (context.mounted) {
        Navigator.pop(context, "update");
      }
    }
  }

  Future<void> setInsertIdeaInfo(IdeaInfo ideaInfo) async {
    await dbHelper.initDatabase();
    await dbHelper.insertIdeaInfo(ideaInfo);
  }

  Future<void> setUpdateIdeaInfo(IdeaInfo ideaInfo) async {
    await dbHelper.initDatabase();
    await dbHelper.updateIdeaInfo(ideaInfo);
  }
}
