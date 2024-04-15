import 'package:get/get.dart';

import '../../models/shrimp_price_detail_response.dart';
import '../network/remote_datasource.dart';

class ShrimpPriceDetailRepository {
  final _remoteDataSource = Get.find<RemoteDataSource>();

  Future<ShrimpPriceDetailResponse> getShrimpPriceDetail({
    int id = -1,
  }) async {
    final response = await _remoteDataSource.get(
        endpoint: '/shrimp_prices/$id?with=region,creator&region_id=');

    return ShrimpPriceDetailResponse.fromJson(response.data);
  }
}
