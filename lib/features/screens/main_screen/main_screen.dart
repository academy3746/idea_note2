import 'package:flutter/material.dart';
import 'package:idea_note2/constants/sizes.dart';
import 'package:idea_note2/features/screens/main_screen/widgets/list_item.dart';
import 'package:idea_note2/features/screens/main_screen/widgets/post_button.dart';

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
      floatingActionButton: const PostButton(),
    );
  }
}
