import 'package:flutter/material.dart';
import 'page_builder.dart';
import 'image_viewer.dart';
import 'toolbar.dart';
import 'utils.dart';

class PageBuilderState extends State<PageBuilder> {
  late List<String> _textOnImages;
  final PageController _pageController = PageController();
  bool isTapped = false;
  bool isTextTapped = false;
  final TextEditingController _textEditingController = TextEditingController();

  String? _selectedFontstyle = "Option1";
  int? selectedFontSize = 12;
  String? selectedFontColor = "White";

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _textOnImages = List<String>.filled(widget.tasveer.length, "This is image");
    _pageController.addListener(_onPageChange);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChange);
    _pageController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  void _onPageChange() {
    setState(() {
      currentPage = _pageController.page!.toInt();
    });
  }

  void _toggleTapped() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  void _toggleTextTapped() {
    setState(() {
      isTextTapped = !isTextTapped;
      _textEditingController.text = _textOnImages[currentPage];
    });
  }

  void _updateText(String value) {
    setState(() {
      _textOnImages[currentPage] = value;
      isTextTapped = false;
      isTapped = true;
    });
  }

  void _updateFontStyle(String? value) {
    setState(() {
      _selectedFontstyle = value;
    });
  }

  void _updateFontSize(int? value) {
    setState(() {
      selectedFontSize = value;
    });
  }

  void _updateFontColor(String? value) {
    setState(() {
      selectedFontColor = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ImageViewer(
                  tasveer: widget.tasveer,
                  pageController: _pageController,
                  currentPage: currentPage,
                  textOnImages: _textOnImages,
                  isTextTapped: isTextTapped,
                  selectedFontSize: selectedFontSize,
                  selectedFontColor: selectedFontColor,
                  textEditingController: _textEditingController,
                  onTextTap: _toggleTextTapped,
                  onTextSubmitted: _updateText,
                ),
                const SizedBox(height: 20),
                Toolbar(
                  isTapped: isTapped,
                  onTap: _toggleTapped,
                  selectedFontstyle: _selectedFontstyle,
                  selectedFontSize: selectedFontSize,
                  selectedFontColor: selectedFontColor,
                  onFontStyleSelected: _updateFontStyle,
                  onFontSizeSelected: _updateFontSize,
                  onFontColorSelected: _updateFontColor,
                  onEditTap: _toggleTextTapped,
                ),
              ],
            ),
          ),
          buildNavigationButtons(context, currentPage, widget.tasveer.length, _pageController),
        ],
      ),
    );
  }
}