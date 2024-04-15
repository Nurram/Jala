// To parse this JSON data, do
//
//     final shrimpNewsResponse = shrimpNewsResponseFromJson(jsonString);

import 'dart:convert';

import 'links.dart';
import 'meta.dart';

ShrimpNewsResponse shrimpNewsResponseFromJson(String str) =>
    ShrimpNewsResponse.fromJson(json.decode(str));

String shrimpNewsResponseToJson(ShrimpNewsResponse data) =>
    json.encode(data.toJson());

class ShrimpNewsResponse {
  List<NewsDatum>? data;
  Links? links;
  Meta? meta;

  ShrimpNewsResponse({
    this.data,
    this.links,
    this.meta,
  });

  factory ShrimpNewsResponse.fromJson(Map<String, dynamic> json) =>
      ShrimpNewsResponse(
        data: json["data"] == null
            ? []
            : List<NewsDatum>.from(
                json["data"]!.map((x) => NewsDatum.fromJson(x))),
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

class NewsDatum {
  int? id;
  int? authorId;
  int? categoryId;
  String? image;
  String? status;
  bool? featured;
  dynamic advertisement;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? seoTitle;
  String? excerpt;
  String? body;
  String? slug;
  String? metaDescription;
  String? metaKeywords;

  NewsDatum({
    this.id,
    this.authorId,
    this.categoryId,
    this.image,
    this.status,
    this.featured,
    this.advertisement,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.seoTitle,
    this.excerpt,
    this.body,
    this.slug,
    this.metaDescription,
    this.metaKeywords,
  });

  factory NewsDatum.fromJson(Map<String, dynamic> json) => NewsDatum(
        id: json["id"],
        authorId: json["author_id"],
        categoryId: json["category_id"],
        image: json["image"],
        status: json["status"],
        featured: json["featured"],
        advertisement: json["advertisement"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        title: json["title"],
        seoTitle: json["seo_title"],
        excerpt: json["excerpt"],
        body: json["body"],
        slug: json["slug"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author_id": authorId,
        "category_id": categoryId,
        "image": image,
        "status": status,
        "featured": featured,
        "advertisement": advertisement,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "title": title,
        "seo_title": seoTitle,
        "excerpt": excerpt,
        "body": body,
        "slug": slug,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
