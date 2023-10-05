import 'package:consumindo_api/app/screens/unidadesFederativas.dart';
import 'package:flutter/material.dart';


class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Text('MENU DE NAVEGAÇÂO'),
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
    );
  }
}