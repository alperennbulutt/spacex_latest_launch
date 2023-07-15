// To parse this JSON data, do
//
//     final spaceXModel = spaceXModelFromJson(jsonString);

import 'dart:convert';

SpaceXModel spaceXModelFromJson(String str) =>
    SpaceXModel.fromJson(json.decode(str));

String spaceXModelToJson(SpaceXModel data) => json.encode(data.toJson());

class SpaceXModel {
  dynamic fairings;
  Links? links;
  dynamic staticFireDateUtc;
  dynamic staticFireDateUnix;
  bool? net;
  dynamic window;
  String? rocket;
  bool? success;
  List<dynamic>? failures;
  dynamic details;
  List<String>? crew;
  List<dynamic>? ships;
  List<String>? capsules;
  List<String>? payloads;
  String? launchpad;
  int? flightNumber;
  String? name;
  DateTime? dateUtc;
  int? dateUnix;
  DateTime? dateLocal;
  String? datePrecision;
  bool? upcoming;
  List<Core>? cores;
  bool? autoUpdate;
  bool? tbd;
  String? launchLibraryId;
  String? id;

  SpaceXModel({
    this.fairings,
    this.links,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.net,
    this.window,
    this.rocket,
    this.success,
    this.failures,
    this.details,
    this.crew,
    this.ships,
    this.capsules,
    this.payloads,
    this.launchpad,
    this.flightNumber,
    this.name,
    this.dateUtc,
    this.dateUnix,
    this.dateLocal,
    this.datePrecision,
    this.upcoming,
    this.cores,
    this.autoUpdate,
    this.tbd,
    this.launchLibraryId,
    this.id,
  });

  factory SpaceXModel.fromJson(Map<String, dynamic> json) => SpaceXModel(
        fairings: json["fairings"],
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        staticFireDateUtc: json["static_fire_date_utc"],
        staticFireDateUnix: json["static_fire_date_unix"],
        net: json["net"],
        window: json["window"],
        rocket: json["rocket"],
        success: json["success"],
        failures: json["failures"] == null
            ? []
            : List<dynamic>.from(json["failures"]!.map((x) => x)),
        details: json["details"],
        crew: json["crew"] == null
            ? []
            : List<String>.from(json["crew"]!.map((x) => x)),
        ships: json["ships"] == null
            ? []
            : List<dynamic>.from(json["ships"]!.map((x) => x)),
        capsules: json["capsules"] == null
            ? []
            : List<String>.from(json["capsules"]!.map((x) => x)),
        payloads: json["payloads"] == null
            ? []
            : List<String>.from(json["payloads"]!.map((x) => x)),
        launchpad: json["launchpad"],
        flightNumber: json["flight_number"],
        name: json["name"],
        dateUtc:
            json["date_utc"] == null ? null : DateTime.parse(json["date_utc"]),
        dateUnix: json["date_unix"],
        dateLocal: json["date_local"] == null
            ? null
            : DateTime.parse(json["date_local"]),
        datePrecision: json["date_precision"],
        upcoming: json["upcoming"],
        cores: json["cores"] == null
            ? []
            : List<Core>.from(json["cores"]!.map((x) => Core.fromJson(x))),
        autoUpdate: json["auto_update"],
        tbd: json["tbd"],
        launchLibraryId: json["launch_library_id"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "fairings": fairings,
        "links": links?.toJson(),
        "static_fire_date_utc": staticFireDateUtc,
        "static_fire_date_unix": staticFireDateUnix,
        "net": net,
        "window": window,
        "rocket": rocket,
        "success": success,
        "failures":
            failures == null ? [] : List<dynamic>.from(failures!.map((x) => x)),
        "details": details,
        "crew": crew == null ? [] : List<dynamic>.from(crew!.map((x) => x)),
        "ships": ships == null ? [] : List<dynamic>.from(ships!.map((x) => x)),
        "capsules":
            capsules == null ? [] : List<dynamic>.from(capsules!.map((x) => x)),
        "payloads":
            payloads == null ? [] : List<dynamic>.from(payloads!.map((x) => x)),
        "launchpad": launchpad,
        "flight_number": flightNumber,
        "name": name,
        "date_utc": dateUtc?.toIso8601String(),
        "date_unix": dateUnix,
        "date_local": dateLocal?.toIso8601String(),
        "date_precision": datePrecision,
        "upcoming": upcoming,
        "cores": cores == null
            ? []
            : List<dynamic>.from(cores!.map((x) => x.toJson())),
        "auto_update": autoUpdate,
        "tbd": tbd,
        "launch_library_id": launchLibraryId,
        "id": id,
      };
}

class Core {
  String? core;
  int? flight;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landingAttempt;
  bool? landingSuccess;
  String? landingType;
  String? landpad;

  Core({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingAttempt,
    this.landingSuccess,
    this.landingType,
    this.landpad,
  });

  factory Core.fromJson(Map<String, dynamic> json) => Core(
        core: json["core"],
        flight: json["flight"],
        gridfins: json["gridfins"],
        legs: json["legs"],
        reused: json["reused"],
        landingAttempt: json["landing_attempt"],
        landingSuccess: json["landing_success"],
        landingType: json["landing_type"],
        landpad: json["landpad"],
      );

  Map<String, dynamic> toJson() => {
        "core": core,
        "flight": flight,
        "gridfins": gridfins,
        "legs": legs,
        "reused": reused,
        "landing_attempt": landingAttempt,
        "landing_success": landingSuccess,
        "landing_type": landingType,
        "landpad": landpad,
      };
}

class Links {
  Patch? patch;
  Reddit? reddit;
  Flickr? flickr;
  dynamic presskit;
  String? webcast;
  String? youtubeId;
  dynamic article;
  String? wikipedia;

  Links({
    this.patch,
    this.reddit,
    this.flickr,
    this.presskit,
    this.webcast,
    this.youtubeId,
    this.article,
    this.wikipedia,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        patch: json["patch"] == null ? null : Patch.fromJson(json["patch"]),
        reddit: json["reddit"] == null ? null : Reddit.fromJson(json["reddit"]),
        flickr: json["flickr"] == null ? null : Flickr.fromJson(json["flickr"]),
        presskit: json["presskit"],
        webcast: json["webcast"],
        youtubeId: json["youtube_id"],
        article: json["article"],
        wikipedia: json["wikipedia"],
      );

  Map<String, dynamic> toJson() => {
        "patch": patch?.toJson(),
        "reddit": reddit?.toJson(),
        "flickr": flickr?.toJson(),
        "presskit": presskit,
        "webcast": webcast,
        "youtube_id": youtubeId,
        "article": article,
        "wikipedia": wikipedia,
      };
}

class Flickr {
  List<dynamic>? small;
  List<dynamic>? original;

  Flickr({
    this.small,
    this.original,
  });

  factory Flickr.fromJson(Map<String, dynamic> json) => Flickr(
        small: json["small"] == null
            ? []
            : List<dynamic>.from(json["small"]!.map((x) => x)),
        original: json["original"] == null
            ? []
            : List<dynamic>.from(json["original"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "small": small == null ? [] : List<dynamic>.from(small!.map((x) => x)),
        "original":
            original == null ? [] : List<dynamic>.from(original!.map((x) => x)),
      };
}

class Patch {
  String? small;
  String? large;

  Patch({
    this.small,
    this.large,
  });

  factory Patch.fromJson(Map<String, dynamic> json) => Patch(
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
      };
}

class Reddit {
  dynamic campaign;
  String? launch;
  dynamic media;
  dynamic recovery;

  Reddit({
    this.campaign,
    this.launch,
    this.media,
    this.recovery,
  });

  factory Reddit.fromJson(Map<String, dynamic> json) => Reddit(
        campaign: json["campaign"],
        launch: json["launch"],
        media: json["media"],
        recovery: json["recovery"],
      );

  Map<String, dynamic> toJson() => {
        "campaign": campaign,
        "launch": launch,
        "media": media,
        "recovery": recovery,
      };
}
