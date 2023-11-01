import 'package:flutter/material.dart';
import 'package:idea_note2/constants/gaps.dart';
import 'package:idea_note2/constants/sizes.dart';
import 'package:idea_note2/data/database_helper.dart';
import 'package:idea_note2/data/db_config.dart';
import 'package:idea_note2/features/screens/edit_screen/widgets/confirm_button.dart';
import 'package:idea_note2/features/screens/edit_screen/widgets/importance_button.dart';
import 'package:idea_note2/features/screens/edit_screen/widgets/post_handler.dart';
import 'package:idea_note2/features/screens/edit_screen/widgets/text_field_controller.dart';

//ignore: must_be_immutable
class EditScreen extends StatefulWidget {
  static String routeName = "/edit";

  IdeaInfo? ideaInfo;

  EditScreen({
    super.key,
    this.ideaInfo,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  /// 아이디어 제목 입력 필드
  final TextEditingController _titleController = TextEditingController();

  /// 아이디어 동기 입력 필드
  final TextEditingController _motiveController = TextEditingController();

  /// 아이디어 내용 입력 필드
  final TextEditingController _contentController = TextEditingController();

  /// 유저 피드백 입력 필드
  final TextEditingController _feedbackController = TextEditingController();

  /// Importance Statement
  bool isClicked01 = false;
  bool isClicked02 = false;
  bool isClicked03 = true;
  bool isClicked04 = false;
  bool isClicked05 = false;
  int importanceScore = 3;

  /// Database Handling
  final dbHelper = DatabaseHelper();

  /// 뒤로가기 Action
  void _onBack() {
    Navigator.pop(context);
  }

  /// 화면 터치, 키보드 비활성화
  void _keyBoardUnFocus() {
    FocusScope.of(context).unfocus();
  }

  /// 중요도 점수 선택값 (Boolean) 초기화
  void _initClickStatus() {
    isClicked01 = false;
    isClicked02 = false;
    isClicked03 = false;
    isClicked04 = false;
    isClicked05 = false;
  }

  /// Import Database Handling Class
  Future<void> _editComplete() async {
    PostHandler postHandler = PostHandler(
      context: context,
      titleValue: _titleController.text.toString(),
      motiveValue: _motiveController.text.toString(),
      contentValue: _contentController.text.toString(),
      feedbackValue: _feedbackController.text.toString(),
      importanceScore: importanceScore,
      dbHelper: dbHelper,
      ideaInfo: widget.ideaInfo,
    );

    postHandler.databaseHandler();
  }

  @override
  void initState() {
    super.initState();

    _titleController;
    _motiveController;
    _contentController;
    _feedbackController;

    /// Get each field's value
    if (widget.ideaInfo != null) {
      _titleController.text = widget.ideaInfo!.title;
      _motiveController.text = widget.ideaInfo!.motive;
      _contentController.text = widget.ideaInfo!.content;

      /// Not Required
      if (widget.ideaInfo!.feedback.isNotEmpty) {
        _feedbackController.text = widget.ideaInfo!.feedback;
      }
    }

    /// Importance Score Setting
    _initClickStatus();
    switch (widget.ideaInfo!.importance) {
      case 1:
        isClicked01 = true;
        break;
      case 2:
        isClicked02 = true;
        break;
      case 3:
        isClicked03 = true;
        break;
      case 4:
        isClicked04 = true;
        break;
      case 5:
        isClicked05 = true;
        break;
    }

    importanceScore = widget.ideaInfo!.importance;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _motiveController.dispose();
    _contentController.dispose();
    _feedbackController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: _onBack,
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: Sizes.size24,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          widget.ideaInfo == null ?  "새 아이디어 작성하기" : "아이디어 수정하기",
          style: const TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _keyBoardUnFocus,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// title
                const Text(
                  "제목",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFieldController(
                  height: Sizes.size42,
                  vertical: 0,
                  horizontal: Sizes.size20,
                  controller: _titleController,
                  hintText: "아이디어 제목을 작성해 주세요.",
                  textInputAction: TextInputAction.next,
                ),
                Gaps.v24,

                /// motive
                const Text(
                  "아이디어를 떠올린 계기",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFieldController(
                  height: Sizes.size42,
                  vertical: 0,
                  horizontal: Sizes.size20,
                  controller: _motiveController,
                  hintText: "아이디어를 떠올린 계기가 있으신가요?",
                  textInputAction: TextInputAction.next,
                ),
                Gaps.v24,

                /// content
                const Text(
                  "아이디어 내용",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFieldController(
                  controller: _contentController,
                  vertical: Sizes.size20,
                  horizontal: Sizes.size20,
                  hintText: "떠오른 아이디어를 상세히 작성해 주세요.",
                  maxLines: 10,
                  maxLength: 1000,
                ),
                Gaps.v24,

                /// importance
                const Text(
                  "아이디어 중요도 점수",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _initClickStatus();

                        setState(() {
                          importanceScore = 1;
                          isClicked01 = true;
                        });
                      },
                      child: ImportanceButton(
                        score: 1,
                        isClicked: isClicked01,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _initClickStatus();

                        setState(() {
                          importanceScore = 2;
                          isClicked02 = true;
                        });
                      },
                      child: ImportanceButton(
                        score: 2,
                        isClicked: isClicked02,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _initClickStatus();

                        setState(() {
                          importanceScore = 3;
                          isClicked03 = true;
                        });
                      },
                      child: ImportanceButton(
                        score: 3,
                        isClicked: isClicked03,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _initClickStatus();

                        setState(() {
                          importanceScore = 4;
                          isClicked04 = true;
                        });
                      },
                      child: ImportanceButton(
                        score: 4,
                        isClicked: isClicked04,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _initClickStatus();

                        setState(() {
                          importanceScore = 5;
                          isClicked05 = true;
                        });
                      },
                      child: ImportanceButton(
                        score: 5,
                        isClicked: isClicked05,
                      ),
                    ),
                  ],
                ),
                Gaps.v24,

                /// feedback
                const Text("유저 피드백 사항 (선택)"),
                TextFieldController(
                  controller: _feedbackController,
                  vertical: Sizes.size20,
                  horizontal: Sizes.size20,
                  hintText: "떠오른 아이디어를 기반으로 전달받은\n피드백을 정리해 주세요.",
                  maxLines: 5,
                  maxLength: 500,
                ),

                /// 작성 완료 버튼
                GestureDetector(
                  onTap: _editComplete,
                  child: const ConfirmButton(
                    text: "작성완료",
                    margin: EdgeInsets.only(
                      top: Sizes.size24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
