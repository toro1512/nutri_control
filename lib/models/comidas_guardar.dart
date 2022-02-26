// To parse this JSON data, do
//
//     final comidas = comidasFromMap(jsonString);

import 'dart:convert';

class Comidas {
    Comidas({
        required this.name,
        required this.cantidad,
        
    });

    String name;
    int cantidad;
    String? id;
    String? imagen;


    factory Comidas.fromJson(String str) => Comidas.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Comidas.fromMap(Map<String, dynamic> json) => Comidas(
        name: json["name"],
        cantidad: json["cantidad"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "cantidad": cantidad,
    };
}
