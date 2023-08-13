import 'package:app/screen/summarizescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/service/checkkey.dart';
import 'package:app/provider/global.dart';
import "package:app/screen/chatscreen.dart";

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _keyresponse = '';
  String _openaikey = Global.openaiKeys;
  var _select = true;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  width: 200,
                  child: Image.asset('assets/images/open.png')),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: _textEditingController,
                            decoration: InputDecoration(labelText: 'OpenAI API key'),
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                          ),
                          ElevatedButton(
                              onPressed: () => _chatnav(context),
                              child: Text('Get to Chat Screen')),
                          ElevatedButton(
                              onPressed: () => _summarizenav(context),
                              child: Text('Get to Summarize Screen')),
                          Text(_keyresponse),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _chatnav(BuildContext context) async {
    _openaikey = _textEditingController.text;
    //_openaikey = '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';
    bool isValidKey = await checkAPIKey(_openaikey);
    if (!isValidKey) {
      setState(() {
        _keyresponse = "API key is invalid.";
      });
    } else {
      setState(() {
        _keyresponse = "API key is valid.";
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatScreen()),
      );
    }
  }

  void _summarizenav(BuildContext context) async {
    _openaikey = _textEditingController.text;
    //_openaikey = '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';
    bool isValidKey = await checkAPIKey(_openaikey);
    if (!isValidKey) {
      setState(() {
        _keyresponse = "API key is invalid.";
      });
    } else {
      setState(() {
        _keyresponse = "API key is valid.";
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SummarizeScreen()),
      );
    }
  }
}
