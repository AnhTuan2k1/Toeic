

import 'package:toeic/bloc/model/enum.dart';

class ResponseMessage{
  String message;
  TypeMsg typeMsg;

  ResponseMessage({this.message = '', this.typeMsg = TypeMsg.info});
}