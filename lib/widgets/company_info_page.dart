import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yookatale/widgets/custom_button.dart';

class CompanyInfoPage extends ConsumerWidget {
  const CompanyInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // height: 500,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.95),
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.1),
          ),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const InfoSection(),
          const SizedBox(height: 40),
          const SocialSection(),
          const SizedBox(height: 50),
          const SubscribeSection(),
          const SizedBox(height: 50),
          InfoPages(),
          ProductsLinkPage(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.phoneFlip,
              color: Colors.white,
            ),
            SizedBox(width: 4),
            Text(
              '256754615840',
              style: TextStyle(color: Colors.white, fontFamily: 'Cabin'),
            )
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.envelope,
              color: Colors.white,
            ),
            SizedBox(width: 4),
            Text(
              'info@yookatale.com',
              style: TextStyle(
                color: Colors.white,
                // fontFamily: 'Cabin'
              ),
            )
          ],
        ),
      ],
    );
  }
}

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});
  final List<FaIcon> icons = const [
    FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
    FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
    FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
    FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
    FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
  ];

  void iconPressed({int? index}) {
    log('Index: $index');
    if (index == 0) {
      // navigate to linkedin profile
    } else if (index == 1) {
      // navigate to twitter profile
    } else if (index == 2) {
      // navigate to whatsapp profile
    } else if (index == 3) {
      // navigate to facebook profile
    } else {
      // navigate to instagram profile
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          icons.length,
          (index) => Transform.translate(
            offset: const Offset(-9, 0),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: icons[index],
              onPressed: () {
                iconPressed(index: index);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SubscribeSection extends StatelessWidget {
  const SubscribeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Subscribe for our newsletter',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(top: 16),
          height: 48,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.white),
          ),
          child: const TextField(
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: 'Enter your email',
              hintStyle: TextStyle(color: Color.fromARGB(255, 121, 135, 143)),
              fillColor: Colors.white,
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'By clicking "Subscribe" I agree to recive news, promotions, informations and offers from Yookatale',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomButton(
            onPressed: () {},
            title: 'Subscribe',
          ),
        )
      ],
    );
  }
}

class InfoPages extends StatelessWidget {
  InfoPages({super.key});

  final List<String> pages = ['Contacts', 'About', 'News Blog', 'Careers'];

  void pagesPressed({int? index}) {
    log('Index: $index');
    if (index == 0) {
      // navigate to  Contacts page
      log('Index: $index');
    } else if (index == 1) {
      // navigate to About Us page
      log('Index: $index');
    } else if (index == 2) {
      // navigate to News Blog page
      log('Index: $index');
    } else if (index == 3) {
      // navigate to Careers page
      log('Index: $index');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      child: Text(
                        pages[index],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      onPressed: () {
                        pagesPressed(index: index);
                      },
                    ),
                  );
                }),
          ),
          CustomButton(
            color: const Color.fromRGBO(37, 134, 66, 1),
            onPressed: () {},
            title: 'Quick Order',
            icon: const FaIcon(
              FontAwesomeIcons.whatsapp,
              color: Colors.white,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}

class ProductsLinkPage extends StatelessWidget {
  ProductsLinkPage({super.key});

  final List<String> pages = [
    'Roughages',
    'Fruits',
    'Root Tubers',
    'Vegetables',
    'Grain And Flour',
    'Meats',
    'Fats&Oils',
    'Herbs&Spices',
    'Juice&Meals'
  ];

  void linkPressed({int? index}) {
    log('Index: $index');
    if (index == 0) {
      // navigate to  Roughages page
      log('Index: $index');
    } else if (index == 1) {
      // navigate to Fruits page
      log('Index: $index');
    } else if (index == 2) {
      // navigate to Root Tubers page
      log('Index: $index');
    } else if (index == 3) {
      // navigate to Vegetables page
      log('Index: $index');
    } else if (index == 4) {
      // navigate to Grain And Flour page
      log('Index: $index');
    } else if (index == 5) {
      // navigate to Meats page
      log('Index: $index');
    } else if (index == 6) {
      // navigate to Fats&Oils page
      log('Index: $index');
    } else if (index == 7) {
      // navigate to Herbs&Spices page
      log('Index: $index');
    } else if (index == 8) {
      // navigate to Juice&Meals page
      log('Index: $index');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 50),
          height: 300,
          child: ListView.builder(
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      linkPressed(index: index);
                    },
                    child: Text(
                      pages[index],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
