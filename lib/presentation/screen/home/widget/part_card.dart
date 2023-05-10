import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:toeic/presentation/widget/card_background.dart';
import 'package:toeic/src/app_resources.dart';

class PartCard extends StatelessWidget {
  PartCard(
      {Key? key,
      this.imagePath,
      this.title = '',
      this.content = '',
      this.child})
      : super(key: key);
  final String title;
  final String? imagePath;
  final String content;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CardBackGround(
      margin: EdgeInsets.fromLTRB(size.width * 0.05, size.height * 0.015,
          size.width * 0.05, size.height * 0.015),
      child: ExpandablePanel(
        collapsed: buildHeader(size),
        expanded: buildExpanded(size),
      ),
    );
  }

  Widget buildHeader(Size size) {
    return ExpandableButton(
      child: Row(
        children: [
          Image.asset(
            imagePath ?? AppResources.images.home_part1,
            width: size.width * 0.25,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppResources.text_styles.h3,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(content),
              ],
            ),
          ),
          child == null
              ? const SizedBox()
              : Icon(
                  Icons.expand_more,
                  color: Colors.black54,
                ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }

  Widget buildExpanded(Size size) {
    return Column(
      children: [
        ExpandableButton(
          child: Row(
            children: [
              Image.asset(
                imagePath ?? AppResources.images.home_part1,
                width: size.width * 0.25,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppResources.text_styles.h3,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(content),
                  ],
                ),
              ),
              child == null
                  ? const SizedBox()
                  : Icon(
                      Icons.expand_less,
                      color: Colors.blueAccent,
                    ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
        child ?? const SizedBox()
      ],
    );
  }
}
