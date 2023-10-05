
import 'package:get/get.dart';

import '../models/CharacterModel.dart';
import '../models/UfModel.dart';
import '../services/CharacterService.dart';
import '../services/UfService.dart';

class UfController extends GetxController {

  UfService ufService = UfService();
  var isLoading = false.obs;
  List<UfModel> listUfs = <UfModel>[].obs;

  static UfController get ufSpotController => Get.find();

  Future<dynamic> loadListUfs()  async {
    isLoading.value = true;
    var list = await ufService.fetchUfList();
    listUfs.addAll(list);
    isLoading.value = false;
    update();
    return listUfs;
  }

}