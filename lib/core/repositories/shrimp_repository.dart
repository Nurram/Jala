import 'package:get/get.dart';
import 'package:jala/models/regions_response.dart';
import 'package:jala/models/shrimp_price_response.dart';

import '../network/remote_datasource.dart';

class ShrimpRepository {
  final _remoteDataSource = Get.find<RemoteDataSource>();

  Future<ShrimpPriceResponse> getShrimpPrices({
    required int page,
    String regionId = '',
  }) async {
    final response = await _remoteDataSource.get(
        endpoint:
            '/shrimp_prices?per_page=15&page=$page&with=region,creator&region_id=$regionId');

    return ShrimpPriceResponse.fromJson(response.data);
  }

  Future<RegionsResponse> getRegions({
    required String region,
    required int page,
  }) async {
    final response = await _remoteDataSource.get(
        endpoint: '/regions?has=shrimp_prices&search=$region&page=$page');

    return RegionsResponse.fromJson(response.data);
  }
}
