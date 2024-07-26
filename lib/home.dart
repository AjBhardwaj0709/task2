// ignore_for_file: prefer_const_constructors

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
                    return Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 8),
                          ),
                          // padding: EdgeInsets.all(8.0),
                          child: Image.asset(
                            _images[index],
                            width: 300,
                            height: 500,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 2,
                  top: MediaQuery.of(context).size.height *0.3 ,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: IconButton(
                      icon:
                          Icon(Icons.arrow_back, color: Colors.black, size: 30),
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
                      icon: Icon(Icons.arrow_forward,
                          color: Colors.black, size: 30),
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
                  border: Border.all(color: Colors.black, width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: GestureDetector(
                      onTap: (){},
                      child: Text("Add Text"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
