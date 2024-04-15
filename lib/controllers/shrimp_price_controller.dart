import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala/core/repositories/shrimp_repository.dart';
import 'package:jala/shared/utils.dart';

import '../models/regions_response.dart';
import '../models/shrimp_price_response.dart';

class ShrimpPriceController extends GetxController {
  final repository = Get.find<ShrimpRepository>();

  final regionSearchCtr = TextEditingController();

  final isLoading = true.obs;
  final isPaginateLoading = false.obs;
  final isRegionLoading = true.obs;
  final isShowRegionClear = false.obs;

  final Rx<ShrimpPriceResponse?> shrimpPriceResponse = Rx(null);
  final shrimpPrices = <PriceDatum>[].obs;

  final Rx<RegionsResponse?> regionResponse = Rx(null);
  final regions = <RegionDatum>[].obs;

  final currentSize = 100.obs;
  final currentRegion = 'Indonesia'.obs;
  final currentRegionId = ''.obs;

  final pricePage = 1.obs;
  final regionPage = 1.obs;

  String getRegion() => currentRegion.value.split(', ').last;

  refreshDatas() async {
    isLoading(true);

    reset();
    await fetchPrices(isFilter: true);
    await fetchRegions(isFilter: true);

    isLoading(false);
  }

  fetchMorePrice() async {
    isPaginateLoading(true);

    await fetchPrices();

    isPaginateLoading(false);
  }

  fetchPrices({bool isFilter = false}) async {
    if (!isFilter && shrimpPriceResponse.value != null) {
      final meta = shrimpPriceResponse.value!.meta;

      if (meta.lastPage == null || pricePage.value > meta.lastPage!) {
        return;
      }
    }

    try {
      if (isFilter) pricePage(1);
      final response = await repository.getShrimpPrices(
        page: pricePage.value,
        regionId: currentRegionId.value,
      );

      pricePage(pricePage.value + 1);

      if (isFilter) {
        shrimpPrices(response.data);
      } else {
        shrimpPrices.addAll(response.data);
      }

      isLoading(false);
      // ignore: empty_catches
    } catch (e) {
      showSnackbar(message: e.toString(), isSuccess: false);
    }
  }

  fetchRegions({bool isFilter = false}) async {
    if (!isFilter && regionResponse.value != null) {
      final meta = regionResponse.value!.meta;

      if (regionPage.value > meta.lastPage) {
        return;
      }
    }

    isRegionLoading(true);
    if (isFilter) regionPage(1);

    try {
      String region = regionSearchCtr.text;

      final response = await repository.getRegions(
        region: region,
        page: regionPage.value,
      );

      regionResponse(response);

      final nextPage = response.meta.currentPage + 1;
      regionPage(nextPage);

      if (isFilter) {
        regions(response.data);
      } else {
        regions.addAll(response.data);
      }

      isRegionLoading(false);
    } catch (e) {
      isRegionLoading(false);
      showSnackbar(message: e.toString(), isSuccess: false);
    }
  }

  reset() {
    pricePage(1);
    regionPage(1);
  }

  @override
  void onInit() async {
    await fetchPrices();
    await fetchRegions();
    super.onInit();
  }
}
