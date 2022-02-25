// To parse this JSON data, do
//
//     final comidas = comidasFromMap(jsonString);

import 'dart:convert';

class Comidas {
    Comidas({
        required this.name,
        required this.imagen,
    });

    String name;
    String imagen;
    String? id;


    factory Comidas.fromJson(String str) => Comidas.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Comidas.fromMap(Map<String, dynamic> json) => Comidas(
        name: json["name"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "imagen": imagen,
    };
}
