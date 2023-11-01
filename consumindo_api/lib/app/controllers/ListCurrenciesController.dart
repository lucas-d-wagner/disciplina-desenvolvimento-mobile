
import 'package:get/get.dart';

import '../models/CotacaoModel.dart';
import '../models/PostModel.dart';
import '../services/CotacaoService.dart';


class ListCurrenciesController extends GetxController {

  CotacaoService cotacaoService = CotacaoService();

  var isLoading = false.obs;

  var listCurrenciesObs = <Cotacao>[].obs;

  static ListCurrenciesController get listCurrencies => Get.find();

  Future<dynamic> listCurrecies()  async {
    isLoading.value = true;
    var list = await cotacaoService.fetchListCurrencies();
    listCurrenciesObs.value = list.listCurrencies;
    isLoading.value = false;
    update();
    return listCurrenciesObs;
  }


  Future<dynamic> post(PostModel objeto)  async {
    isLoading.value = true;
    var list = await cotacaoService.fetchPostModel(objeto);
    isLoading.value = false;
    update();
    return list;
  }


}
