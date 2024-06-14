class Jumuiya {
  Jumuiya({
    required this.id,
    required this.jina,
  });

  final int? id;
  final String? jina;

  factory Jumuiya.fromJson(Map<String, dynamic> json) {
    return Jumuiya(
      id: json["id"],
      jina: json["jina"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "jina": jina,
      };
}
