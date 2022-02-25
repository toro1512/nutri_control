// To parse this JSON data, do
//
//     final alimentos = alimentosFromMap(jsonString);

import 'dart:convert';

class Alimentos {
    Alimentos({
       required this.grasas,
       required this.kcalo,
       required this.name,
       required this.potasio,
       String? id
    });

    int grasas;
    int kcalo;
    String name;
    int potasio;
    String? id;

    factory Alimentos.fromJson(String str) => Alimentos.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Alimentos.fromMap(Map<String, dynamic> json) => Alimentos(
        grasas: json["grasas"],
        kcalo: json["kcalo"],
        name: json["name"],
        potasio: json["potasio"],
    );

    Map<String, dynamic> toMap() => {
        "grasas": grasas,
        "kcalo": kcalo,
        "name": name,
        "potasio": potasio,
    };
}
