import 'package:flutter/material.dart';
import 'package:idea_note2/constants/sizes.dart';
import 'package:idea_note2/features/screens/main_screen/widgets/list_item.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/main";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            ListItems items = ListItems(index);

            return items.listItem(index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.7),
        onPressed: () {
          // 게시글 POST
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
