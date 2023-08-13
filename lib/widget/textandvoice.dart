import 'package:app/widget/toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextAndVoiceField extends StatelessWidget {
  const TextAndVoiceField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            decoration: InputDecoration(border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary
            ),
            borderRadius: BorderRadius.circular(12,)
            ),
          ),
          )
          ),
          const SizedBox(
            width: 6,
          ),
          const ToogleButton()
      ],
    );
  }
}
