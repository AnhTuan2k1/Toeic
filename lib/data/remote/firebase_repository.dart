import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:toeic/data/di/di.dart';
import 'package:toeic/data/local/internal_storage.dart';
import 'package:toeic/data/model/exam_data.dart';
import 'package:toeic/data/model/exam_question.dart';
import 'package:toeic/data/model/question.dart';

class FirebaseRepository {
  final controller = StreamController<int>.broadcast();
  Stream<int> countstream() async* {
    yield* controller.stream;
  }int count = 0;

  Future<List<String>> _listAllDir(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    List<String> u = <String>[];
    for (var element in result.prefixes) {
      u.add(element.name);
    }
    return u;
  }

  Future<List<String>> _listAllFile(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    List<String> u = [];
    for (var element in result.items) {
      u.add(element.name);
    }
    return u;
  }

  Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  Future<Uint8List> _downloadInMemories(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final Uint8List? data = await ref.getData();

    if (data == null) throw '_downloadInMemories return null. $path failed';
    return data;
  }

  Future<File> _downloadAndSaveFile(String path) async {
    final Uint8List data = await _downloadInMemories(path);
    return getIt.get<InternalStorage>().writeData(data, path);
  }

  Future<File> downloadListeningTest(
      {required String part, required String fileName}) async {
    count = 0;controller.add(count);
    
    // download file
    String filePath = '/ToeicTest/listening/$part/$fileName';
    final data = await _downloadInMemories(filePath);

    controller.add(++count);

    // Read the file
    String jsonString = utf8.decode(data);
    dynamic contents = jsonDecode(jsonString);
    final exam = ExamQuestion.fromJson(contents);


    // download audios & images
    int i = 0;
    if(exam.id != ''){
      Question previousQuestion = Question(id: 'id', answers: [], correctAnswerId: 1);
      for (var element in exam.questions) {
        if(element.id == previousQuestion.id){
          count++;
          i++;
          continue;
        }
        if (element.image != null) {
          String path = '${exam.id}/image/${element.id}${element.image}';
          _downloadAndSaveFile(path);
          exam.questions[i].image = path;
        }
        if (element.audio != null) {
          String path = '${exam.id}/audio/${element.id}${element.audio}';
          _downloadAndSaveFile(path).then((value) => controller.add(++count));
          exam.questions[i].audio = path;
        }
        i++; previousQuestion = element;
      }
    }

    //write file to internal storage
    final test = getIt<InternalStorage>().writeTestFile(filePath, exam);

    // when all tasks are done then return
    return countstream()
        .firstWhere((element) => element == i + 1)
        .then<File>((value) => test);
  }

  Future<ExamData> readListeningFile() async {
    final part1 = _listAllFile('/ToeicTest/listening/part1');
    final part2 = _listAllFile('/ToeicTest/listening/part2');
    final part3 = _listAllFile('/ToeicTest/listening/part3');
    final part4 = _listAllFile('/ToeicTest/listening/part4');

    return ExamData(
        part1: await part1,
        part2: await part2,
        part3: await part3,
        part4: await part4);
  }

  Future<ExamData> readReadingFile() async {
    final part5 = _listAllFile('/ToeicTest/reading/part5');
    final part6 = _listAllFile('/ToeicTest/reading/part6');
    final part7 = _listAllFile('/ToeicTest/reading/part7');

    return ExamData(
        part1: await part5,
        part2: await part6,
        part3: await part7,
        part4: const []);
  }

  Future<File> downloadReadingTest({required String part, required String fileName}) async{
    count = 0;controller.add(count);

    // download file
    String filePath = '/ToeicTest/reading/$part/$fileName';
    final data = await _downloadInMemories(filePath);

    ++count;
    controller.add(++count);

    // Read the file
    String jsonString = utf8.decode(data);
    dynamic contents = jsonDecode(jsonString);
    final exam = ExamQuestion.fromJson(contents);

    //download image
    final questions = exam.questions;
    if(exam.id != ''){
      for (int i =0; i< questions.length;i++) {
        if (questions[i].image != null) {
          String path = '${exam.id}/image/${questions[i].id}${questions[i].image}';
          await _downloadAndSaveFile(path).then((value) => controller.add(++count));
          questions[i].image = path;
        }
      }
    }

    //write file to internal storage
    return getIt<InternalStorage>().writeTestFile(filePath, exam);
  }

// Future<bool> _downloadFileTest(String path) async {
//   // final status = await Permission.storage.request();
//   // if (!status.isGranted) return false;
//   print('--_downloadFileTest $path----------------');
//   final ref = FirebaseStorage.instance.ref(path);
//
//   final appDocDir = await getApplicationDocumentsDirectory();
//   print('--_downloaappDocDirhTest ${appDocDir.absolute}----------------');
//   final filePath = '${appDocDir.absolute.path}$path';
//   final file = File(filePath);
//   print('--_downloadFilepathTest $filePath----------------');
//   final downloadTask = ref.writeToFile(file);
//
//   downloadTask.snapshotEvents.listen((taskSnapshot) {
//     switch (taskSnapshot.state) {
//       case TaskState.running:
//         print('_downloadFileTest running');
//         break;
//       case TaskState.paused:
//         print('_downloadFileTest paused');
//         break;
//       case TaskState.success:
//         print('_downloadFileTest success');
//         break;
//       case TaskState.canceled:
//         print('_downloadFileTest canceled');
//         break;
//       case TaskState.error:
//         print('_downloadFileTest error');
//         break;
//     }
//   });
//
//   return downloadTask.then<bool>((taskSnapshot) =>
//       taskSnapshot.state == TaskState.success ? true : false);
// }

}
