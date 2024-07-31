import 'package:flutter/material.dart';
import 'styles.dart';

class TextEditor extends StatelessWidget {
  final bool isTextTapped;
  final String text;
  final int? selectedFontSize;
  final String? selectedFontColor;
  final TextEditingController textEditingController;
  final VoidCallback onTap;
  final Function(String) onSubmitted;

  const TextEditor({
    Key? key,
    required this.isTextTapped,
    required this.text,
    required this.selectedFontSize,
    required this.selectedFontColor,
    required this.textEditingController,
    required this.onTap,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isTextTapped
          ? SizedBox(
              width: 200,
              child: TextField(
                controller: textEditingController,
                style: TextStyle(
                  fontSize: selectedFontSize?.toDouble(),
                  color: getColorFromName(selectedFontColor!),
                ),
                onSubmitted: onSubmitted,
              ),
            )
          : Text(
              text,
              style: TextStyle(
                fontSize: selectedFontSize?.toDouble() ?? 20,
                color: getColorFromName(selectedFontColor!),
              ),
            ),
    );
  }
}