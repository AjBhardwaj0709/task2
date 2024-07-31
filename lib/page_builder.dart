import 'package:flutter/material.dart';

class PageBuilder extends StatefulWidget {
  final List<String> tasveer;
  const PageBuilder({super.key, required this.tasveer});

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  String _textOnImage =
      ""; // This should be updated with the text from the editor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
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
                        height: 400,
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
            itemCount: widget.tasveer.length,
          ),
        ],
      ),
    );
  }
}
