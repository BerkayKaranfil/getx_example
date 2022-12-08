import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_example/controller.dart';
import 'package:getx_example/second_page.dart';

void main() async{
  await GetStorage.init();    //-------------->>>>> Bunu yazman lazım yoksa tema değişimi yapamazsın. / Storageyi init ediyoruz bekliyoruz.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // -------------------------------------------- Başına get yazıyoruzki her sayfada context'imize ulaşmamızı sağlıyor.
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  /* RxInt counter = 0.obs; 

 RxBool deger = false.obs; 
 //obs, bir yapının değişebileceğini söylüyor. obs.counter'ı dinliyor. */

  Controller controller = Get.put(
      Controller()); //İlk tanımladığımız yer burası başka sayfada bu değere ulaşmak istersek Get.find kullanmamız gerekiyor.

  //Controller controller = Get.find();   bir kaç sayfa sonra ulaşmak istersek bunu kullanıyoruz.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                // "$counter",
                // '${(counter.value == 1 ? 2 : counter)}',
                "${controller.sayac}",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(),));
                  //  Get.to(SecondPage(), transition: Transition.leftToRightWithFade);
                  controller.sayfagec();
                },
                child: Text("Sayfa 2")),
            ElevatedButton(
                onPressed: () {
                  Get.snackbar("sayac", "das");
                },
                child: Text("Snackbar")),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: "Berkay",
                      content: Container(
                        child: Text("Karanfil"),
                      ));
                },
                child: Text("Dialog")),
                ElevatedButton(
                onPressed: () {
                  controller.temadegistir();
                },
                child: Text("Tema"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.sayacarttir();
          /* counter.value++;
          print(counter); */
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
