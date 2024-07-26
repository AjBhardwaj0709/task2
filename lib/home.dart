import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> _images = [
    'assets/flutterImage.jpg',
    'assets/flutterImage.jpg',
    'assets/flutterImage.jpg',
  ];

  List<List<TextEditingController>> _textControllers = [];
  List<List<Offset>> _textPositions = [];
  List<List<Size>> _textSizes = [];

  @override
  void initState() {
    super.initState();
    _textControllers = List.generate(_images.length, (_) => []);
    _textPositions = List.generate(_images.length, (_) => []);
    _textSizes = List.generate(_images.length, (_) => []);
  }

  void _nextPage() {
    if (_currentIndex < _images.length - 1) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.animateToPage(
        _currentIndex - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _addTextArea() {
    setState(() {
      _textControllers[_currentIndex].add(TextEditingController());
      _textPositions[_currentIndex].add(Offset(50, 50));
      _textSizes[_currentIndex].add(Size(200, 50));
    });
  }

  void _deleteTextArea(int index) {
    setState(() {
      _textControllers[_currentIndex].removeAt(index);
      _textPositions[_currentIndex].removeAt(index);
      _textSizes[_currentIndex].removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: _images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 8),
                              ),
                              child: Image.asset(
                                _images[index],
                                width: 300,
                                height: 500,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        for (int i = 0; i < _textControllers[index].length; i++)
                          Positioned(
                            left: _textPositions[index][i].dx,
                            top: _textPositions[index][i].dy,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                setState(() {
                                  _textPositions[index][i] += details.delta;
                                });
                              },
                              child: Container(
                                width: _textSizes[index][i].width,
                                height: _textSizes[index][i].height,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: Colors.black.withOpacity(0.3),
                                ),
                                child: Stack(
                                  children: [
                                    TextField(
                                      controller: _textControllers[index][i],
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(8),
                                      ),
                                    ),
                                    // New Delete Icon in Top Right Corner
                                    Positioned(
                                      top: -2,
                                      right: -2,
                                      child: IconButton(
                                        icon: Icon(Icons.close, color: Colors.red),
                                        onPressed: () {
                                          _deleteTextArea(i);
                                        },
                                        constraints: BoxConstraints(),
                                        padding: EdgeInsets.all(2),
                                        iconSize: 20,
                                      ),
                                    ),
                                    // New Resize Icon in Bottom Right Corner
                                    Positioned(
                                      bottom: -2,
                                      right: -2,
                                      child: GestureDetector(
                                        onPanUpdate: (details) {
                                          setState(() {
                                            _textSizes[index][i] = Size(
                                              _textSizes[index][i].width + details.delta.dx,
                                              _textSizes[index][i].height + details.delta.dy,
                                            );
                                          });
                                        },
                                        child: Icon(Icons.zoom_out_map, color: Colors.white, size: 20),
                                      ),
                                    ),
                                    // New Move Icon in Top Left Corner
                                    Positioned(
                                      top: -2,
                                      left: -2,
                                      child: Icon(Icons.drag_handle, color: Colors.white, size: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                Positioned(
                  left: 2,
                  top: MediaQuery.of(context).size.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
                      onPressed: _previousPage,
                    ),
                  ),
                ),
                Positioned(
                  right: 2,
                  top: MediaQuery.of(context).size.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward, color: Colors.black, size: 30),
                      onPressed: _nextPage,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: GestureDetector(
                      onTap: _addTextArea,
                      child: Text("Add Text"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
