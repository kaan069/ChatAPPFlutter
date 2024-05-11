import 'package:flutter/material.dart';

TextEditingController chatMassageController = TextEditingController();
ValueNotifier<bool> sendMassageBtnVisible = ValueNotifier(false);
ValueNotifier<List<Widget>> messageList = ValueNotifier<List<Widget>>([]);
