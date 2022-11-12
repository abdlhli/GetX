// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/demoController.dart';

class DemoPage extends StatelessWidget {
  final DemoController ctrl = Get.find();

  DemoPage({Key? key})
      : super(
            key:
                key); //Getting the cart controller, you can show amount or anything
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Get.arguments),
            ),
            SwitchListTile(
              value: ctrl.isDark,
              onChanged: ctrl.changeTheme,
            ),
            ElevatedButton(
                onPressed: () => Get.snackbar(
                    "Snackbar", "Hello this is the snackbar message",
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white,
                    backgroundColor: Colors.black87),
                child: const Text("Snack Bar")),
            ElevatedButton(
                onPressed: () => Get.defaultDialog(
                    title: "Dialogue",
                    content: const Text("Hey, From Dialogue")),
                child: const Text("Dialogue")),
            ElevatedButton(
                onPressed: () => Get.bottomSheet(Container(
                      height: 150,
                      color: Colors.white,
                      child: const Text(
                        'Hello From Bottom Sheet',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    )),
                child: const Text("Bottom Sheet")),
            ElevatedButton(
                //Off named because we want to remove the page stack
                onPressed: () =>
                    Get.offNamed('/'), //for app remove all stack use Get
                child: const Text('Back To Home')),
          ],
        ),
      ),
    );
  }
}
