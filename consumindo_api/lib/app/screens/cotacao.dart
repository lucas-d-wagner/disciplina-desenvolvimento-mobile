
import 'package:consumindo_api/app/screens/rickAndMorty.dart';
import 'package:consumindo_api/app/screens/unidadesFederativas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:money2/money2.dart';

import '../components/PaisCotacao.dart';
import '../controllers/ListCurrenciesController.dart';
import 'price_details_screen.dart';

class CotacaoPage extends StatefulWidget {
  const CotacaoPage();

  @override
  State<CotacaoPage> createState() => _CotacaoPageState();
}

class _CotacaoPageState extends State<CotacaoPage> {

  var controller = ListCurrenciesController.listCurrencies;
  @override
  void initState() {
    super.initState();

    controller.listCurrecies();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Cotação compra BTC"),
          actions: [

          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 120.0,
                child: DrawerHeader(
                  child:
                  Text(''),
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0),
                ),
              ),
              ListTile(
                title: const Text('Atualizar'),
                leading: const Icon(Icons.refresh),
                onTap: () {
                  controller.listCurrecies();
                  Get.back();
                  // Get.to(()=>ListCurrencies());
                },
              ),

              ListTile(
                title: const Text('Rick And Morty'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RickAndMortyPage(title: 'Teste')),
                  );
                },
              ),
              ListTile(
                title: const Text('Unidades Federativas'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UnidadesFederativasPage()),
                  );
                },
              ),
            ],
          ),
        ),

        body:
        Obx(() =>
        controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            :
        Container(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: controller.listCurrenciesObs.length,
              itemBuilder: (BuildContext context, int index) {
                return
                  validCompnent(
                      controller.listCurrenciesObs[index].buy,controller.listCurrenciesObs[index].symbol) == false? SizedBox():
                  Card(
                    child: ListTile(
                      onTap: () {
                        Get.to(PriceDetails(cotacao:  controller.listCurrenciesObs[index]), fullscreenDialog: true);
                      },
                      leading:
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child:
                          PaisCotacao(image: 'assets/imagens-moedas/${controller.listCurrenciesObs[index].symbol}.png',width: 50.0,
                          )
                      ),
                      title:
                      Text(Money.fromNum(controller.listCurrenciesObs[index].buy,code:controller.listCurrenciesObs[index].symbol).toString()
                      ),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  );
              }),
        )
        )
    );
  }
  bool validCompnent(double value, String symbol){
    try {
      Text( Money.fromNum(value,code:symbol).toString());
      return true;
    } catch (error) {
      return false;
    }
  }
}