import 'package:flutter/material.dart';

class PageBuilder extends StatefulWidget {
  final List<String> tasveer;
  const PageBuilder({super.key, required this.tasveer});

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  late List<String> _textOnImages; // Initialize for each image
  final PageController _pageController = PageController();
  bool isTapped = false; // Variable to track if "Add text" is tapped
  bool isTextTapped = false; // Variable to track if the text is tapped
  final TextEditingController _textEditingController = TextEditingController();

  String? _selectedFontstyle = "Option1";
  List<String> fontStyle = ["Option1", "Option2", "Option3"];

  int? selectedFontSize = 12;
  List<int> fontSize = [12, 14, 16, 18, 20];

  String? selectedFontColor = "White";
  List<String> fontColor = ["White", "Blue", "Red", "Orange"];

  int currentPage = 0; // Track the current page

  @override
  void initState() {
    super.initState();
    _textOnImages = List<String>.filled(widget.tasveer.length, "This is image");
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  Color _getColorFromName(String colorName) {
    switch (colorName) {
      case "White":
        return Colors.white;
      case "Blue":
        return Colors.blue;
      case "Red":
        return Colors.red;
      case "Orange":
        return Colors.orange;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0), // Separation from top
                  child: SizedBox(
                    height: 500, // Defined height for the PageView
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isTapped = false;
                        });
                      },
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: widget.tasveer.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 4, color: Colors.black),
                                  ),
                                  child: Image.asset(
                                    widget.tasveer[index],
                                    fit: BoxFit.fill,
                                    height: 500, // Adjusted to match container height
                                    width: 300,
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isTextTapped = true;
                                        _textEditingController.text = _textOnImages[index];
                                      });
                                    },
                                    child: isTextTapped && currentPage == index
                                        ? SizedBox(
                                            width: 200,
                                            child: TextField(
                                              controller: _textEditingController,
                                              style: TextStyle(
                                                fontSize: selectedFontSize?.toDouble(),
                                                color: _getColorFromName(selectedFontColor!),
                                              ),
                                              onSubmitted: (value) {
                                                setState(() {
                                                  _textOnImages[index] = value;
                                                  isTextTapped = true;
                                                  isTapped = true;
                                                });
                                              },
                                            ),
                                          )
                                        : Text(
                                            _textOnImages[index],
                                            style: TextStyle(
                                              fontSize: selectedFontSize?.toDouble() ?? 20,
                                              color: _getColorFromName(selectedFontColor!),
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (!isTapped) // Conditionally display the existing container
                  Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isTapped = true;
                              });
                            },
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
                    ),
                  ),
                if (isTapped) // Conditionally display the new container
                  Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Edit text Button
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isTextTapped = true; // Toggle the isTextTapped state
                                _textEditingController.text = _textOnImages[currentPage];
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: const Column(
                                children: [
                                  Icon(
                                    Icons.edit_document,
                                    size: 25,
                                  ),
                                  Text(
                                    'Edit',
                                    style: TextStyle(fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Font Style PopupMenu Button
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.font_download),
                          onSelected: (String value) {
                            setState(() {
                              _selectedFontstyle = value;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return fontStyle.map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                        ),
                        // Font Size PopupMenu Button
                        PopupMenuButton<int>(
                          icon: const Icon(Icons.numbers),
                          onSelected: (int value) {
                            setState(() {
                              selectedFontSize = value;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return fontSize.map((int choice) {
                              return PopupMenuItem<int>(
                                value: choice,
                                child: Text(choice.toString()),
                              );
                            }).toList();
                          },
                        ),
                        //Font Color PopupMenu Button
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.color_lens),
                          onSelected: (String value) {
                            setState(() {
                              selectedFontColor = value;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return fontColor.map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: MediaQuery.of(context).size.height / 2 - 25,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                if (currentPage > 0) {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
          Positioned(
            right: 10,
            top: MediaQuery.of(context).size.height / 2 - 25,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                if (currentPage < widget.tasveer.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
