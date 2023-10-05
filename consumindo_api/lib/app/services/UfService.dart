import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';

import '../models/CharacterModel.dart';
import '../models/UfModel.dart';
class UfService{

  String urlGetList = "https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome";

  dynamic _response;

  Future<dynamic> fetchUfList() async {
    _response = await http.get(Uri.parse(urlGetList));
    if (_response.statusCode == 200) {

      var list = json.decode(_response.body);
      List<UfModel> listUfModel = [];
      for (var item in list) {
        listUfModel.add((UfModel.fromJson(item)));
      }
      return listUfModel;

    } else {
      throw Exception('Failed to load cote');
    }
  }

}