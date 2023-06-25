import 'package:json_annotation/json_annotation.dart';

part 'exam_data.g.dart';

@JsonSerializable()
class ExamData {
  ExamData(
      {required this.part1,
      required this.part2,
      required this.part3,
      required this.part4,
      required this.part5});

  @JsonKey(defaultValue: [])
  List<String> part1;

  @JsonKey(defaultValue: [])
  List<String> part2;

  @JsonKey(defaultValue: [])
  List<String> part3;

  @JsonKey(defaultValue: [])
  List<String> part4;

  @JsonKey(defaultValue: [])
  List<String> part5;

  factory ExamData.fromJson(Map<String, dynamic> json) =>
      _$ExamDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDataToJson(this);
}
