import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_example/controller.dart';

class SecondPage extends StatelessWidget {
   SecondPage({super.key});
Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Obx(() =>  Text("${controller.sayac}"),),
            ElevatedButton(onPressed: () {
              controller.sayacazalt();
            }, child: Text("Azalt")),
            ElevatedButton(onPressed: () {
              Get.back();
            }, child: Text("Geri Dön"))
          ],
        ),
      ),
    );
  }
}