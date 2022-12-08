import 'package:get/get.dart';

class Controller extends GetxController{


//oninit yazınca alttaki otomatik geliyor
  @override
  void onInit() {
    
    super.onInit();
  }

// onclose; animasyonları falan kapatmak için, (memory leak) -> kısıtlı ram'i gereksiz yere harcamamak için.
  @override
  void onClose() {
    
    super.onClose();
  }
}