import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_example/second_page.dart';

class Controller extends GetxController {
  RxInt sayac = 0.obs;
  RxInt deger = 0.obs;
  RxBool isDark = false.obs;
  GetStorage getStorege = GetStorage();

  temakaydet(bool deger) {
    getStorege.write("isDark", deger);
  }

  temadegistir() {
    isDark.value = !isDark.value;
    //isDark.value = isDark == true ? true : false;
    isDark.value
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light());
    temakaydet(isDark.value);
  }

  arttir5(){
    deger.value = deger.toInt() + 5;
    Get.snackbar("sayac", deger.toString());
  }
  //Get.snackbar("sayac", deger.) // sayaç 5 5 artsın ve snacbarda yazsın.

  sayacarttir() {
    sayac.value = sayac.toInt() + 1;
    //sayac.value++;
  }

  sayacazalt() {
    sayac.value = sayac.toInt() - 1;
  }

  sayfagec() {
    Get.to(SecondPage(), transition: Transition.leftToRightWithFade);
  }

//oninit yazınca alttaki otomatik geliyor
//initstate'e denk geliyor
  @override
  void onInit() {
    print("ilk açiliş");
    bool deger = getStorege.read("isDark") ?? false; //?? nullsa demek
    deger ? Get.changeTheme(ThemeData.dark()) : Get.changeTheme(ThemeData.light());
    super.onInit();
  }

// onclose; animasyonları falan kapatmak için, (memory leak) -> kısıtlı ram'i gereksiz yere harcamamak için.
// dispose'a denk geliyor - aynısının getx'de kullanılan yöntemi.
  @override
  void onClose() {
    super.onClose();
  }



  // --------------------------------------- // Aşağıdaki kodların, bu proje ile alakası yok!.
  RxList dizi = [].obs;

  asd() {
    dizi.value.add({"name": "emre", "phone": "0538 332 23 32"});
    dizi[0].value();
  }

  RxList diziz = [
    {"name": "emre", "phone": "0538 332 23 32"},
    {"name": "emre", "phone": "0538 332 23 32"},
    {"name": "emre", "phone": "0538 332 23 32"}
  ].obs;

 // Rxn<Model>? ss;
}
