import 'package:flutter/material.dart';
import 'package:idea_note2/constants/gaps.dart';
import 'package:idea_note2/constants/sizes.dart';
import 'package:idea_note2/data/db_config.dart';
import 'package:idea_note2/features/screens/edit_screen/widgets/importance_button.dart';
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
  /// 제목 입력 필드
  final TextEditingController _titleController = TextEditingController();

  /// 동기 입력 필드
  final TextEditingController _motiveController = TextEditingController();

  /// 내용 입력 필드
  final TextEditingController _contentController = TextEditingController();

  /// 피드백 입력 필드
  final TextEditingController _feedbackController = TextEditingController();

  /// Importance Statement (Debug)
  bool isClicked01 = false;
  bool isClicked02 = false;
  bool isClicked03 = true;
  bool isClicked04 = false;
  bool isClicked05 = false;
  int importanceScore = 3;

  void _onBack() {
    Navigator.pop(context);
  }

  void _keyBoardUnFocus() {
    FocusScope.of(context).unfocus();
  }

  void _initClickStatus() {
    isClicked01 = false;
    isClicked02 = false;
    isClicked03 = false;
    isClicked04 = false;
    isClicked05 = false;
  }

  @override
  void initState() {
    super.initState();

    _titleController;
    _motiveController;
    _contentController;
    _feedbackController;
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
        title: const Text(
          "새 아이디어 작성하기",
          style: TextStyle(
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
                const Text("제목"),
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
                const Text("아이디어를 떠올린 계기"),
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
                const Text("아이디어 내용"),
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
                const Text("아이디어 중요도 점수"),
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
                Gaps.v24,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
