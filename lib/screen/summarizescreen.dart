import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';
import 'package:openai/api.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:dart_openai/dart_openai.dart';

class SummarizeScreen extends StatefulWidget {
  @override
  _SummarizeScreenState createState() => _SummarizeScreenState();
}

class _SummarizeScreenState extends State<SummarizeScreen> {
  final openai = OpenAIApi; // Thay YOUR_OPENAI_API_KEY bằng API key

  File? pdfFile;
  String summaryText = '';

  Future<void> copyPdfToDocuments(File file) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String pdfDocumentsPath =
        '${documentsDirectory.path}/${file.path.split('/').last}';

    pdfFile = await file.copy(pdfDocumentsPath);
  }

  Future<void> summarizePdf() async {
    if (pdfFile == null) {
      print('Vui lòng tải lên tệp PDF trước.');
      return;
    }

    String prompt = 'Summarize the content of the uploaded PDF file.';

    try {
      String inputText = await createPdfText(pdfFile!);
      String textToSummarize = '$prompt\n$inputText';

      final completion = await openai.createCompletion(
        model: 'text-davinci-003', // Thay bằng model muốn sử dụng
        prompt: textToSummarize,
        maxTokens: 100,
      );

      setState(() {
        summaryText = completion.choices.first.text;
      });
    } catch (e) {
      print('Đã xảy ra lỗi: $e');
    }
  }

  Future<String> createPdfText(File file) async {
    // Đọc nội dung tệp PDF và chuyển đổi thành văn bản
    return 'Nội dung tệp PDF đã được chuyển đổi thành văn bản.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summarize PDF'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );

                if (result != null) {
                  File file = File(result.files.single.path!);
                  await copyPdfToDocuments(file);
                }
              },
              child: Text('Upload PDF'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: summarizePdf,
              child: Text('Summarize PDF'),
            ),
            SizedBox(height: 20),
            Text(
              summaryText,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
