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

  //Get.snackbar("sayac", deger.)

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
}
