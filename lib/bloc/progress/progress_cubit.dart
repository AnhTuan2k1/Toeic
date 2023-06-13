
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'progress_state.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit() : super(const ProgressState());

  void progressChanged(double value){
    emit(state.copyWith(value: value));
  }

}
