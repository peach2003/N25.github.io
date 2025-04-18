import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ungdungdatlichkham/hive/Boxes.dart';
import 'package:ungdungdatlichkham/hive/chat_history.dart';
import 'package:ungdungdatlichkham/widgets/chat_history_widget.dart';
import 'package:ungdungdatlichkham/widgets/empty_history_widget.dart';

import 'chat_screen.dart';

class ChatHistoryscreen extends StatefulWidget {
const ChatHistoryscreen({super.key});

@override
State<ChatHistoryscreen> createState() => _ChatHistoryscreenState();
}

class _ChatHistoryscreenState extends State<ChatHistoryscreen> {
@override
Widget build(BuildContext context){
return Scaffold(
  appBar: AppBar(
    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    centerTitle: true,
    title: const Text('Lịch sử nhắn tin'),
  ),
    body: ValueListenableBuilder<Box<ChatHistory>>(
        valueListenable: Boxes.getChatHistory().listenable(),
        builder: (context, box, _){
          final chatHistory = box.values.toList().cast<ChatHistory>();
          return chatHistory.isEmpty
              ? const EmptyHistoryWidget()
              : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: chatHistory.length,
              itemBuilder: (context, index){
                final chat = chatHistory[index];
                return ChatHistoryWidget(chat: chat);
              },
            ),
          );
        }

    ,));
}
}

