import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:toeic/data/model/answer.dart';

part 'question.g.dart';

@JsonSerializable(explicitToJson: true)
class Question {
  String id;
  String content;
  String otherContent;
  String? audio;
  String? image;

  @JsonKey(defaultValue: [])
  List<Answer> answers;

  @JsonKey(defaultValue: 0)
  int correctAnswerId;

  int? selectedAnswerId;
  String explanation;
  String title;

  Question(
      {required this.id,
      this.content = '',
      this.otherContent = '',
      this.audio,
      this.image,
      required this.answers,
      required this.correctAnswerId,
      this.selectedAnswerId,
      this.explanation = '',
      this.title = ''});

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
