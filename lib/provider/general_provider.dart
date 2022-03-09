import 'package:flutter/material.dart';
import 'package:nutri_control/models/models.dart';

class GeneralProvider extends ChangeNotifier{

 List <Alimentos> almuerosLista= [];
 List <Alimentos> desayunosLista= [];
 List <Alimentos> cenasLista= [];
 List <Alimentos> meriendasLista= [];

 List <Alimentos> almuerosSuge= [
  Alimentos(id:3774,idGroup:6,name:"Cerdo lomo horneado sin sal",protein:35.1,carbohydrate:0,lipids:3.2,kcal:170),
  Alimentos(id:4714,idGroup:6,name:"Res lomo cocido sin sal ",protein:36.1,carbohydrate:0,lipids:7.9,kcal:218),
  Alimentos(id:94,idGroup:1,name:"Arroz blanco pulido cocido sin sal ",protein:2.3,carbohydrate:30.9,lipids:2.1,kcal:161),
  Alimentos(id:714,idGroup:1,name:"Pasta alimenticia, con huevo, sin enriquecer, coci",protein:4.5,carbohydrate:24.3,lipids:1,kcal:132),
  Alimentos(id:1954,idGroup:2,name:"Yuca blanca sin cáscara cocida sin sal ",protein:0.7,carbohydrate:33.9,lipids:0.2,kcal:157),
  Alimentos(id:1534,idGroup:2,name:"Papa variedad cerosa sabanera con cáscara cocida s",protein:2.3,carbohydrate:18.7,lipids:0.1,kcal:99),
 ];
 List <Alimentos> desayunosSuge= [
   Alimentos(name: "Huevo de gallina entero revuelto con sal",id:5424,idGroup: 9 , protein: 10.2, carbohydrate: 0,lipids: 11.4, kcal: 152 ),
   Alimentos(name: "Huevo de gallina entero frito sin sal",id:5414,idGroup: 9 , protein: 17.1, carbohydrate: 0,lipids: 14.6, kcal: 208 ),
   Alimentos(id:154,idGroup:1,name:"Cereal para el desayuno hojuelas de maíz sin azúca ",protein:8.1,carbohydrate:81.7,lipids:0.4,kcal:383),
   Alimentos(id:604,idGroup:1,name:"Pan blanco, regular, horneado",protein:8.9,carbohydrate:45.6,lipids:3.4,kcal:268),
   Alimentos(id:44,idGroup:1,name:"Arepa de maíz precocido con sal ",protein:3.3,carbohydrate:34.1,lipids:0.9,kcal:163),
   Alimentos(id:74,idGroup:1,name:"Arepa de maíz con queso asada",protein:4.8,carbohydrate:0,lipids:8.4,kcal:211),
   Alimentos(id:84,idGroup:1,name:"Arepa de maíz frita ",protein:3.4,carbohydrate:0,lipids:20.3,kcal:325)
 ];
 List <Alimentos> cenasSuge= [
  Alimentos(id:84,idGroup:1,name:"Arepa de maíz frita ",protein:3.4,carbohydrate:0,lipids:20.3,kcal:325),
  Alimentos(id:44,idGroup:1,name:"Arepa de maíz precocido con sal ",protein:3.3,carbohydrate:34.1,lipids:0.9,kcal:163),
  Alimentos(id:5044,idGroup:8,name:"Queso fresco blando magro tipo suero costeño",protein:11,carbohydrate:0,lipids:1.5,kcal:83),
  Alimentos(id:5074,idGroup:8,name:"Queso fresco semiduro semigraso tipo costeño",protein:17.5,carbohydrate:0,lipids:25.5,kcal:303),
  Alimentos(id:6064,idGroup:14,name:"Yogurt bebible descremado sin azucar",protein:3.7,carbohydrate:7.9,lipids:0.3,kcal:49),
  Alimentos(id:4084,idGroup:6,name:"Jamon de cerdo y res tipo sanduche precocido",protein:11.4,carbohydrate:0,lipids:15.5,kcal:215),
 ];
 List <Alimentos> meriendasSuge= [
  Alimentos(id:164, idGroup:1, name:"croissant de queso horneado", protein:9.2, carbohydrate:46.3, lipids:23, kcal:445),
  Alimentos(id:654,idGroup:1,name:"Pan de queso, horneado",protein:10.4,carbohydrate:31.4,lipids:20.8,kcal:367),
  Alimentos(id:5874,idGroup:11,name:"Café soluble descafeinado en polvo",protein:11.6,carbohydrate:80.7,lipids:0.2,kcal:371),
  Alimentos(id:204,idGroup:1,name:"Galletas dulces con relleno",protein:3.8,carbohydrate:68.6,lipids:24.1,kcal:516),
  Alimentos(id:224,idGroup:1,name:"Galletas dulces de avena con uvas pasas",protein:6.5,carbohydrate:66.1,lipids:16.2,kcal:451),
  Alimentos(id:6074,idGroup:14,name:"Yogurt bebible semidescremado con azucar",protein:4,carbohydrate:17.8,lipids:1.1,kcal:99),
 ];
 List<Tipo> tipoSolido=[
   Tipo(name: "gr", vInicial: 100, vConversion: 1),
   Tipo(name: "onzas", vInicial: 1, vConversion: 3.5274),
   Tipo(name: "porciones", vInicial: 1, vConversion: 3.5274),
 ];
 List<Tipo> tipoLiquido=[
   Tipo(name: "ml", vInicial: 100, vConversion: 1),
   Tipo(name: "onzas", vInicial: 1, vConversion: 3.3814),
    Tipo(name: "tazas", vInicial: 1, vConversion: 3.5274),
 ];
 int _indexBottom = 0;
 String _tituloG="";

 //GETTER
 String get tituloG => _tituloG;
 int get indexBottom => _indexBottom;
 List <Alimentos> get cenasList=> cenasLista;
 List <Alimentos> get almuerzosList=> almuerosLista;
 List <Alimentos> get meriendasList=> meriendasLista;
 List <Alimentos> get desayunosList=> desayunosLista;

 //SETTER
 set indexBottom(value) {
    _indexBottom = value;
    notifyListeners();
 }
 set tituloG(value) {
    _tituloG= value;
 }

 void addAlmuerzos (Alimentos itemComida){
   almuerosLista.add(itemComida);
   notifyListeners();
 }

 void addCenas (Alimentos itemComida){
   cenasLista.add(itemComida);
   notifyListeners();
 }
 void addMeriendas( Alimentos value){
   meriendasLista.add(value);
   notifyListeners();
 }
 void notiCambios(){
  notifyListeners();
 }

}