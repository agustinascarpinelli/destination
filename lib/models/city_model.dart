// To parse this JSON data, do
//
//     final cityModel = cityModelFromMap(jsonString);

import 'dart:convert';

class CityModel {
    int? id;
    String? city;
    String? name;
    String? image;
    String? country;
    String? description;

    CityModel({
        this.id,
        this.city,
        this.name,
        this.image,
        this.country,
        this.description,
    });

    CityModel copyWith({
        int? id,
        String? city,
        String? name,
        String? image,
        String? country,
        String? description,
    }) => 
        CityModel(
            id: id ?? this.id,
            city: city ?? this.city,
            name: name ?? this.name,
            image: image ?? this.image,
            country: country ?? this.country,
            description: description ?? this.description,
        );

    factory CityModel.fromJson(String str) => CityModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CityModel.fromMap(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        city: json["city"],
        name: json["name"],
        image: json["image"],
        country: json["country"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "city": city,
        "name": name,
        "image": image,
        "country": country,
        "description": description,
    };
}
