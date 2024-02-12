import 'package:flutter/material.dart';

import 'appbar/im_app_bar.dart';
import 'message_list/chat_body_container.dart';

class ChatDetailsPage extends StatefulWidget {
  const ChatDetailsPage({super.key});

  @override
  State<ChatDetailsPage> createState() => _ChatDetailsPageState();
}

class _ChatDetailsPageState extends State<ChatDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ImAppBar(),
      body: Column(
        children: [
          ChatBodyContainer(),
        ],
      ),
    );
  }
}
