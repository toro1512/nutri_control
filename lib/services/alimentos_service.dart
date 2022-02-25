import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nutri_control/helpers/debouncer.dart';
import 'package:nutri_control/models/models.dart';
import 'package:http/http.dart' as http;

class AlimentosService extends ChangeNotifier {

  final String _baseUrl ='controlpeso-b1ef6-default-rtdb.firebaseio.com';
  final List<Comidas> comidas =[];
  final List<Alimentos> alimentos=[];
  bool isLoadingAli = true;
  bool isLoadingCom=true;
  final debouncer= Debouncer(
    duration: const Duration(milliseconds: 500),
    );
  final StreamController <List <Alimentos>> _suggestionStreamController= StreamController.broadcast();
  Stream<List<Alimentos>> get suggestionsStream => _suggestionStreamController.stream;
  
  
  AlimentosService(){

    loadListasComi();

  }
  
    Future loadListasComi () async {

    isLoadingCom=true;
    notifyListeners(); 

    final url= Uri.https(_baseUrl, 'comidas.json');
    final resp = await http.get(url);
    final Map <String, dynamic> tempMap = json.decode(resp.body);

    tempMap.forEach((key, value) {
      final tempValue= Comidas.fromMap(value);
      tempValue.id=key;
      comidas.add(tempValue);
    });
    isLoadingCom=false;
    notifyListeners();
  }
    Future < List<Alimentos>> searchAlimentos () async {
    
   
    final url= Uri.https(_baseUrl, 'productos.json');
    final resp = await http.get(url);
    final Map <String, dynamic> tempMap = json.decode(resp.body);
    
     alimentos.clear();
    tempMap.forEach((key, value) {
     
      final tempValue= Alimentos.fromMap(value);
      tempValue.id=key;
      alimentos.add(tempValue);
    });
    
      return alimentos; 
  }

  
  void getSuggestionByQuery(String query){

    debouncer.value ='';
    debouncer.onValue= (value) async {
      final result= await searchAlimentos();
      _suggestionStreamController.add(result);

    };
      final timer= Timer.periodic(const Duration(milliseconds: 300), (_) {
        debouncer.value=query;
       });
    
     Future.delayed(const Duration(milliseconds: 301)).then( (_) => timer.cancel());
  }


}