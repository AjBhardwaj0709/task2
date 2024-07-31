// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  String? _selectedFontstyle = "Option1";
  List<String> fontStyle = ["Option1", "Option2", "Option3"];

  int? selectedFontSize = 12;
  List<int> fontSize = [12, 14, 16, 18, 20];

  String? selectedFontColor = "Black";
  List<String> fontColor = ["Black", "Blue", "red", "orange"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.all(
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
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
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
              icon: Icon(Icons.font_download),
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
              icon: Icon(Icons.numbers),
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
              icon: Icon(Icons.color_lens),
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
    );
  }
}
