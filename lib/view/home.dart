import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/demoController.dart';
import '../controller/purchase.dart';

class HomePage extends StatelessWidget {
  final purchase = Get.put(Purchase());
  DemoController cart = Get.find(); //Controller Cart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      bottomSheet: SafeArea(
        child: Card(
          elevation: 12.0,
          margin: EdgeInsets.zero,
          child: Container(
            decoration: const BoxDecoration(color: Colors.blue),
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    const Icon(Icons.shopping_cart_rounded,
                        size: 40, color: Colors.white),
                    Positioned(
                      right: 5,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Center(
                          child: GetX<DemoController>(builder: (controller) {
                            return Text(
                              '${controller.cartCount}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.0),
                            );
                          }),
                        ),
                      ),
                    )
                  ],
                ),
                GetX<DemoController>(builder: (controller) {
                  return Text(
                    'Total Amount - ${controller.cartCount}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0),
                  );
                }),
                IconButton(
                    onPressed: () => Get.toNamed('/cart',
                        arguments:
                            "Home Page To Demo Page -> Passing Arguments"),
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: GetX<Purchase>(builder: (controller) {
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: ((context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          'https://img.alicdn.com/tfs/TB1e.XyReL2gK0jSZFmXXc7iXXa-990-400.png',
                          fit: BoxFit.cover,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].productName,
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      controller
                                          .products[index].productDescription,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12.0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () =>
                                    cart.addToCart(controller.products[index]),
                                child: const Text(
                                  'Shop Now',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.0),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          );
        }),
      ),
    );
  }
}
