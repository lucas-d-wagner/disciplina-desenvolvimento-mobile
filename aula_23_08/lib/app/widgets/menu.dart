import 'package:aula_23_08/app/calculadora_file.dart';
import 'package:aula_23_08/app/formulario_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Text('MENU DE NAVEGAÇÂO'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Calculadora'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Calculadora()),
              );
            },
          ),
          ListTile(
            title: const Text('Formulário'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Formulario()),
              );
            },
          ),
        ],
      ),
    );
  }
}