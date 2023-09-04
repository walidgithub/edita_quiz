
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/strings_manager.dart';

Future<bool> onBackButtonPressed(BuildContext context) async {
  bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text(AppStrings.warning)),
          content: const Center(child: Text(AppStrings.exitApp)),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text(AppStrings.no)),
            TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text(AppStrings.yes)),
          ],
        );
      });
  return exitApp;
}