import 'dart:convert';

List<MoviesModel> welcomeFromJson(String str) => List<MoviesModel>.from(json.decode(str).map((x) => MoviesModel.fromJson(x)));

String welcomeToJson(List<MoviesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoviesModel {
  double score;
  Show show;

  MoviesModel({
    required this.score,
    required this.show,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
    score: json["score"]?.toDouble(),
    show: Show.fromJson(json["show"]),
  );

  Map<String, dynamic> toJson() => {
    "score": score,
    "show": show.toJson(),
  };
}

class Show {
  int id;
  String url;
  String name;
  String type;
  Language language;
  List<String> genres;
  Status status;
  int? runtime;
  int? averageRuntime;
  DateTime? premiered;
  DateTime? ended;
  String? officialSite;
  Schedule schedule;
  Rating rating;
  int weight;
  Network? network;
  Network? webChannel;
  dynamic dvdCountry;
  Externals externals;
  Image? image;
  String summary;
  int updated;
  Links links;

  Show({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.premiered,
    required this.ended,
    required this.officialSite,
    required this.schedule,
    required this.rating,
    required this.weight,
    required this.network,
    required this.webChannel,
    required this.dvdCountry,
    required this.externals,
    required this.image,
    required this.summary,
    required this.updated,
    required this.links,
  });

  factory Show.fromJson(Map<String, dynamic> json) => Show(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    type: json["type"],
    language: languageValues.map[json["language"]]!,
    genres: List<String>.from(json["genres"].map((x) => x)),
    status: statusValues.map[json["status"]]!,
    runtime: json["runtime"],
    averageRuntime: json["averageRuntime"],
    premiered: json["premiered"] == null ? null : DateTime.parse(json["premiered"]),
    ended: json["ended"] == null ? null : DateTime.parse(json["ended"]),
    officialSite: json["officialSite"],
    schedule: Schedule.fromJson(json["schedule"]),
    rating: Rating.fromJson(json["rating"]),
    weight: json["weight"],
    network: json["network"] == null ? null : Network.fromJson(json["network"]),
    webChannel: json["webChannel"] == null ? null : Network.fromJson(json["webChannel"]),
    dvdCountry: json["dvdCountry"],
    externals: Externals.fromJson(json["externals"]),
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    summary: json["summary"],
    updated: json["updated"],
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "type": type,
    "language": languageValues.reverse[language],
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "status": statusValues.reverse[status],
    "runtime": runtime,
    "averageRuntime": averageRuntime,
    "premiered": "${premiered!.year.toString().padLeft(4, '0')}-${premiered!.month.toString().padLeft(2, '0')}-${premiered!.day.toString().padLeft(2, '0')}",
    "ended": "${ended!.year.toString().padLeft(4, '0')}-${ended!.month.toString().padLeft(2, '0')}-${ended!.day.toString().padLeft(2, '0')}",
    "officialSite": officialSite,
    "schedule": schedule.toJson(),
    "rating": rating.toJson(),
    "weight": weight,
    "network": network?.toJson(),
    "webChannel": webChannel?.toJson(),
    "dvdCountry": dvdCountry,
    "externals": externals.toJson(),
    "image": image?.toJson(),
    "summary": summary,
    "updated": updated,
    "_links": links.toJson(),
  };
}

class Externals {
  dynamic tvrage;
  int? thetvdb;
  String imdb;

  Externals({
    required this.tvrage,
    required this.thetvdb,
    required this.imdb,
  });

  factory Externals.fromJson(Map<String, dynamic> json) => Externals(
    tvrage: json["tvrage"],
    thetvdb: json["thetvdb"],
    imdb: json["imdb"],
  );

  Map<String, dynamic> toJson() => {
    "tvrage": tvrage,
    "thetvdb": thetvdb,
    "imdb": imdb,
  };
}

class Image {
  String medium;
  String original;

  Image({
    required this.medium,
    required this.original,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    medium: json["medium"],
    original: json["original"],
  );

  Map<String, dynamic> toJson() => {
    "medium": medium,
    "original": original,
  };
}

enum Language {
  ENGLISH,
  JAPANESE
}

final languageValues = EnumValues({
  "English": Language.ENGLISH,
  "Japanese": Language.JAPANESE
});

class Links {
  Self self;
  Previousepisode? previousepisode;

  Links({
    required this.self,
    this.previousepisode,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: Self.fromJson(json["self"]),
    previousepisode: json["previousepisode"] == null ? null : Previousepisode.fromJson(json["previousepisode"]),
  );

  Map<String, dynamic> toJson() => {
    "self": self.toJson(),
    "previousepisode": previousepisode?.toJson(),
  };
}

class Previousepisode {
  String href;
  String name;

  Previousepisode({
    required this.href,
    required this.name,
  });

  factory Previousepisode.fromJson(Map<String, dynamic> json) => Previousepisode(
    href: json["href"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "name": name,
  };
}

class Self {
  String href;

  Self({
    required this.href,
  });

  factory Self.fromJson(Map<String, dynamic> json) => Self(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class Network {
  int id;
  String name;
  Country? country;
  String? officialSite;

  Network({
    required this.id,
    required this.name,
    required this.country,
    required this.officialSite,
  });

  factory Network.fromJson(Map<String, dynamic> json) => Network(
    id: json["id"],
    name: json["name"],
    country: json["country"] == null ? null : Country.fromJson(json["country"]),
    officialSite: json["officialSite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country": country?.toJson(),
    "officialSite": officialSite,
  };
}

class Country {
  String name;
  String code;
  String timezone;

  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    name: json["name"],
    code: json["code"],
    timezone: json["timezone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "timezone": timezone,
  };
}

class Rating {
  double? average;

  Rating({
    required this.average,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    average: json["average"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "average": average,
  };
}

class Schedule {
  String time;
  List<String> days;

  Schedule({
    required this.time,
    required this.days,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    time: json["time"],
    days: List<String>.from(json["days"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "days": List<dynamic>.from(days.map((x) => x)),
  };
}

enum Status {
  ENDED,
  IN_DEVELOPMENT,
  RUNNING
}

final statusValues = EnumValues({
  "Ended": Status.ENDED,
  "In Development": Status.IN_DEVELOPMENT,
  "Running": Status.RUNNING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
