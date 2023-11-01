
import 'package:consumindo_api/app/screens/rickAndMorty.dart';
import 'package:consumindo_api/app/screens/unidadesFederativas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:money2/money2.dart';

import '../components/Menu.dart';
import '../components/PaisCotacao.dart';
import '../controllers/ListCurrenciesController.dart';
import 'price_details_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


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
        title: const Text('Sobre'),
      ),
      drawer: const MenuWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Seja Bem-Vindo!',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            Text('Essa aplicação é sobre isso.'),
            Image(image: AssetImage('assets/images/doge_image.png'))
          ],
        ),
      ),
    );
  }
}