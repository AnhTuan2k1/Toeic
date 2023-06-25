// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamData _$ExamDataFromJson(Map<String, dynamic> json) => ExamData(
      part1:
          (json['part1'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      part2:
          (json['part2'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      part3:
          (json['part3'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      part4:
          (json['part4'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      part5:
          (json['part5'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$ExamDataToJson(ExamData instance) => <String, dynamic>{
      'part1': instance.part1,
      'part2': instance.part2,
      'part3': instance.part3,
      'part4': instance.part4,
      'part5': instance.part5,
    };
