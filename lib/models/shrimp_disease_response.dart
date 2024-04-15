// To parse this JSON data, do
//
//     final shrimpDiseaseResponse = shrimpDiseaseResponseFromJson(jsonString);

import 'dart:convert';

import 'links.dart';
import 'meta.dart';

ShrimpDiseaseResponse shrimpDiseaseResponseFromJson(String str) =>
    ShrimpDiseaseResponse.fromJson(json.decode(str));

String shrimpDiseaseResponseToJson(ShrimpDiseaseResponse data) =>
    json.encode(data.toJson());

class ShrimpDiseaseResponse {
  List<ShrimpDiseaseDatum>? data;
  Links? links;
  Meta? meta;

  ShrimpDiseaseResponse({
    this.data,
    this.links,
    this.meta,
  });

  factory ShrimpDiseaseResponse.fromJson(Map<String, dynamic> json) =>
      ShrimpDiseaseResponse(
        data: json["data"] == null
            ? []
            : List<ShrimpDiseaseDatum>.from(json["data"]!.map((x) => ShrimpDiseaseDatum.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
      };
}

class ShrimpDiseaseDatum {
  int? id;
  String? fullName;
  String? shortName;
  String? image;
  String? slug;
  String? metaDescription;
  String? metaKeywords;
  String? status;
  String? indication;
  String? pathogen;
  String? effect;
  String? stabilityViability;
  String? handling;
  String? regulation;
  String? reference;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  ShrimpDiseaseDatum({
    this.id,
    this.fullName,
    this.shortName,
    this.image,
    this.slug,
    this.metaDescription,
    this.metaKeywords,
    this.status,
    this.indication,
    this.pathogen,
    this.effect,
    this.stabilityViability,
    this.handling,
    this.regulation,
    this.reference,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory ShrimpDiseaseDatum.fromJson(Map<String, dynamic> json) => ShrimpDiseaseDatum(
        id: json["id"],
        fullName: json["full_name"],
        shortName: json["short_name"],
        image: json["image"],
        slug: json["slug"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
        indication: json["indication"],
        pathogen: json["pathogen"],
        effect: json["effect"],
        stabilityViability: json["stability_viability"],
        handling: json["handling"],
        regulation: json["regulation"],
        reference: json["reference"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "short_name": shortName,
        "image": image,
        "slug": slug,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "indication": indication,
        "pathogen": pathogen,
        "effect": effect,
        "stability_viability": stabilityViability,
        "handling": handling,
        "regulation": regulation,
        "reference": reference,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
