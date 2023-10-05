import 'package:get/get.dart';

import 'app/controllers/CharacterControllers.dart';
import 'app/controllers/UfControllers.dart';


class ControllerBinding implements Bindings  {
  @override
  void dependencies(){
    Get.lazyPut<CharacterController>(() => CharacterController());
    Get.lazyPut<UfController>(() => UfController());
  }

}