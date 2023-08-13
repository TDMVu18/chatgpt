import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';
import 'dart:io';
class UploadPdfScreen extends StatefulWidget {
  @override
  _UploadPdfScreenState createState() => _UploadPdfScreenState();
}

class _UploadPdfScreenState extends State<UploadPdfScreen> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      String fileName = result.files.single.name;
      PlatformFile file = result.files.first;
      String filePath = file.path ?? '';

      try {
        await storage.ref('pdfs/$fileName').putFile(File(filePath));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File uploaded successfully.')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File upload failed.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload PDF')),
      body: Center(
        child: ElevatedButton(
          onPressed: uploadFile,
          child: Text('Upload PDF'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: UploadPdfScreen()));
}