// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/model/product.dart';

class DemoController extends GetxController {
  var cartItems = <Product>[].obs;
  int get cartCount => cartItems.length;

  //Total fold is a dart facility
  double get totalAmount =>
      cartItems.fold(0.0, (sum, element) => sum + element.price);

  //add the product
  addToCart(Product product) {
    cartItems.add(product);
  }

  final storage = GetStorage();

  bool get isDark => storage.read('darkmode') ?? false;
  ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();
  void changeTheme(bool val) => storage.write('darkmode', val);
}
