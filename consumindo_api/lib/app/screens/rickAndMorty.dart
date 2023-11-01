import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../components/ImageHero.dart';
import '../components/Menu.dart';
import '../controllers/CharacterControllers.dart';
import 'details.dart';

class RickAndMortyPage extends StatefulWidget {
  const RickAndMortyPage({super.key, required this.title});

  final String title;

  @override
  State<RickAndMortyPage> createState() => _RickAndMortyPage();
}

class _RickAndMortyPage extends State<RickAndMortyPage> {

  var controller = CharacterController.characterSpotController;

  @override
  void initState() {
    super.initState();
    controller.listCharacter();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MenuWidget(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Container(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: controller.character.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(image: controller
                                    .character[index].image, name: controller
                                    .character[index].name,),)
                          );
                        },
                        leading:  ImageHero(controller
                            .character[index].image, 60.0)
                        ,
                        title: Text(controller
                            .character[index].name),
                        subtitle: Text(controller
                            .character[index].species),
                      ),

                    ],
                  ),
                );
              }),
        ))
    );
  }
}