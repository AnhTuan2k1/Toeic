

abstract class AppConvert {

  static String formatDuration(Duration duration){
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if(duration.inHours > 0) hours, minutes, seconds,
    ].join(':');
  }

  static String formatDurationSeconds(int duration){
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits((duration/(216000)).floor());
    final minutes = twoDigits((duration/3600).floor());
    final seconds = twoDigits(duration.remainder(60));
    return [hours, minutes, seconds].join(':');
  }

}