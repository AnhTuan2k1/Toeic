import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:toeic/bloc/model/enum.dart';
import 'package:toeic/bloc/model/response_message.dart';
import 'package:toeic/data/di/di.dart';
import 'package:toeic/data/local/internal_storage.dart';
import 'package:toeic/data/model/exam_data.dart';
import 'package:toeic/data/remote/firebase_repository.dart';

part 'writing_state.dart';

class WritingCubit extends Cubit<WritingState> {
  WritingCubit()
      : super(WritingState(
            localData:
                ExamData(part1: [], part2: [], part3: [], part4: [], part5: []),
            remoteData:
                ExamData(part1: [], part2: [], part3: [], part4: [], part5: []),
            respondMsg: ResponseMessage())) {
    Future.delayed(
        const Duration(
          milliseconds: 100,
        ),
        _initData);
  }

  Future<void> _initData() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        if (await InternetConnectionChecker().hasConnection) {
          _getRemoteData().then((value) => emit(state.copyWith(remoteData: value)));
        }
      }
    });

    _getInternalData().then((value) => emit(state.copyWith(localData: value)));
    _getRemoteData().then((value) => emit(state.copyWith(remoteData: value)));
  }

  Future<ExamData> _getInternalData() async {
    ExamData localdata = state.localData;
    try {
      localdata = await getIt.get<InternalStorage>().readWritingInfoFile();
    } catch (e) {
      //showMessage(e.toString());
    }
    return localdata;
  }

  Future<ExamData> _getRemoteData() async {
    ExamData remotedata = state.remoteData;
    try {
      if (await InternetConnectionChecker().hasConnection) {
        remotedata = await getIt.get<FirebaseRepository>().readWritingFile();
      }
    } catch (e) {
      showMessage(e.toString(), typeMsg: TypeMsg.error);
    }
    return remotedata;
  }

  Future<bool> downloadData(String fileName, String part) async {
    try {
      if (!await InternetConnectionChecker().hasConnection) {
        showMessage('no Internet connection');
        return false;
      }

      //download and save changes
      await getIt
          .get<FirebaseRepository>()
          .downloadWritingTest(part: part, fileName: fileName);
      final localData = addpartlocal(part, fileName);
      _writeData(state.localData);

      //emit
      state.localData =
          ExamData(part1: [], part2: [], part3: [], part4: [], part5: []);
      emit(state.copyWith(localData: localData));

      return true;
    } catch (e) {
      showMessage(e.toString(), typeMsg: TypeMsg.error);
      return false;
    }
  }

  Future<void> _writeData(ExamData examData) async {
    getIt.get<InternalStorage>().writeWritingInfoFile(examData);
  }

  void showMessage(String msg, {TypeMsg typeMsg = TypeMsg.info}) {
    state.respondMsg.message = '';
    emit(state.copyWith(
        respondMsg: ResponseMessage(message: msg, typeMsg: typeMsg)));
  }

  ExamData addpartlocal(String part, String fileName) {
    switch (part) {
      case 'q15':
        state.localData.part1.add(fileName);
        break;
      case 'q67':
        state.localData.part2.add(fileName);
        break;
      case 'q8':
        state.localData.part3.add(fileName);
        break;
    }
    return state.localData;
  }
}
