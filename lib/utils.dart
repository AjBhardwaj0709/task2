import 'package:flutter/material.dart';

Widget buildNavigationButtons(BuildContext context, int currentPage, int totalPages, PageController pageController) {
  return Stack(
    children: [
      Positioned(
        left: 10,
        top: MediaQuery.of(context).size.height / 2 - 25,
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (currentPage > 0) {
              pageController.previousPage(
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
            if (currentPage < totalPages - 1) {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
      ),
    ],
  );
}