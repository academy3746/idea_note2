import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idea_note2/constants/sizes.dart';

class ListItems {
  final int index;

  ListItems(this.index);

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
          const Padding(
            padding: EdgeInsets.only(
              left: Sizes.size14,
              bottom: Sizes.size16,
            ),
            child: Text(
              "# 4차 산업혁명 시대에 개발자로 살아남기!",
              style: TextStyle(
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
                "2023. 10. 30 21:37",
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
                initialRating: 3,
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
}
