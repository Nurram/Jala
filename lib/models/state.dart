class State {
  String? knowJalaFrom;
  DateTime phoneVerificationExpiredAt;
  dynamic phoneVerificationOtpSent;
  dynamic homeTourComplete;
  dynamic consultationTourComplete;
  dynamic homeCoachmarkShown;
  dynamic cycleToDoShown;
  dynamic addFeedCoachmarkShown;
  dynamic addTreatmentCoachmarkShown;
  dynamic addFeedTrayCoachmarkShown;
  dynamic addSamplingCoachmarkShown;
  dynamic addStartCreateCycleCoachmarkShown;
  dynamic jalaEventShown;
  dynamic addFeedModalTourComplete;
  dynamic assetIntroductionComplete;
  dynamic feedTrayModalTourComplete;
  dynamic measurementModalTourComplete;
  dynamic addMeasurementCoachmarkShown;
  dynamic mailjetId;
  dynamic addHarvestCoachmarkShown;
  // bool? addDiseaseCoachmarkShown;
  dynamic phoneWaResetPasswordOtpSent;
  DateTime? phoneResetPasswordOtpLastRequest;
  // bool? homeNewFeatureCoachmarkShown;
  // bool? homeGraphCoachmarkShown;
  dynamic createCycleTourComplete;
  dynamic batchListTourComplete;
  dynamic addMortalityCoachmarkShown;
  // bool? homeNewFeatureCoachmark147Shown;
  String? harvestModalTourComplete;
  dynamic inputExcelTourComplete;
  dynamic shareCultivationTourComplete;
  dynamic financialReportTourComplete;
  dynamic exportImportTourComplete;
  dynamic treatmentModalTourComplete;
  dynamic costPerPondDetailTourComplete;
  dynamic farmListTourComplete;
  dynamic mortalityModalTourComplete;
  dynamic khowJalaFrom;
  String? samplingModalTourComplete;
  // String? addChemicalCoachmarkShown;
  dynamic subAccountCategorySettingTourComplete;
  dynamic subAccountTourComplete;
  String? addCreateFarmCoachmarkShown;
  String? addCreatePondCoachmarkShown;
  dynamic autoSyncStockTourComplete;
  String? diseaseModalTourComplete;
  // bool? addPlanktonCoachmarkShown;
  // bool? addMicrobioCoachmarkShown;
  int? phoneResetPasswordOtpSent;
  // bool? importFinanceTourComplete;
  // bool? importFinanceComplete;
  // bool? chemicalPredictionCoachmarkShown;
  String? consultationShown;
  String? addCreateCycleCoachmarkShown;
  String? addCloseCycleCoachmarkShown;
  // bool? partner;
  String? objectObject;
  dynamic oneSignalFarmId;

  State({
    this.knowJalaFrom,
    required this.phoneVerificationExpiredAt,
    this.phoneVerificationOtpSent,
    this.homeTourComplete,
    this.consultationTourComplete,
    required this.homeCoachmarkShown,
    this.cycleToDoShown,
    this.addFeedCoachmarkShown,
    this.addTreatmentCoachmarkShown,
    this.addFeedTrayCoachmarkShown,
    this.addSamplingCoachmarkShown,
    this.addStartCreateCycleCoachmarkShown,
    this.jalaEventShown,
    this.addFeedModalTourComplete,
    this.assetIntroductionComplete,
    this.feedTrayModalTourComplete,
    this.measurementModalTourComplete,
    this.addMeasurementCoachmarkShown,
    required this.mailjetId,
    this.addHarvestCoachmarkShown,
    // this.addDiseaseCoachmarkShown,
    this.phoneWaResetPasswordOtpSent,
    this.phoneResetPasswordOtpLastRequest,
    // this.homeNewFeatureCoachmarkShown,
    // this.homeGraphCoachmarkShown,
    this.createCycleTourComplete,
    this.batchListTourComplete,
    this.addMortalityCoachmarkShown,
    // this.homeNewFeatureCoachmark147Shown,
    this.harvestModalTourComplete,
    this.inputExcelTourComplete,
    this.shareCultivationTourComplete,
    this.financialReportTourComplete,
    this.exportImportTourComplete,
    this.treatmentModalTourComplete,
    this.costPerPondDetailTourComplete,
    this.farmListTourComplete,
    this.mortalityModalTourComplete,
    this.khowJalaFrom,
    this.samplingModalTourComplete,
    // this.addChemicalCoachmarkShown,
    this.subAccountCategorySettingTourComplete,
    this.subAccountTourComplete,
    this.addCreateFarmCoachmarkShown,
    this.addCreatePondCoachmarkShown,
    this.autoSyncStockTourComplete,
    this.diseaseModalTourComplete,
    // this.addPlanktonCoachmarkShown,
    // this.addMicrobioCoachmarkShown,
    this.phoneResetPasswordOtpSent,
    // this.importFinanceTourComplete,
    // this.importFinanceComplete,
    // this.chemicalPredictionCoachmarkShown,
    this.consultationShown,
    this.addCreateCycleCoachmarkShown,
    this.addCloseCycleCoachmarkShown,
    // this.partner,
    this.objectObject,
    this.oneSignalFarmId,
  });

  factory State.fromJson(Map<String?, dynamic> json) => State(
        knowJalaFrom: json["know_jala_from"],
        phoneVerificationExpiredAt:
            DateTime.parse(json["phone_verification_expired_at"]),
        phoneVerificationOtpSent: json["phone_verification_otp_sent"],
        homeTourComplete: json["home_tour_complete"],
        consultationTourComplete: json["consultation_tour_complete"],
        homeCoachmarkShown: json["home_coachmark_shown"],
        cycleToDoShown: json["cycle_to_do_shown"],
        addFeedCoachmarkShown: json["add_feed_coachmark_shown"],
        addTreatmentCoachmarkShown: json["add_treatment_coachmark_shown"],
        addFeedTrayCoachmarkShown: json["add_feed_tray_coachmark_shown"],
        addSamplingCoachmarkShown: json["add_sampling_coachmark_shown"],
        addStartCreateCycleCoachmarkShown:
            json["add_start_create_cycle_coachmark_shown"],
        jalaEventShown: json["jala-event_shown"],
        addFeedModalTourComplete: json["add_feed_modal_tour_complete"],
        assetIntroductionComplete: json["asset_introduction_complete"],
        feedTrayModalTourComplete: json["feed_tray_modal_tour_complete"],
        measurementModalTourComplete: json["measurement_modal_tour_complete"],
        addMeasurementCoachmarkShown: json["add_measurement_coachmark_shown"],
        mailjetId: json["mailjet_id"],
        addHarvestCoachmarkShown: json["add_harvest_coachmark_shown"],
        // addDiseaseCoachmarkShown: json["add_disease_coachmark_shown"],
        phoneWaResetPasswordOtpSent: json["phone_wa_reset_password_otp_sent"],
        phoneResetPasswordOtpLastRequest:
            json["phone_reset_password_otp_last_request"] == null
                ? null
                : DateTime.parse(json["phone_reset_password_otp_last_request"]),
        // homeNewFeatureCoachmarkShown: json["home_new_feature_coachmark_shown"],
        // homeGraphCoachmarkShown: json["home_graph_coachmark_shown"],
        createCycleTourComplete: json["create_cycle_tour_complete"],
        batchListTourComplete: json["batch_list_tour_complete"],
        addMortalityCoachmarkShown: json["add_mortality_coachmark_shown"],
        // homeNewFeatureCoachmark147Shown:
        //     json["home_new_feature_coachmark_1_4_7_shown"],
        harvestModalTourComplete: json["harvest_modal_tour_complete"],
        inputExcelTourComplete: json["input_excel_tour_complete"],
        shareCultivationTourComplete: json["share_cultivation_tour_complete"],
        financialReportTourComplete: json["financial_report_tour_complete"],
        exportImportTourComplete: json["export_import_tour_complete"],
        treatmentModalTourComplete: json["treatment_modal_tour_complete"],
        costPerPondDetailTourComplete:
            json["cost_per_pond_detail_tour_complete"],
        farmListTourComplete: json["farm_list_tour_complete"],
        mortalityModalTourComplete: json["mortality_modal_tour_complete"],
        khowJalaFrom: json["khow_jala_from"],
        samplingModalTourComplete: json["sampling_modal_tour_complete"],
        // addChemicalCoachmarkShown: json["add_chemical_coachmark_shown"],
        subAccountCategorySettingTourComplete:
            json["sub_account_category_setting_tour_complete"],
        subAccountTourComplete: json["sub_account_tour_complete"],
        addCreateFarmCoachmarkShown: json["add_create_farm_coachmark_shown"],
        addCreatePondCoachmarkShown: json["add_create_pond_coachmark_shown"],
        autoSyncStockTourComplete: json["auto_sync_stock_tour_complete"],
        diseaseModalTourComplete: json["disease_modal_tour_complete"],
        // addPlanktonCoachmarkShown: json["add_plankton_coachmark_shown"],
        // addMicrobioCoachmarkShown: json["add_microbio_coachmark_shown"],
        phoneResetPasswordOtpSent: json["phone_reset_password_otp_sent"],
        // importFinanceTourComplete: json["import_finance_tour_complete"],
        // importFinanceComplete: json["import_finance_complete"],
        // chemicalPredictionCoachmarkShown:
        //     json["chemical_prediction_coachmark_shown"],
        consultationShown: json["consultation_shown"],
        addCreateCycleCoachmarkShown: json["add_create_cycle_coachmark_shown"],
        addCloseCycleCoachmarkShown: json["add_close_cycle_coachmark_shown"],
        // partner: json["partner"],
        objectObject: json["[object Object"],
        oneSignalFarmId: json["one_signal_farm_id"],
      );

  Map<String?, dynamic> toJson() => {
        "know_jala_from": knowJalaFrom,
        "phone_verification_expired_at":
            phoneVerificationExpiredAt.toIso8601String(),
        "phone_verification_otp_sent": phoneVerificationOtpSent,
        "home_tour_complete": homeTourComplete,
        "consultation_tour_complete": consultationTourComplete,
        "home_coachmark_shown": homeCoachmarkShown,
        "cycle_to_do_shown": cycleToDoShown,
        "add_feed_coachmark_shown": addFeedCoachmarkShown,
        "add_treatment_coachmark_shown": addTreatmentCoachmarkShown,
        "add_feed_tray_coachmark_shown": addFeedTrayCoachmarkShown,
        "add_sampling_coachmark_shown": addSamplingCoachmarkShown,
        "add_start_create_cycle_coachmark_shown":
            addStartCreateCycleCoachmarkShown,
        "jala-event_shown": jalaEventShown,
        "add_feed_modal_tour_complete": addFeedModalTourComplete,
        "asset_introduction_complete": assetIntroductionComplete,
        "feed_tray_modal_tour_complete": feedTrayModalTourComplete,
        "measurement_modal_tour_complete": measurementModalTourComplete,
        "add_measurement_coachmark_shown": addMeasurementCoachmarkShown,
        "mailjet_id": mailjetId,
        "add_harvest_coachmark_shown": addHarvestCoachmarkShown,
        // "add_disease_coachmark_shown": addDiseaseCoachmarkShown,
        "phone_wa_reset_password_otp_sent": phoneWaResetPasswordOtpSent,
        "phone_reset_password_otp_last_request":
            phoneResetPasswordOtpLastRequest?.toIso8601String(),
        // "home_new_feature_coachmark_shown": homeNewFeatureCoachmarkShown,
        // "home_graph_coachmark_shown": homeGraphCoachmarkShown,
        "create_cycle_tour_complete": createCycleTourComplete,
        "batch_list_tour_complete": batchListTourComplete,
        "add_mortality_coachmark_shown": addMortalityCoachmarkShown,
        // "home_new_feature_coachmark_1_4_7_shown":
        //     homeNewFeatureCoachmark147Shown,
        "harvest_modal_tour_complete": harvestModalTourComplete,
        "input_excel_tour_complete": inputExcelTourComplete,
        "share_cultivation_tour_complete": shareCultivationTourComplete,
        "financial_report_tour_complete": financialReportTourComplete,
        "export_import_tour_complete": exportImportTourComplete,
        "treatment_modal_tour_complete": treatmentModalTourComplete,
        "cost_per_pond_detail_tour_complete": costPerPondDetailTourComplete,
        "farm_list_tour_complete": farmListTourComplete,
        "mortality_modal_tour_complete": mortalityModalTourComplete,
        "khow_jala_from": khowJalaFrom,
        "sampling_modal_tour_complete": samplingModalTourComplete,
        // "add_chemical_coachmark_shown": addChemicalCoachmarkShown,
        "sub_account_category_setting_tour_complete":
            subAccountCategorySettingTourComplete,
        "sub_account_tour_complete": subAccountTourComplete,
        "add_create_farm_coachmark_shown": addCreateFarmCoachmarkShown,
        "add_create_pond_coachmark_shown": addCreatePondCoachmarkShown,
        "auto_sync_stock_tour_complete": autoSyncStockTourComplete,
        "disease_modal_tour_complete": diseaseModalTourComplete,
        // "add_plankton_coachmark_shown": addPlanktonCoachmarkShown,
        // "add_microbio_coachmark_shown": addMicrobioCoachmarkShown,
        "phone_reset_password_otp_sent": phoneResetPasswordOtpSent,
        // "import_finance_tour_complete": importFinanceTourComplete,
        // "import_finance_complete": importFinanceComplete,
        // "chemical_prediction_coachmark_shown": chemicalPredictionCoachmarkShown,
        "consultation_shown": consultationShown,
        "add_create_cycle_coachmark_shown": addCreateCycleCoachmarkShown,
        "add_close_cycle_coachmark_shown": addCloseCycleCoachmarkShown,
        // "partner": partner,
        "[object Object": objectObject,
        "one_signal_farm_id": oneSignalFarmId,
      };
}
