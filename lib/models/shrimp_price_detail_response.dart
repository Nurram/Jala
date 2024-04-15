// To parse this JSON data, do
//
//     final shrimpPriceDetailResponse = shrimpPriceDetailResponseFromJson(jsonString);

import 'dart:convert';

import 'creator.dart';
import 'region.dart';

ShrimpPriceDetailResponse shrimpPriceDetailResponseFromJson(String str) =>
    ShrimpPriceDetailResponse.fromJson(json.decode(str));

String shrimpPriceDetailResponseToJson(ShrimpPriceDetailResponse data) =>
    json.encode(data.toJson());

class ShrimpPriceDetailResponse {
  PriceDetailData? data;

  ShrimpPriceDetailResponse({
    this.data,
  });

  factory ShrimpPriceDetailResponse.fromJson(Map<String, dynamic> json) =>
      ShrimpPriceDetailResponse(
        data: json["data"] == null ? null : PriceDetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class PriceDetailData {
  int? id;
  int? speciesId;
  DateTime? date;
  dynamic size20;
  dynamic size30;
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
  String? remark;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? regionId;
  dynamic contact;
  String? countryId;
  String? currencyId;
  dynamic private;
  int? week;
  String? dateRegionFullName;
  String? provinceId;
  dynamic regencyId;
  dynamic districtId;
  dynamic villageId;
  Region? region;
  Creator? creator;

  PriceDetailData({
    this.id,
    this.speciesId,
    this.date,
    this.size20,
    this.size30,
    this.size40,
    this.size50,
    this.size60,
    this.size70,
    this.size80,
    this.size90,
    this.size100,
    this.size110,
    this.size120,
    this.size130,
    this.size140,
    this.size150,
    this.size160,
    this.size170,
    this.size180,
    this.size190,
    this.size200,
    this.remark,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.regionId,
    this.contact,
    this.countryId,
    this.currencyId,
    this.private,
    this.week,
    this.dateRegionFullName,
    this.provinceId,
    this.regencyId,
    this.districtId,
    this.villageId,
    this.region,
    this.creator,
  });

  factory PriceDetailData.fromJson(Map<String, dynamic> json) => PriceDetailData(
        id: json["id"],
        speciesId: json["species_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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
        region: json["region"] == null ? null : Region.fromJson(json["region"]),
        creator:
            json["creator"] == null ? null : Creator.fromJson(json["creator"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "species_id": speciesId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
        "region": region?.toJson(),
        "creator": creator?.toJson(),
      };
}