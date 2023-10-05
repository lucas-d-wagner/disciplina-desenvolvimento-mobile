class RegiaoModel {

  final int id;
  final String nome;
  final String sigla;



  RegiaoModel(this.id, this.nome, this.sigla );


  RegiaoModel.fromJson(Map<String, dynamic> json) :
        id= json['id'],
        nome= json['nome'],
        sigla= json['sigla'];

}