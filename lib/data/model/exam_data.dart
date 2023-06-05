import 'package:json_annotation/json_annotation.dart';

part 'exam_data.g.dart';

@JsonSerializable()
class ExamData {
  ExamData(
      {required this.part1,
      required this.part2,
      required this.part3,
      required this.part4});

  List<String> part1;
  List<String> part2;
  List<String> part3;
  List<String> part4;

  factory ExamData.fromJson(Map<String, dynamic> json) =>
      _$ExamDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDataToJson(this);
}
