// To parse this JSON data, do
//
//     final ratiba = ratibaFromJson(jsonString);

import 'dart:convert';

List<Ratiba> ratibaFromJson(String str) =>
    List<Ratiba>.from(json.decode(str).map((x) => Ratiba.fromJson(x)));

String ratibaToJson(List<Ratiba> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ratiba {
  int id;
  String ibada;
  String muda;

  Ratiba({
    required this.id,
    required this.ibada,
    required this.muda,
  });

  factory Ratiba.fromJson(Map<String, dynamic> json) => Ratiba(
        id: json["id"],
        ibada: json["ibada"],
        muda: json["muda"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ibada": ibada,
        "muda": muda,
      };
}
