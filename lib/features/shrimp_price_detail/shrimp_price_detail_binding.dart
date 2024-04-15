import 'package:get/get.dart';
import 'package:jala/controllers/shrimp_price_detail_controller.dart';
import 'package:jala/core/repositories/shrimp_repository_detail.dart';

class ShrimpPriceDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShrimpPriceDetailRepository());
    Get.lazyPut(() => ShrimpPriceDetailController());
  }
}
