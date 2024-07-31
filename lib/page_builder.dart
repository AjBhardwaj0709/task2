import 'package:flutter/material.dart';
import 'page_builder_state.dart';

class PageBuilder extends StatefulWidget {
  final List<String> tasveer;
  const PageBuilder({Key? key, required this.tasveer}) : super(key: key);

  @override
  State<PageBuilder> createState() => PageBuilderState();
}