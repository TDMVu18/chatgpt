import 'package:flutter/material.dart';

class ToogleButton extends StatefulWidget {
  const ToogleButton({super.key});

  @override
  State<ToogleButton> createState() => _ToogleButtonState();
}

class _ToogleButtonState extends State<ToogleButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {}, 
      child: Icon(Icons.send ));
  }
}