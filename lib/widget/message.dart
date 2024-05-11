import 'package:cosmos/cosmos.dart';
import 'package:dev_muscle_chat_app/theme/color.dart';
import 'package:flutter/material.dart';

Widget message(BuildContext context, bool sender, String name, String message,
      String timestamp) {
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
                name,
                style: TextStyle(
                  color: textColor.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
              Text(
                message,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    timestamp,
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

