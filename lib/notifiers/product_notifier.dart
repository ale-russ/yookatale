import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/products_model.dart';
import '../services/product_service.dart';

final productsProvider = FutureProvider.autoDispose<Products>((ref) async {
  return await ProductService.fetchProducts(
      url: 'assets/popular_products.json');
});

final fruiteProvider = FutureProvider.autoDispose<Products>(
  (ref) async =>
      await ProductService.fetchProducts(url: 'assets/fruit_products.json'),
);
