class Settings {
  String? locale;

  Settings({
    required this.locale,
  });

  factory Settings.fromJson(Map<String?, dynamic> json) => Settings(
        locale: json["locale"],
      );

  Map<String?, dynamic> toJson() => {
        "locale": locale,
      };
}
