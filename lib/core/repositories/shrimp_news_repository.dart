import 'package:get/get.dart';
import 'package:jala/models/shrimp_news_response.dart';

import '../network/remote_datasource.dart';

class ShrimpNewsRepository {
  final _remoteDataSource = Get.find<RemoteDataSource>();

  Future<ShrimpNewsResponse> getShrimpNews({required int page}) async {
    final response = await _remoteDataSource.get(
        endpoint: '/posts?per_page=15&page=$page&with=creator');

    return ShrimpNewsResponse.fromJson(response.data);
  }
}
