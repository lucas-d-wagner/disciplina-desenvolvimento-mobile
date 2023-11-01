import 'package:consumindo_api/app/screens/cotacao.dart';
import 'package:consumindo_api/app/screens/rickAndMorty.dart';
import 'package:consumindo_api/app/screens/unidadesFederativas.dart';
import 'package:flutter/material.dart';

import '../screens/post_model_screen.dart';


class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  ListView(
        children: [
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
          ListTile(
            title: const Text('Cotação'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CotacaoPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Post'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostModelScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}