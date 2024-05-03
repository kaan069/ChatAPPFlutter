import 'package:cosmos/cosmos.dart';
import 'package:dev_muscle_chat_app/theme/color.dart';
import 'package:dev_muscle_chat_app/variables/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        //scrollable: true,
        //scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "devMuscle",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.menu,
                  color: textColor,
                  size: 25,
                )
              ],
            ),
          ),
          Expanded(
              child: CosmosBody(
            scrollDirection: Axis.vertical,
            scrollable: true,
            children: [
              message(context, true),
              message(context, false),
              message(context, true),
              message(context, false),
              message(context, true),
              message(context, true),
              message(context, true),
              message(context, true),
            ],
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: width(context),
            decoration: BoxDecoration(
                color: cColor, borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextField(
                      controller: chatMassageController,
                      cursorColor: textColor,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                      ),
                      decoration: const InputDecoration(
                          hintText: "Mesaj yaz...",
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none),
                      onChanged: (value) {
                        if (chatMassageController.text.isEmpty) {
                          sendMassageBtnVisible.value = true;
                        } else {
                          sendMassageBtnVisible.value = false;
                        }
                      }),
                ),
                ValueListenableBuilder(
                  valueListenable: sendMassageBtnVisible,
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value == true ? 1 : 0.5,
                      child: const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 8,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 0,
          )
        ],
      ),
    );
  }

  Row message(BuildContext context, bool sender) {
    return Row(
      mainAxisAlignment:
          sender ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          width: width(context) * 0.65,
          decoration: BoxDecoration(
            color: navColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User Name",
                style: TextStyle(
                  color: textColor.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
              Text(
                "Hello World",
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "20:00",
                    style: TextStyle(
                      color: textColor.withOpacity(0.7),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
