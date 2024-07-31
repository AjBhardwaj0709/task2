import 'package:flutter/material.dart';
import 'package:task/styles.dart';

class Toolbar extends StatelessWidget {
  final bool isTapped;
  final VoidCallback onTap;
  final String? selectedFontstyle;
  final int? selectedFontSize;
  final String? selectedFontColor;
  final Function(String?) onFontStyleSelected;
  final Function(int?) onFontSizeSelected;
  final Function(String?) onFontColorSelected;
  final VoidCallback onEditTap;

  const Toolbar({
    super.key,
    required this.isTapped,
    required this.onTap,
    required this.selectedFontstyle,
    required this.selectedFontSize,
    required this.selectedFontColor,
    required this.onFontStyleSelected,
    required this.onFontSizeSelected,
    required this.onFontColorSelected,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: isTapped ? _buildEditingToolbar() : _buildAddTextButton(),
    );
  }

  Widget _buildAddTextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: onTap,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.text_fields),
                Text("Add text"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditingToolbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildEditButton(),
        _buildFontStyleButton(),
        _buildFontSizeButton(),
        _buildFontColorButton(),
      ],
    );
  }

  Widget _buildEditButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: onEditTap,
        child: Container(
          height: 40,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: const Column(
            children: [
              Icon(Icons.edit_document, size: 25),
              Text('Edit', style: TextStyle(fontSize: 10, color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFontStyleButton() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.font_download),
      onSelected: onFontStyleSelected,
      itemBuilder: (BuildContext context) {
        return fontStyle.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  Widget _buildFontSizeButton() {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.numbers),
      onSelected: onFontSizeSelected,
      itemBuilder: (BuildContext context) {
        return fontSize.map((int choice) {
          return PopupMenuItem<int>(
            value: choice,
            child: Text(choice.toString()),
          );
        }).toList();
      },
    );
  }

  Widget _buildFontColorButton() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.color_lens),
      onSelected: onFontColorSelected,
      itemBuilder: (BuildContext context) {
        return fontColor.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}