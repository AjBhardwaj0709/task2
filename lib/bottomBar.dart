// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class BottomBarinitial extends StatefulWidget {
  const BottomBarinitial({super.key});

  @override
  State<BottomBarinitial> createState() => _BottomBarinitialState();
}

class _BottomBarinitialState extends State<BottomBarinitial> {
  String _textToShow = ""; // This can be used to display text on the image



  @override
  Widget build(BuildContext context) {
    return Container(
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
              onTap: (){},
              child: Column(
                children: [
                  Icon(Icons.text_fields),
                  Text("Add text"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
