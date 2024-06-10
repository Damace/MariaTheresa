// To parse this JSON data, do
//
//     final fomu = fomuFromJson(jsonString);

import 'dart:convert';

List<Fomu>fomuFromJson(String str) =>
    List<Fomu>.from(json.decode(str).map((x) => Fomu.fromJson(x)));

String fomuToJson(List<Fomu> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fomu {
  int id;
  String filePath;
  String jina;

  Fomu({
    required this.id,
    required this.filePath,
    required this.jina,
  });

  factory Fomu.fromJson(Map<String, dynamic> json) => Fomu(
        id: json["id"],
        filePath: json["file_path"],
        jina: json["jina"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file_path": filePath,
        "jina": jina,
      };
}
