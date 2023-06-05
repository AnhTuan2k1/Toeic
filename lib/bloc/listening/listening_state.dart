part of 'listening_cubit.dart';

class ListeningState extends Equatable {
  ListeningState(
      {required this.localData, required this.remoteData, required this.respondMsg});

  ExamData localData;
  ExamData remoteData;
  ResponseMessage respondMsg;


  @override
  List<Object> get props => [localData, remoteData, respondMsg];

  ListeningState copyWith(
      {ExamData? localData, ExamData? remoteData, ResponseMessage? respondMsg}) {
    return ListeningState(
        localData: localData ?? this.localData,
        remoteData: remoteData ?? this.remoteData,
        respondMsg: respondMsg ?? this.respondMsg);
  }
}
