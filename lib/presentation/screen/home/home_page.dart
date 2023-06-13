import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/bloc/progress/progress_cubit.dart';
import 'package:toeic/presentation/screen/home/reading/reading_page.dart';
import 'package:toeic/presentation/screen/home/widget/skill_card.dart';
import 'package:toeic/presentation/screen/home/speaking/speaking_page.dart';
import 'package:toeic/presentation/screen/home/writing/writing_page.dart';
import 'package:toeic/src/app_resources.dart';

import 'listening/listening_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String title = "Toeic";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeForm(),
    );
  }
}

class HomeForm extends StatelessWidget{
  const HomeForm({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height*0.07,),
          Text(
            'Toeic',
            style: AppResources.text_styles.h1,
          ),
          SizedBox(height: size.height*0.03,),
          SkillCard(
            imagePath: AppResources.images.home_listening,
            title: 'Listening',
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ListeningPage())),
            //content: "",
          ),
          SkillCard(
            imagePath: AppResources.images.home_reading,
            title: 'Reading',
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ReadingPage())),
          ),
          SkillCard(
            imagePath: AppResources.images.home_speaking,
            title: 'Speaking',
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SpeakingPage())),
          ),
          SkillCard(
            imagePath: AppResources.images.home_writing,
            title: 'Writing',
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const WritingPage())),
          ),
        ],
      ),
    );
  }

}

