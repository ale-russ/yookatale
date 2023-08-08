import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yookatale/features/common/widgets/base_widget.dart';

import 'features/common/notifiers/menu_notifier.dart';

import 'features/common/widgets/menu_slider.dart';
import 'features/home_page/widgets/home_page.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  final ScrollController scrollController = ScrollController();
  bool showFooter = false;
  Offset? tapPosition;
  bool keyboardIsVisible = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        showFooter = true;
      });
    } else {
      setState(() {
        showFooter = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var isVisible = ref.watch(visibilityProvider);

    return GestureDetector(
      onTap: () {},
      onTapDown: (details) {
        tapPosition = details.globalPosition;
        // Todo: Make the SliderMenu close when user tabs outside the slider
      },
      child: Scaffold(
        body: BaseWidget(
          child: HomePage(),
        ),
      ),
    );
  }
}
