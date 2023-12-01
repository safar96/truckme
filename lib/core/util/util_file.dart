import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void alert(BuildContext ctn, String title, String body) async {
  showDialog(
    context: ctn,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text("Ok"),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
