import 'package:json_annotation/json_annotation.dart';
import 'package:toeic/data/model/question.dart';


part 'exam_question.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamQuestion{
  String id;
  List<Question> questions;
  double mark;
  bool submited;

  int correctQuestions;
  int wrongQuestions;
  int notSelectedQuestions;


  ExamQuestion({required this.id, this.questions = const [], this.mark = 0, this.submited = false,
      this.correctQuestions = 0, this.wrongQuestions = 0, this.notSelectedQuestions = 0});

  factory ExamQuestion.fromJson(Map<String, dynamic> json) => _$ExamQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$ExamQuestionToJson(this);

  double makeMark(){
    correctQuestions = 0;
    wrongQuestions = 0;
    notSelectedQuestions = 0;
    return 0;
  }
}