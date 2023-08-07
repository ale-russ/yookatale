import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common/custom_appbar.dart';
import 'notifiers/product_notifier.dart';
import 'widgets/company_info_page.dart';
import 'widgets/footer.dart';
import 'widgets/motto.dart';
import 'widgets/our_services.dart';
import 'widgets/products.dart';
import 'widgets/register_button.dart';
import 'widgets/top_icons.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  final ScrollController scrollController = ScrollController();
  bool showFooter = false;

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

  Widget build(BuildContext context) {
    var productProvider = ref.watch(productsProvider);
    var fruitProdcuts = ref.watch(fruiteProvider);

    return Scaffold(
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
                const TopIcons(),
                const Motto(),
                const OurServices(),
                ProductsPage(
                  productProvider: productProvider,
                  title: 'Popular Products',
                ),
                const RegisterWidget(),
                ProductsPage(
                  productProvider: fruitProdcuts,
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
        height: showFooter ? 90.0 : 0.0,
        child: const Footer(),
      ),
    );
  }
}
