import 'package:app/widget/myappbar.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/textandvoice.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: 30, 
            itemBuilder: (context, index) => const Text(
              'List'
            )
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextAndVoiceField(),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    )
    );
  }
}
