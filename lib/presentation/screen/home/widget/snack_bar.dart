import 'package:flutter/material.dart';
import 'package:toeic/bloc/model/enum.dart';

abstract class MySnackBar {
  static void showSnackBar(
      {required String message,
      required BuildContext context,
      Icon? icon,
      TypeMsg typeMsg = TypeMsg.info,
      Color? background,
      Color? foreground}) {
    print('-------SnackBar-message: $message');
    if (message.isEmpty) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          backgroundColor: getBackgroundColor(typeMsg),
          shape: const RoundedRectangleBorder(
              //side: BorderSide(color: Colors.white), //the outline color
              borderRadius: BorderRadius.all(Radius.circular(8))),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
          elevation: 30,
          content: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: icon ??
                    Icon(
                      Icons.info_outline,
                      color: foreground ?? Colors.white,
                    ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                        color: foreground ?? Colors.white, fontSize: 15),
                  )),
            ],
          )));
  }

  static Color getBackgroundColor(TypeMsg typeMsg) {
    switch (typeMsg) {
      case TypeMsg.sucess:
        return Colors.green;
      case TypeMsg.error:
        return Colors.red;
      case TypeMsg.info:
        return Colors.blueAccent;
      case TypeMsg.warning:
        return Colors.yellow;
    }
  }
}


