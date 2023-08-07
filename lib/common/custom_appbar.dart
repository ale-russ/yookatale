import 'dart:ui';

import 'package:flutter/material.dart';

PreferredSizeWidget? CustomAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, 70),
    child: AppBar(
      toolbarHeight: 70,
      backgroundColor: const Color.fromRGBO(0, 0, 0, 9),
      title: SearchBar(),
    ),
  );
}

class SearchBar extends StatelessWidget {
  SearchBar({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(
                  Icons.search_sharp,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    hintText: 'search product by name',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 121, 135, 143)),
                    fillColor: Colors.white,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
