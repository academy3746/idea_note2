// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:idea_note2/constants/sizes.dart';
import 'package:idea_note2/data/database_helper.dart';
import 'package:idea_note2/data/db_config.dart';
import 'package:idea_note2/features/screens/detail_screen/detail_screen.dart';
import 'package:idea_note2/features/screens/edit_screen/edit_screen.dart';
import 'package:idea_note2/features/screens/main_screen/widgets/list_item.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/main";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var dbHelper = DatabaseHelper();
  List<IdeaInfo> lstIdeaInfo = [];

  Future<void> _getIdeaInfo() async {
    await dbHelper.initDatabase();
    lstIdeaInfo = await dbHelper.getAllIdeaInfo();
    lstIdeaInfo.sort((a, b) => b.datetime.compareTo(a.datetime));

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getIdeaInfo();
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
          itemCount: lstIdeaInfo.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                var result = await Navigator.pushNamed(
                  context,
                  DetailScreen.routeName,
                  arguments: lstIdeaInfo[index],
                );

                if (result != null) {
                  String msg = "";

                  if (result == "update") {
                    /// 수정 완료
                    msg = "아이디어 수정이 완료되었습니다!";
                  } else if (result == "delete") {
                    /// 삭제 완료
                    msg = "아이디어가 완전히 삭제되었습니다!";
                  }

                  _getIdeaInfo();

                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(msg),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                }
              },
              child: ListItem(
                lstIdeaInfo: lstIdeaInfo,
                index: index,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.7),
        onPressed: () async {
          /// 게시글 POST
          var result = await Navigator.pushNamed(context, EditScreen.routeName);

          if (result != null) {
            _getIdeaInfo();

            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("새로운 아이디어가 등록되었습니다!"),
                  duration: Duration(seconds: 3),
                ),
              );
            }
          }
        },
        child: Image.asset(
          "assets/images/post.png",
          width: Sizes.size28,
          height: Sizes.size28,
          color: Colors.white,
        ),
      ),
    );
  }
}
