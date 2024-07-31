import 'package:flutter/material.dart';
import 'text_editor.dart';
import 'styles.dart';

class ImageViewer extends StatelessWidget {
  final List<String> tasveer;
  final PageController pageController;
  final int currentPage;
  final List<String> textOnImages;
  final bool isTextTapped;
  final int? selectedFontSize;
  final String? selectedFontColor;
  final TextEditingController textEditingController;
  final VoidCallback onTextTap;
  final Function(String) onTextSubmitted;

  const ImageViewer({
    Key? key,
    required this.tasveer,
    required this.pageController,
    required this.currentPage,
    required this.textOnImages,
    required this.isTextTapped,
    required this.selectedFontSize,
    required this.selectedFontColor,
    required this.textEditingController,
    required this.onTextTap,
    required this.onTextSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        height: 500,
        child: PageView.builder(
          controller: pageController,
          itemCount: tasveer.length,
          itemBuilder: (context, index) {
            return Center(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.black),
                    ),
                    child: Image.asset(
                      tasveer[index],
                      fit: BoxFit.fill,
                      height: 500,
                      width: 300,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: TextEditor(
                      isTextTapped: isTextTapped && currentPage == index,
                      text: textOnImages[index],
                      selectedFontSize: selectedFontSize,
                      selectedFontColor: selectedFontColor,
                      textEditingController: textEditingController,
                      onTap: onTextTap,
                      onSubmitted: onTextSubmitted,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}