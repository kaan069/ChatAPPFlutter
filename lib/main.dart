import 'package:dev_muscle_chat_app/page/home.dart';
import 'package:flutter/material.dart';

void main(){
  
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Login(),
      
    );
  }
}