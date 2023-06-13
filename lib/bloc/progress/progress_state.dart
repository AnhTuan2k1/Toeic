part of 'progress_cubit.dart';

class ProgressState extends Equatable {
  const ProgressState({
    this.value = 0,
  });

  final double value;

  @override
  List<Object?> get props => [value];

  ProgressState copyWith({double? value}) {
    return ProgressState(
      value: value ?? this.value,
    );
  }
}
