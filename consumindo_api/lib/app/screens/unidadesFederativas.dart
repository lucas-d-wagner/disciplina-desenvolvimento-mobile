import 'package:consumindo_api/app/controllers/UfControllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../components/ImageHero.dart';
import '../components/Menu.dart';
import '../controllers/CharacterControllers.dart';
import 'details.dart';

class UnidadesFederativasPage extends StatefulWidget {
  const UnidadesFederativasPage({super.key});


  @override
  State<UnidadesFederativasPage> createState() => _UnidadesFederativasPageState();
}

class _UnidadesFederativasPageState extends State<UnidadesFederativasPage> {

  var controller = UfController.ufSpotController;

  @override
  void initState() {
    super.initState();
    controller.loadListUfs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MenuWidget(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Unidades Federativas'),
        ),
        body: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Container(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: controller.listUfs.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(controller
                            .listUfs[index].nome),
                        subtitle: Text(controller
                            .listUfs[index].sigla),
                      ),
                    ],
                  ),
                );
              }),
        ))
    );
  }

}