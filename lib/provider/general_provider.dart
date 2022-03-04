import 'package:flutter/material.dart';
import 'package:nutri_control/models/models.dart';

class GeneralProvider extends ChangeNotifier{

 List <Comidas> _almuerosList= [];
 List <Comidas> _desayunosList= [];
 List <Comidas> _cenasList= [];
 List <Comidas> _meriendasList= [];
 int _indexBottom = 0;

 //GETTER
 int get indexBottom => _indexBottom;
 List <Comidas> get cenasList=> _cenasList;
 List <Comidas> get almuerzosList=> _almuerosList;
 List <Comidas> get meriendasList=> _meriendasList;
 List <Comidas> get desayunosList=> _desayunosList;

 //SETTER
 set indexBottom(value) {
    _indexBottom = value;
    notifyListeners();
 }

 void addAlmuerzos (Comidas itemComida){
   _almuerosList.add(itemComida);
   notifyListeners();
 }

 void addCenas (Comidas itemComida){
   _cenasList.add(itemComida);
   notifyListeners();
 }
 void addMeriendas( Comidas value){
   _meriendasList.add(value);
   notifyListeners();
 }
 void addDessayunos (Comidas value){
   _desayunosList.add(value);
   notifyListeners();
 }

}