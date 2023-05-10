import 'package:flutter/material.dart';
import 'package:toeic/presentation/widget/card_background.dart';
import 'package:toeic/src/app_resources.dart';

class SkillCard extends StatelessWidget {
  const SkillCard(
      {Key? key,
      this.imagePath,
      this.title = '',
      this.content = '',
      this.onPressed})
      : super(key: key);
  final String title;
  final String? imagePath;
  final String content;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: CardBackGround(
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(size.width * 0.05, size.height * 0.015,
            size.width * 0.05, size.height * 0.015),
        child: Row(
          children: [
            Image.asset(
              imagePath ?? AppResources.images.home_part1,
              width: size.width * 0.25,
            ),
            const SizedBox(width: 5,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppResources.text_styles.h3,
                  ),
                  const SizedBox(height: 5,),
                  Text(content),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
