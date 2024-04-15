// To parse this JSON data, do
//
//     final shrimpPriceResponse = shrimpPriceResponseFromJson(jsonString);

import 'dart:convert';

import 'creator.dart';
import 'links.dart';
import 'meta.dart';
import 'region.dart';

ShrimpPriceResponse shrimpPriceResponseFromJson(String str) =>
    ShrimpPriceResponse.fromJson(json.decode(str));

String? shrimpPriceResponseToJson(ShrimpPriceResponse data) =>
    json.encode(data.toJson());

class ShrimpPriceResponse {
  List<PriceDatum> data;
  Links links;
  Meta meta;

  ShrimpPriceResponse({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory ShrimpPriceResponse.fromJson(Map<String?, dynamic> json) =>
      ShrimpPriceResponse(
        data: List<PriceDatum>.from(
            json["data"].map((x) => PriceDatum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String?, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class PriceDatum {
  int? id;
  int? speciesId;
  DateTime date;
  int? size20;
  int? size30;
  int? size40;
  int? size50;
  int? size60;
  int? size70;
  int? size80;
  int? size90;
  int? size100;
  int? size110;
  int? size120;
  int? size130;
  int? size140;
  int? size150;
  int? size160;
  int? size170;
  int? size180;
  int? size190;
  int? size200;
  dynamic remark;
  int? createdBy;
  int? updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  String? regionId;
  String? contact;
  String? countryId;
  String? currencyId;
  int? private;
  int? week;
  String? dateRegionFullName;
  String? provinceId;
  String? regencyId;
  String? districtId;
  String? villageId;
  Region region;
  Creator creator;

  PriceDatum({
    required this.id,
    required this.speciesId,
    required this.date,
    required this.size20,
    required this.size30,
    required this.size40,
    required this.size50,
    required this.size60,
    required this.size70,
    required this.size80,
    required this.size90,
    required this.size100,
    required this.size110,
    required this.size120,
    required this.size130,
    required this.size140,
    required this.size150,
    required this.size160,
    required this.size170,
    required this.size180,
    required this.size190,
    required this.size200,
    required this.remark,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.regionId,
    required this.contact,
    required this.countryId,
    required this.currencyId,
    required this.private,
    required this.week,
    required this.dateRegionFullName,
    required this.provinceId,
    required this.regencyId,
    required this.districtId,
    required this.villageId,
    required this.region,
    required this.creator,
  });

  factory PriceDatum.fromJson(Map<String?, dynamic> json) => PriceDatum(
        id: json["id"],
        speciesId: json["species_id"],
        date: DateTime.parse(json["date"]),
        size20: json["size_20"],
        size30: json["size_30"],
        size40: json["size_40"],
        size50: json["size_50"],
        size60: json["size_60"],
        size70: json["size_70"],
        size80: json["size_80"],
        size90: json["size_90"],
        size100: json["size_100"],
        size110: json["size_110"],
        size120: json["size_120"],
        size130: json["size_130"],
        size140: json["size_140"],
        size150: json["size_150"],
        size160: json["size_160"],
        size170: json["size_170"],
        size180: json["size_180"],
        size190: json["size_190"],
        size200: json["size_200"],
        remark: json["remark"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        regionId: json["region_id"],
        contact: json["contact"],
        countryId: json["country_id"],
        currencyId: json["currency_id"],
        private: json["private"],
        week: json["week"],
        dateRegionFullName: json["date_region_full_name"],
        provinceId: json["province_id"],
        regencyId: json["regency_id"],
        districtId: json["district_id"],
        villageId: json["village_id"],
        region: Region.fromJson(json["region"]),
        creator: Creator.fromJson(json["creator"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "species_id": speciesId,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "size_20": size20,
        "size_30": size30,
        "size_40": size40,
        "size_50": size50,
        "size_60": size60,
        "size_70": size70,
        "size_80": size80,
        "size_90": size90,
        "size_100": size100,
        "size_110": size110,
        "size_120": size120,
        "size_130": size130,
        "size_140": size140,
        "size_150": size150,
        "size_160": size160,
        "size_170": size170,
        "size_180": size180,
        "size_190": size190,
        "size_200": size200,
        "remark": remark,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "region_id": regionId,
        "contact": contact,
        "country_id": countryId,
        "currency_id": currencyId,
        "private": private,
        "week": week,
        "date_region_full_name": dateRegionFullName,
        "province_id": provinceId,
        "regency_id": regencyId,
        "district_id": districtId,
        "village_id": villageId,
        "region": region.toJson(),
        "creator": creator.toJson(),
      };

  int? getPriceBySize({required int? size}) {
    final data = toJson();

    return data['size_$size'] ?? 0;
  }
}
