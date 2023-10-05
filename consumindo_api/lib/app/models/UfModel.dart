import 'RegiaoModel.dart';

class UfModel {

  final int id;
  final String nome;
  final String sigla;


  UfModel(this.id, this.nome, this.sigla );


  UfModel.fromJson(Map<String, dynamic> json) :
        id= json['id'],
        nome= json['nome'],
        sigla= json['sigla'];

}