import 'package:flutter/material.dart';

class PageBuilder extends StatefulWidget {
  final List<String> tasveer;
  const PageBuilder({super.key, required this.tasveer});

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  final String _textOnImage = "This is image"; // This should be updated with the text from the editor
  final PageController _pageController = PageController();
  bool isTapped = false; // Variable to track if "Add text" is tapped

  String? _selectedFontstyle = "Option1";
  List<String> fontStyle = ["Option1", "Option2", "Option3"];

  int? selectedFontSize = 12;
  List<int> fontSize = [12, 14, 16, 18, 20];

  String? selectedFontColor = "Black";
  List<String> fontColor = ["Black", "Blue", "red", "orange"];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0), // Separation from top
              child: SizedBox(
                height: 500, // Defined height for the PageView
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
                            child: Text(
                              _textOnImage,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                backgroundColor: Colors.black.withOpacity(0.5),
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
                            isTapped = true; // Toggle the isTapped state
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
                onTap: () {},
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
        
            PopupMenuButton(
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
            )
          ],
        ),
      ),
              
          ],
        ),
      ),
    );
  }
}
