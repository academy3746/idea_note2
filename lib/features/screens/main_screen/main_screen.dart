// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:idea_note2/constants/sizes.dart';
import 'package:idea_note2/data/database_helper.dart';
import 'package:idea_note2/data/db_config.dart';
import 'package:idea_note2/features/screens/main_screen/widgets/list_item.dart';
import 'package:idea_note2/features/screens/main_screen/widgets/post_button.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/main";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<ListItems> itemList = [];
  var dbHelper = DatabaseHelper();

  Future<void> _loadItems() async {
    await dbHelper.initDatabase();
    var allIdeaInfo = await dbHelper.getAllIdeaInfo();

    for (var ideaInfo in allIdeaInfo) {
      itemList.add(ListItems(ideaInfo));
    }

    setState(() {});
  }

  Future<void> _insertDummyData() async {
    await dbHelper.initDatabase();
    await dbHelper.insertIdeaInfo(
      IdeaInfo(
        title: "4차 산업혁명 시대에 개발자로 살아남기",
        motive: "Chat GPT를 사용 하다가 생각난 아이디어",
        content: "Database 영역으로 딥 다이브를 해야 한다!!!!",
        importance: 4,
        feedback: "예아, 그 말이 맞다!",
        datetime: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadItems();
    //_insertDummyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "IDEA NOTE",
          style: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          Sizes.size20,
        ),
        child: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return itemList[index].listItem(index);
          },
        ),
      ),
      floatingActionButton: const PostButton(),
    );
  }
}
