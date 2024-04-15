import 'package:get/get.dart';
import 'package:jala/core/repositories/shrimp_repository_detail.dart';
import 'package:jala/models/shrimp_price_detail_response.dart';
import 'package:jala/shared/utils.dart';

class ShrimpPriceDetailController extends GetxController {
  final isLoading = false.obs;

  final repository = Get.find<ShrimpPriceDetailRepository>();

  final id = 0.obs;
  final Rx<ShrimpPriceDetailResponse?> detail = Rx(null);

  fetchDetail() async {
    isLoading(true);

    try {
      final response = await repository.getShrimpPriceDetail(id: id.value);
      detail(response);

      isLoading(false);
    } catch (e) {
      showSnackbar(message: e.toString(), isSuccess: false);
    }
  }

  @override
  void onInit() {
    id(Get.arguments);
    fetchDetail();
    super.onInit();
  }
}
