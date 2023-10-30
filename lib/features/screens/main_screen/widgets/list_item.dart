import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idea_note2/constants/sizes.dart';
import 'package:idea_note2/data/database_helper.dart';
import 'package:idea_note2/data/db_config.dart';
import 'package:intl/intl.dart';

class ListItems {
  final IdeaInfo ideaInfo;
  List<IdeaInfo> lstIdeaInfo = [];
  var dbHelper = DatabaseHelper();

  ListItems(this.ideaInfo) {
    initData();
  }

  Widget listItem(int index) {
    return Container(
      height: Sizes.size80 + Sizes.size2,
      margin: const EdgeInsets.only(
        top: Sizes.size20,
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size10,
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          /// title
          Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size14,
              bottom: Sizes.size16,
            ),
            child: Text(
              "# ${lstIdeaInfo[index].title}",
              style: const TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black,
              ),
            ),
          ),

          /// datetime
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: Sizes.size10,
                bottom: Sizes.size8,
              ),
              child: Text(
                DateFormat("yyyy.MM.dd HH:mm").format(
                  DateTime.fromMillisecondsSinceEpoch(
                      lstIdeaInfo[index].datetime),
                ),
                style: TextStyle(
                  fontSize: Sizes.size10,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),

          /// importance
          Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size10,
              bottom: Sizes.size8,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: RatingBar.builder(
                initialRating: lstIdeaInfo[index].importance.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                itemSize: Sizes.size16,
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
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getIdeaInfo() async {
    // SELECT * FROM `tb_idea` where (1) ORDER BY datetime DESC
    await dbHelper.initDatabase();
    lstIdeaInfo = await dbHelper.getAllIdeaInfo();
    lstIdeaInfo.sort((a, b) => b.datetime.compareTo(a.datetime));
  }

  Future<void> initData() async {
    await getIdeaInfo();
  }
}
