// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamQuestion _$ExamQuestionFromJson(Map<String, dynamic> json) => ExamQuestion(
      id: json['id'] as String,
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      mark: (json['mark'] as num?)?.toDouble() ?? 0,
      submited: json['submited'] as bool? ?? false,
      correctQuestions: json['correctQuestions'] as int? ?? 0,
      wrongQuestions: json['wrongQuestions'] as int? ?? 0,
      notSelectedQuestions: json['notSelectedQuestions'] as int? ?? 0,
    );

Map<String, dynamic> _$ExamQuestionToJson(ExamQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questions': instance.questions.map((e) => e.toJson()).toList(),
      'mark': instance.mark,
      'submited': instance.submited,
      'correctQuestions': instance.correctQuestions,
      'wrongQuestions': instance.wrongQuestions,
      'notSelectedQuestions': instance.notSelectedQuestions,
    };
