// To parse this JSON data, do
//
//     final regionsResponse = regionsResponseFromJson(jsonString);

import 'dart:convert';

RegionsResponse regionsResponseFromJson(String str) =>
    RegionsResponse.fromJson(json.decode(str));

String regionsResponseToJson(RegionsResponse data) =>
    json.encode(data.toJson());

class RegionsResponse {
  List<RegionDatum> data;
  Links links;
  Meta meta;

  RegionsResponse({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory RegionsResponse.fromJson(Map<String, dynamic> json) =>
      RegionsResponse(
        data: List<RegionDatum>.from(
            json["data"].map((x) => RegionDatum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class RegionDatum {
  String id;
  String name;
  int? type;
  String latitude;
  String longitude;
  String countryId;
  String countryName;
  String countryNameUppercase;
  String provinceId;
  String provinceName;
  String? regencyId;
  String? regencyName;
  String? districtId;
  String? districtName;
  String? villageId;
  String? villageName;
  String fullName;
  String nameTranslated;
  String countryNameTranslated;
  String countryNameTranslatedUppercase;

  RegionDatum({
    required this.id,
    required this.name,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.countryId,
    required this.countryName,
    required this.countryNameUppercase,
    required this.provinceId,
    required this.provinceName,
    required this.regencyId,
    required this.regencyName,
    required this.districtId,
    required this.districtName,
    required this.villageId,
    required this.villageName,
    required this.fullName,
    required this.nameTranslated,
    required this.countryNameTranslated,
    required this.countryNameTranslatedUppercase,
  });

  String getFullAddress() {
    String name = provinceName;

    if (regencyName != null) {
      name = '$name, $regencyName';
    }

    if (districtName != null) {
      name = '$name, $districtName';
    }

    if (villageName != null) {
      name = '$name, $villageName';
    }

    return name;
  }

  factory RegionDatum.fromJson(Map<String, dynamic> json) => RegionDatum(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        countryId: json["country_id"],
        countryName: json["country_name"],
        countryNameUppercase: json["country_name_uppercase"],
        provinceId: json["province_id"],
        provinceName: json["province_name"],
        regencyId: json["regency_id"],
        regencyName: json["regency_name"],
        districtId: json["district_id"],
        districtName: json["district_name"],
        villageId: json["village_id"],
        villageName: json["village_name"],
        fullName: json["full_name"],
        nameTranslated: json["name_translated"],
        countryNameTranslated: json["country_name_translated"],
        countryNameTranslatedUppercase:
            json["country_name_translated_uppercase"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "latitude": latitude,
        "longitude": longitude,
        "country_id": countryId,
        "country_name": countryName,
        "country_name_uppercase": countryNameUppercase,
        "province_id": provinceId,
        "province_name": provinceName,
        "regency_id": regencyId,
        "regency_name": regencyName,
        "district_id": districtId,
        "district_name": districtName,
        "village_id": villageId,
        "village_name": villageName,
        "full_name": fullName,
        "name_translated": nameTranslated,
        "country_name_translated": countryNameTranslated,
        "country_name_translated_uppercase": countryNameTranslatedUppercase,
      };
}

class Links {
  String first;
  String last;
  dynamic prev;
  dynamic next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  int currentPage;
  int? from;
  int lastPage;
  String path;
  int perPage;
  int? to;
  int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}
