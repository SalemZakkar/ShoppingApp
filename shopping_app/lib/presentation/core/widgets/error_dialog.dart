import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/salem_package.dart';

extension ErrorDialog on ScreenUtil {
  showErrorMessage(FailureType failureType, BuildContext context) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        borderRadius: 15,
        title: "Error",
        confirmBtnColor: Colors.red,
        text: errorMessages[failureType] ?? "Unknown");
  }
}
