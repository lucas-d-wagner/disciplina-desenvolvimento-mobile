import 'package:aula_23_08/app/widgets/menu.dart';
import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario( {super.key} );

  @override
  State<Formulario> createState() => _FormularioState();
}


class _FormularioState extends State<Formulario> {

  final _nome = TextEditingController();
  final _telefone = TextEditingController();

  var _formData = "";

  void _enviarFormulario() {
    String? value1 = _nome.text ?? "";
    String? value2 = _telefone.text ?? "";
    setState(() {
      _formData = 'Nome: $value1.\nTelefone: $value2';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuWidget(),
      appBar: AppBar(
        title: const Text('Formulário'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _nome,
              decoration: const InputDecoration(
                labelText: "Nome",
                hintText: "Insira seu nome",
              ),
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              controller: _telefone,
              decoration: const InputDecoration(
                labelText: "Telefone",
                hintText: "Insira seu telefone",
              ),
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
              onPressed: () {
                _enviarFormulario();
              },
              child: const Text('Enviar'),
            ),
            Text(
                "$_formData"
            ),
          ],
        ),
      ),
    );
  }

}