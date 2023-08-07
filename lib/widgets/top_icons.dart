import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yookatale/widgets/custom_button.dart';

import '../controller/menu_controller.dart';
import 'menu_slider.dart';

class TopIcons extends StatefulWidget {
  const TopIcons({super.key});

  @override
  State<TopIcons> createState() => _TopIconsState();
}

class _TopIconsState extends State<TopIcons> {
  final SliderMenuController sliderMenuController = SliderMenuController();
  final List<String> links = ['Contact', 'About', 'News Blog', 'Careers'];

  bool isSliderMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 130,
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.symmetric(vertical: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo1.webp', width: 80, height: 80),
                    const Text(
                      'Here for you',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isSliderMenuOpen = true;
                  });
                },
                child: const Icon(
                  Icons.menu_sharp,
                  size: 40,
                ),
              )
            ],
          ),
        ),
        if (isSliderMenuOpen)
          StickyContainer(
            stickyChildren: [],
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height,
                // isSliderMenuOpen ? MediaQuery.of(context).size.height : 60,
                // child: BackdropFilter(
                //   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isSliderMenuOpen = false;
                          });
                        },
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
                      margin: const EdgeInsets.only(left: 56),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: CustomButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.whatsapp,
                          size: 20,
                          color: Colors.white,
                        ),
                        title: 'Quick Order',
                      ),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      margin: const EdgeInsets.only(left: 56),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: CustomButton(
                        width: 130,
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.arrowRightToBracket,
                          size: 20,
                          color: Colors.white,
                        ),
                        title: 'Sign In',
                      ),
                    ),
                  ],
                ),
              ),
              // ),
            ),
          ),
      ],
    );
  }
}
