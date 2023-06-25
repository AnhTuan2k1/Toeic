// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as String,
      content: json['content'] as String? ?? '',
      otherContent: json['otherContent'] as String? ?? '',
      audio: json['audio'] as String?,
      image: json['image'] as String?,
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      correctAnswerId: json['correctAnswerId'] as int? ?? 0,
      selectedAnswerId: json['selectedAnswerId'] as int?,
      explanation: json['explanation'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'otherContent': instance.otherContent,
      'audio': instance.audio,
      'image': instance.image,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
      'correctAnswerId': instance.correctAnswerId,
      'selectedAnswerId': instance.selectedAnswerId,
      'explanation': instance.explanation,
      'title': instance.title,
    };
