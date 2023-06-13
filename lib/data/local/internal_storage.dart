

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:toeic/data/model/exam_data.dart';
import 'package:toeic/data/model/exam_question.dart';

class InternalStorage{

  Future<File> _getLocalFile(String filepath) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}$filepath').create(recursive: true);
  }

  Future<File> writeData(Uint8List data, String filepath) async {
    final file = await _getLocalFile(filepath);

    return file.writeAsBytes(data);
  }

  Future<Uint8List> readData(String filepath) async {
    final file = await _getLocalFile(filepath);
    return file.readAsBytes();
  }

  Future<ExamQuestion> readTestFile(String path) async{
    final file = await _getLocalFile(path);

    // Read the file
    final contents = await file.readAsString();
    final exam = ExamQuestion.fromJson(jsonDecode(contents));
    return exam;
  }

  Future<File> writeTestFile(String path, ExamQuestion data) async{
    final file = await _getLocalFile(path);

    // write the file
    return file.writeAsString(jsonEncode(data.toJson()), mode: FileMode.writeOnly);
  }

  Future<ExamData> _readInfoFile(String path) async{
    final file = await _getLocalFile(path);

    // Read the file
    final contents = await file.readAsString();
    final exam = ExamData.fromJson(jsonDecode(contents));
    return exam;
  }

  Future<File> _writeInfoFile(String path, ExamData data) async{
    final file = await _getLocalFile(path);

    // write the file
    return file.writeAsString(jsonEncode(data.toJson()), mode: FileMode.writeOnly);
  }

  Future<ExamQuestion> readListeningTestFile(String part, String fileName) async{
    return readTestFile('/ToeicTest/listening/$part/$fileName');
  }

  Future<ExamData> readListeningInfoFile() async{
    return _readInfoFile('/ToeicTest/listening.json');
  }

  Future<File> writeListeningInfoFile(ExamData examData) async{
    return _writeInfoFile('/ToeicTest/listening.json', examData);
  }

  Future<ExamData> readReadingInfoFile() async{
    return _readInfoFile('/ToeicTest/reading.json');
  }

  Future<File> writeReadingInfoFile(ExamData examData) async{
    return _writeInfoFile('/ToeicTest/reading.json', examData);
  }
}