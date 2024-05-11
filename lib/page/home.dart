import 'package:cosmos/cosmos.dart' show CosmosBody, width;
import 'package:dev_muscle_chat_app/services/get_chat.dart';
import 'package:dev_muscle_chat_app/theme/color.dart';
import 'package:dev_muscle_chat_app/variables/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _LoginState();
}

class _LoginState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getChatFun(context);
  }

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
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
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
              child: ValueListenableBuilder(
            valueListenable: messageList,
            builder: (context, value, child) {
              return CosmosBody(
                scrollDirection: Axis.vertical,
                scrollable: true,
                children: value,
              );
            },
          )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
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
}
