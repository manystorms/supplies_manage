import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<void> showAlertWithoutChoice(BuildContext context, String title) {
  return showCupertinoDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(title),
        actions: [
          Center(
            child: TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}

Future<bool?> showAlertWithTwoChoice(BuildContext context, String title, String firstChoice, String secondChoice) {
  return showCupertinoDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(title),
        actions: [
          Center(
            child: Column(
              children: [
                TextButton(
                  child: Text(firstChoice),
                  onPressed: () {
                    Navigator.of(context).pop(true); // '예' 선택 시 true 반환
                  },
                ),
                const SizedBox(height: 12.0),
                TextButton(
                  child: Text(secondChoice),
                  onPressed: () {
                    Navigator.of(context).pop(false); // '아니요' 선택 시 false 반환
                  },
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}