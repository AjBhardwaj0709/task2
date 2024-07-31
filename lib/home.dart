import 'package:flutter/material.dart';
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
          Expanded(
            child: PageBuilder(tasveer: images),
          ),
        ],
      ),
    );
  }
}
