// To parse this JSON data, do
//
//     final mahudhurio = mahudhurioFromJson(jsonString);

import 'dart:convert';

List<Mahudhurio> mahudhurioFromJson(String str) =>
    List<Mahudhurio>.from(json.decode(str).map((x) => Mahudhurio.fromJson(x)));

String mahudhurioToJson(List<Mahudhurio> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mahudhurio {
  int id;
  String tarehe;
  String jumuiya;
  String mwanajumuiya;
  bool isChecked;

  Mahudhurio({
    required this.id,
    required this.tarehe,
    required this.jumuiya,
    required this.mwanajumuiya,
    required this.isChecked,
  });





  factory Mahudhurio.fromJson(Map<String, dynamic> json) => Mahudhurio(
        id: json["id"],
        tarehe: json["tarehe"],
        jumuiya: json["jumuiya"],
        mwanajumuiya: json["mwanajumuiya"],
        isChecked: json["isChecked"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tarehe": tarehe,
        "jumuiya": jumuiya,
        "mwanajumuiya": mwanajumuiya,
        "isChecked": isChecked,
      };
}
