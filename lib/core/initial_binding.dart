import 'package:get/get.dart';
import 'package:jala/controllers/shrimp_diseases_controller.dart';
import 'package:jala/controllers/shrimp_news_controller.dart';
import 'package:jala/controllers/shrimp_price_controller.dart';
import 'package:jala/core/network/remote_datasource.dart';
import 'package:jala/core/repositories/shrimp_diseases_repository.dart';
import 'package:jala/core/repositories/shrimp_news_repository.dart';
import 'package:jala/core/repositories/shrimp_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RemoteDataSource());

    Get.lazyPut(() => ShrimpRepository());

    Get.lazyPut(() => ShrimpPriceController());

    Get.lazyPut(() => ShrimpNewsRepository());

    Get.lazyPut(() => ShrimpNewsController());
    
    Get.lazyPut(() => ShrimpDiseasesRepository());

    Get.lazyPut(() => ShrimpDiseasesController());
  }
}
