import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controller/menu_controller.dart';

class SliderMenu extends StatelessWidget {
  SliderMenu({
    super.key,
  });

  final List<String> links = ['Contact', 'About', 'News Blog', 'Careers'];

  final SliderMenuController sliderMenuController = SliderMenuController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: sliderMenuController,
      builder: (context, isSliderMenuOpen, _) {
        log('ValueListenable: $isSliderMenuOpen');
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: isSliderMenuOpen ? MediaQuery.of(context).size.height : 60,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: IconButton(
                    onPressed: () =>
                        sliderMenuController.toggleSliderMenu(value: false),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  margin: const EdgeInsets.only(top: 32),
                  child: ListView.builder(
                    itemCount: links.length,
                    itemBuilder: (context, index) {
                      return MenuLinks(
                        label: links[index],
                      );
                    },
                  ),
                ),
                Container(
                    height: 50,
                    width: 150,
                    margin: const EdgeInsets.only(left: 56),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        side: BorderSide(),
                      ),
                      child: const Row(children: [
                        FaIcon(FontAwesomeIcons.whatsapp),
                        Text('Quick Order')
                      ]),
                      onPressed: () {},
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}

class MenuLinks extends StatelessWidget {
  const MenuLinks({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 56),
      height: 50,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
