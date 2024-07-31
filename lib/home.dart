// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task/bottomBar.dart';
import 'package:task/bottomBarActive.dart';
import 'package:task/page_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> images = [
  "assets/flutterImage.jpg",
  "assets/flutterImage.jpg",
  "assets/flutterImage.jpg",
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), backgroundColor: Colors.orange),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: PageBuilder(tasveer: images),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(height: 80, width: 300, child: BottomBarinitial()),
          SizedBox(height: 80, width: 300, child: Bottombar()),
        ],
      ),
    );
  }
}
