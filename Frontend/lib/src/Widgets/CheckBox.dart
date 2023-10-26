import 'package:flutter/material.dart';

class TextWithCheckbox extends StatefulWidget {
  final String text;

  const TextWithCheckbox({Key? key, required this.text}) : super(key: key);

  @override
  _TextWithCheckboxState createState() => _TextWithCheckboxState();
}

class _TextWithCheckboxState extends State<TextWithCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.text),
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
      ],
    );
  }
}
