import 'package:aula_23_08/app/widgets/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage( {super.key} );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuWidget(),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
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
            Image(image: AssetImage('assets/images/doge_image.png'))
          ],
        ),
      ),
    );
  }
}