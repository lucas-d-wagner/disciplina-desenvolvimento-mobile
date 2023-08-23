import 'package:aula_23_08/app/widgets/menu.dart';
import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora( {super.key} );

  @override
  State<Calculadora> createState() => _CalculadoraState();
}


class _CalculadoraState extends State<Calculadora> {

  final _number1 = TextEditingController();
  final _number2 = TextEditingController();
  String total = "0";

  void _somar() {
    double? value1 = double.tryParse(_number1.text) ?? 0.0;
    double? value2 = double.tryParse( _number2.text) ?? 0.0;
    setState(() {
      total =  (value1 + value2).toString();
    });
  }

  void _subtrair() {
    double? value1 = double.tryParse(_number1.text) ?? 0.0;
    double? value2 = double.tryParse( _number2.text) ?? 0.0;
    setState(() {
      total =  (value1 - value2).toString();
    });
  }

  void _multiplicar() {
    double? value1 = double.tryParse(_number1.text) ?? 0.0;
    double? value2 = double.tryParse( _number2.text) ?? 0.0;
    setState(() {
      total =  (value1 * value2).toString();
    });
  }

  void _dividir() {
    double? value1 = double.tryParse(_number1.text) ?? 0.0;
    double? value2 = double.tryParse( _number2.text) ?? 0.0;
    setState(() {
      total =  (value1 / value2).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuWidget(),
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _number1,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey),
                ),
                hintText: "Primeiro número",
              ),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _number2,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey),
                ),
                hintText: "Segundo número",
              ),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      _somar();
                    },
                    child: const Text(
                      'Somar',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0),
                    ),
                ),
                TextButton(
                    onPressed: () {
                      _subtrair();
                    },
                    child: const Text(
                      'Subtrair',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0),
                    ),
                ),
                TextButton(
                    onPressed: () {
                      _multiplicar();
                    },
                    child: const Text(
                      'Multiplicar',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0),
                    ),
                ),
                TextButton(
                    onPressed: () {
                      _dividir();
                    },
                    child: const Text(
                      'Dividir',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0),
                    ),
                ),
              ],
            ),
            Text(
                "O resultado é $total"
            ),
          ],
        ),
      ),
    );
  }

}
