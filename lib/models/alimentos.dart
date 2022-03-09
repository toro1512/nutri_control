// To parse this JSON data, do
//
//     final alimentos = alimentosFromMap(jsonString);

import 'dart:convert';

class Alimentos {
    Alimentos({
        required this.id,
        required this.idGroup,
        required this.name,
        required this.kcal,
        required this.protein,
        required this.carbohydrate,
        required this.lipids,
    });

    int id;
    int idGroup;
    double protein;
    double carbohydrate;
    double lipids;
    String name;
    double kcal;
    
    factory Alimentos.fromJson(String str) => Alimentos.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Alimentos.fromMap(Map<String, dynamic> json) => Alimentos(
        id: json["ID"],
        idGroup: json["ID_GROUP"],
        name: json["NAME"],
        kcal: json["KCAL"].toDouble(),
        protein: json["PROTEIN"].toDouble(),
        carbohydrate: json["CARBOHYDRATE"].toDouble(),
        lipids: json["LIPIDS"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "ID": id,
        "ID_GROUP": idGroup,
        "NAME": name,
        "PROTEIN": protein,
        "KCAL": kcal,
        "CARBOHYDRATE": carbohydrate,
        "LIPIDS": lipids,
    };
}
