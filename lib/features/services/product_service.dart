import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import '/features/models/products_model.dart';

class ProductService {
  static Future<Products> fetchProducts({String? url}) async {
    final jsonString = await rootBundle.loadString(url!);
    // await rootBundle.loadString('assets/popular_products.json');
    final data = jsonDecode(jsonString);
    return Products.fromJson(data);
  }
}
