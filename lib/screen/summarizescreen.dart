import 'package:app/widget/myappbar.dart';
import 'package:flutter/material.dart';

class SummarizeScreen extends StatelessWidget {
  const SummarizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: Text('á đù anh Vũ'),
      ),
    );
  }
}