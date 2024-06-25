// *******************************************************************************************************************************
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

// ******************************************************************************************************************************
class Fomu {
  Fomu({
    required this.id,
    required this.jina,
    required this.preview,
  });

  final int? id;
  final String? jina;
  final String? preview;

  factory Fomu.fromJson(Map<String, dynamic> json) {
    return Fomu(
      id: json["id"],
      jina: json["jina"],
      preview: json["preview"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "jina": jina,
        "preview": preview,
      };
}
// ****************************************************************************************************************************

class Channel {
  final String id;
  final String title;
  final String profilePictureUrl;
  final String subscriberCount;
  final String videoCount;
  final String uploadPlaylistId;
  List<Video> videos;

  Channel({
    required this.id,
    required this.title,
    required this.profilePictureUrl,
    required this.subscriberCount,
    required this.videoCount,
    required this.uploadPlaylistId,
    required this.videos,
  });

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
      id: map['id'],
      title: map['snippet']['title'],
      profilePictureUrl: map['snippet']['thumbnails']['default']['url'],
      subscriberCount: map['statistics']['subscriberCount'],
      videoCount: map['statistics']['videoCount'],
      uploadPlaylistId: map['contentDetails']['relatedPlaylists']['uploads'],
      videos: [],
    );
  }
}

class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;

  Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.channelTitle,
  });

  factory Video.fromMap(Map<String, dynamic> snippet) {
    return Video(
      id: snippet['resourceId']['videoId'],
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
      channelTitle: snippet['channelTitle'],
    );
  }
}

// **************************************************************************************************************************************

class Matangazo {
  Matangazo({
    required this.id,
    required this.tarehe,
    required this.dominika,
    required this.category,
    required this.maelezo,
  });

  final int? id;
  final DateTime? tarehe;
  final String? dominika;
  final String? category;
  final String? maelezo;

  factory Matangazo.fromJson(Map<String, dynamic> json) {
    return Matangazo(
      id: json["id"],
      tarehe: DateTime.tryParse(json["tarehe"] ?? ""),
      dominika: json["dominika"],
      category: json["category"],
      maelezo: json["maelezo"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "tarehe":
            "${tarehe!.year.toString().padLeft(4)}-${tarehe!.month.toString().padLeft(2)}-${tarehe!.day.toString().padLeft(2)}",
        "dominika": dominika,
        "category": category,
        "maelezo": maelezo,
      };
}

// *****************************************************************************************************************************************

class MatangazoFile {
  MatangazoFile({
    required this.id,
    required this.tarehe,
    required this.dominika,
    required this.taarifaMuhimu,
    required this.file,
  });

  final int? id;
  final DateTime? tarehe;
  final String? dominika;
  final String? taarifaMuhimu;
  final String? file;

  factory MatangazoFile.fromJson(Map<String, dynamic> json) {
    return MatangazoFile(
      id: json["id"],
      tarehe: DateTime.tryParse(json["tarehe"] ?? ""),
      dominika: json["dominika"],
      taarifaMuhimu: json["taarifa_muhimu"],
      file: json["file"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "tarehe":
            "${tarehe!.year.toString().padLeft(4)}-${tarehe!.month.toString().padLeft(2)}-${tarehe!.day.toString().padLeft(2)}",
        "dominika": dominika,
        "taarifa_muhimu": taarifaMuhimu,
        "file": file,
      };
}

//************************************************************************************************************************************************** */

class ParokiaMatukio {
  ParokiaMatukio({
    required this.id,
    required this.tarehe,
    required this.title,
    required this.maelezo,
  });

  final int? id;
  final String? tarehe;
  final String? title;
  final String? maelezo;

  factory ParokiaMatukio.fromJson(Map<String, dynamic> json) {
    return ParokiaMatukio(
      id: json["id"],
      tarehe: json["tarehe"],
      title: json["title"],
      maelezo: json["maelezo"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "tarehe": tarehe,
        "title": title,
        "maelezo": maelezo,
      };
}

//********************************************************************************************** */

class Wanaparokia {
  Wanaparokia(
      {required this.id,
      required this.majinaKamili,
      required this.jumuiya,
      required this.isChecked});

  final int? id;
  final String? majinaKamili;
  final String? jumuiya;
  bool? isChecked;

  factory Wanaparokia.fromJson(Map<String, dynamic> json) {
    return Wanaparokia(
      id: json["id"],
      majinaKamili: json["majina_kamili"],
      jumuiya: json["jumuiya"],
      isChecked: json["isChecked"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "majina_kamili": majinaKamili,
        "jumuiya": jumuiya,
        "isChecked": isChecked,
      };
}

//******************************************************************************************************/

class Mapadri {
  Mapadri({
    required this.id,
    required this.majinaKamili,
    required this.cheo,
    required this.nambaYaSimu,
  });

  final int? id;
  final String? majinaKamili;
  final String? cheo;
  final String? nambaYaSimu;

  factory Mapadri.fromJson(Map<String, dynamic> json) {
    return Mapadri(
      id: json["id"],
      majinaKamili: json["majina_kamili"],
      cheo: json["cheo"],
      nambaYaSimu: json["namba_ya_simu"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "majina_kamili": majinaKamili,
        "cheo": cheo,
        "namba_ya_simu": nambaYaSimu,
      };
}
