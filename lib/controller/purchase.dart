// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import '../model/product.dart';

class Purchase extends GetxController {
  var products = <Product>[].obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));

    //Call From Server End
    var serverResponse = [
      Product(1, "Demo Product", "aby",
          "This is a product that we are going to show by GetX", 300.0),
      Product(1, "Demo Product", "aby",
          "This is a product that we are going to show by GetX", 300.0),
      Product(1, "Demo Product", "aby",
          "This is a product that we are going to show by GetX", 300.0),
      Product(1, "Demo Product", "aby",
          "This is a product that we are going to show by GetX", 300.0),
      Product(1, "Demo Product", "aby",
          "This is a product that we are going to show by GetX", 300.0),
      Product(1, "Demo Product", "aby",
          "This is a product that we are going to show by GetX", 300.0),
    ];

    products.value = serverResponse;
  }
}
