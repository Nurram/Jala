import 'package:get/get.dart';
import 'package:jala/models/shrimp_disease_response.dart';

import '../network/remote_datasource.dart';

class ShrimpDiseasesRepository {
  final _remoteDataSource = Get.find<RemoteDataSource>();

  Future<ShrimpDiseaseResponse> getDShrimpDiseases({required int page}) async {
    final response = await _remoteDataSource.getWithToken(
        endpoint: '/diseases?per_page=15&page=$page');

    return ShrimpDiseaseResponse.fromJson(response.data);
  }
}
