import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushBarService {
  static void show(BuildContext context) {
    Flushbar(
      title:  "Что-то пошло не так!",
      message:  "Попробуйте позже!",
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
    ).show(context);
  }
}