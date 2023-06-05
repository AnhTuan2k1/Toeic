


import 'package:flutter/material.dart';
import 'package:toeic/presentation/widget/card_background.dart';

showDialogProgress(BuildContext context,{String msg = ''}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CardBackGround(
            margin: EdgeInsets.only(left: 15, right: 15),
            padding: EdgeInsets.all(15),
            borderRadius: BorderRadius.circular(5),
            child: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 15),
                Expanded(child: Text(msg))
              ],
            ),
          ),
        );
      });
}

Future<bool?> showYesNoDialog({required BuildContext context, required String content}) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: const Text('No', style: TextStyle(fontSize: 17),),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: const Text('Yes', style: TextStyle(fontSize: 17),),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}

Future<void> showAlertDialog({required BuildContext context, String title = '', String alertContent = ''}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('$title 🤧'),
        content: SingleChildScrollView(
            child: Text(alertContent)
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Oke', style: TextStyle(fontSize: 17),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}