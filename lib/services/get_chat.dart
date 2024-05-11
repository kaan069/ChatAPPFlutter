import 'dart:async';
import 'dart:math';
import 'package:dev_muscle_chat_app/variables/home.dart';
import 'package:dev_muscle_chat_app/widget/message.dart';
import 'package:flutter/material.dart';

void getChatFun(BuildContext context) async {
  Timer.periodic(Duration(seconds: 1), (timer) {
    var random = Random();
    messageList.value.add(message(context, random.nextBool(),
        "Furakan Kaan Saka", "amir hocam çok yakışıklısınız!!", "20:00"));
  });
}
