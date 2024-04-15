import 'settings.dart';
import 'state.dart';

class Creator {
  int? id;
  int? roleId;
  String? name;
  String? email;
  String? avatar;
  // bool? emailVerified;
  int? subscriptionTypeId;
  Settings settings;
  DateTime createdAt;
  DateTime updatedAt;
  String? regionId;
  String? address;
  // bool? deactivated;
  DateTime? expiredAt;
  String? phone;
  // bool? phoneVerified;
  int? gender;
  String? occupation;
  dynamic idNumber;
  dynamic idScan;
  dynamic tinNumber;
  dynamic tinScan;
  dynamic company;
  dynamic companyAddress;
  dynamic position;
  dynamic monthlyIncome;
  dynamic incomeSource;
  bool? buyer;
  String? phoneCountry;
  String? country;
  String? interest;
  dynamic unsubscribeEmailAt;
  dynamic freshchatRestoreId;
  // bool? allowCreateClient;
  // bool? allowCreateToken;
  List<String?>? interests;
  State state;
  dynamic familyCardNumber;
  dynamic familyCardScan;
  dynamic telegramId;
  String? genderName;
  String? expiredTime;

  Creator({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.avatar,
    // required this.emailVerified,
    required this.subscriptionTypeId,
    required this.settings,
    required this.createdAt,
    required this.updatedAt,
    required this.regionId,
    required this.address,
    // required this.deactivated,
    required this.expiredAt,
    required this.phone,
    // required this.phoneVerified,
    required this.gender,
    required this.occupation,
    required this.idNumber,
    required this.idScan,
    required this.tinNumber,
    required this.tinScan,
    required this.company,
    required this.companyAddress,
    required this.position,
    required this.monthlyIncome,
    required this.incomeSource,
    this.buyer = false,
    required this.phoneCountry,
    required this.country,
    required this.interest,
    required this.unsubscribeEmailAt,
    required this.freshchatRestoreId,
    // required this.allowCreateClient,
    // required this.allowCreateToken,
    required this.interests,
    required this.state,
    required this.familyCardNumber,
    required this.familyCardScan,
    required this.telegramId,
    required this.genderName,
    required this.expiredTime,
  });

  factory Creator.fromJson(Map<String?, dynamic> json) => Creator(
        id: json["id"],
        roleId: json["role_id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        // emailVerified: json["email_verified"],
        subscriptionTypeId: json["subscription_type_id"],
        settings: Settings.fromJson(json["settings"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        regionId: json["region_id"],
        address: json["address"],
        // deactivated: json["deactivated"],
        expiredAt: json["expired_at"] == null
            ? null
            : DateTime.parse(json["expired_at"]),
        phone: json["phone"],
        // phoneVerified: json["phone_verified"],
        gender: json["gender"],
        occupation: json["occupation"],
        idNumber: json["id_number"],
        idScan: json["id_scan"],
        tinNumber: json["tin_number"],
        tinScan: json["tin_scan"],
        company: json["company"],
        companyAddress: json["company_address"],
        position: json["position"],
        monthlyIncome: json["monthly_income"],
        incomeSource: json["income_source"],
        buyer: json["buyer"],
        phoneCountry: json["phone_country"],
        country: json["country"],
        interest: json["interest"],
        unsubscribeEmailAt: json["unsubscribe_email_at"],
        freshchatRestoreId: json["freshchat_restore_id"],
        // allowCreateClient: json["allow_create_client"],
        // allowCreateToken: json["allow_create_token"],
        interests: json["interests"] == null
            ? []
            : List<String?>.from(json["interests"]!.map((x) => x)),
        state: State.fromJson(json["state"]),
        familyCardNumber: json["family_card_number"],
        familyCardScan: json["family_card_scan"],
        telegramId: json["telegram_id"],
        genderName: json["gender_name"],
        expiredTime: json["expired_time"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "name": name,
        "email": email,
        "avatar": avatar,
        // "email_verified": emailVerified,
        "subscription_type_id": subscriptionTypeId,
        "settings": settings.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "region_id": regionId,
        "address": address,
        // "deactivated": deactivated,
        "expired_at": expiredAt?.toIso8601String(),
        "phone": phone,
        // "phone_verified": phoneVerified,
        "gender": gender,
        "occupation": occupation,
        "id_number": idNumber,
        "id_scan": idScan,
        "tin_number": tinNumber,
        "tin_scan": tinScan,
        "company": company,
        "company_address": companyAddress,
        "position": position,
        "monthly_income": monthlyIncome,
        "income_source": incomeSource,
        "buyer": buyer,
        "phone_country": phoneCountry,
        "country": country,
        "interest": interest,
        "unsubscribe_email_at": unsubscribeEmailAt,
        "freshchat_restore_id": freshchatRestoreId,
        // "allow_create_client": allowCreateClient,
        // "allow_create_token": allowCreateToken,
        // "interests": interests == null
        //     ? []
        //     : List<dynamic>.from(interests!.map((x) => x)),
        "state": state.toJson(),
        "family_card_number": familyCardNumber,
        "family_card_scan": familyCardScan,
        "telegram_id": telegramId,
        "gender_name": genderName,
        "expired_time": expiredTime,
      };
}
