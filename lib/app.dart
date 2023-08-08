import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/common/custom_appbar.dart';
import 'features/menu_notifier.dart';
import 'features/notifiers/product_notifier.dart';
import 'features/widgets/company_info_page.dart';
import 'features/widgets/footer.dart';
import 'features/widgets/menu_slider.dart';
import 'features/widgets/motto.dart';
import 'features/widgets/our_services.dart';
import 'features/widgets/products.dart';
import 'features/widgets/register_button.dart';
import 'features/widgets/top_icons.dart';

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
    var productProvider = ref.watch(productsProvider);
    var fruitProducts = ref.watch(fruitProvider);
    var isVisible = ref.watch(visibilityProvider);

    return GestureDetector(
      onTap: () {},
      onTapDown: (details) {
        tapPosition = details.globalPosition;
        // Todo: Make the SliderMenu close when user tabs outside the slider
      },
      child: Scaffold(
        body: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              appBar: CustomAppBar(context),
              body: NotificationListener(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification) {
                    setState(() {
                      showFooter = scrollController.position.pixels >=
                          scrollController.position.maxScrollExtent;
                    });
                  }
                  return showFooter;
                },
                child: SizedBox(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        TopIcons(),
                        const Motto(),
                        const OurServices(),
                        ProductsPage(
                          productProvider: productProvider,
                          title: 'Popular Products',
                        ),
                        const RegisterWidget(),
                        ProductsPage(
                          productProvider: fruitProducts,
                          title: 'Fruits Products',
                        ),
                        const CompanyInfoPage(),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: showFooter ? 120.0 : 0.0,
                child: const Footer(),
              ),
            ),
            if (isVisible) SliderMenu(),
          ],
        ),
      ),
    );
  }
}
