import 'package:cosmos/cosmos.dart';
import 'package:dev_muscle_chat_app/page/home.dart';
import 'package:dev_muscle_chat_app/theme/color.dart';
import 'package:flutter/material.dart';

Future<void> loginServices(
  BuildContext context,
  String email,
  String password,
) async {
  CosmosAlert.loadingIOS(context);
  await CosmosFirebase.signIn(
      email: email,
      password: password,
      trError: true,
      onError: (error) {
        Navigator.pop(context);
        CosmosAlert.showMessage(context, "Opss..", error,
            backgroundColor: navColor, color: textColor);
      },
      onSuccess: () {
        Navigator.pop(context);
        CosmosNavigator.pushDownFromTop(context, const HomePage());
      });
}
