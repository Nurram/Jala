import 'package:get/get.dart';
import 'package:jala/models/shrimp_disease_response.dart';
import 'package:jala/shared/utils.dart';

import '../core/repositories/shrimp_diseases_repository.dart';

class ShrimpDiseasesController extends GetxController {
  final repository = Get.find<ShrimpDiseasesRepository>();

  final isLoading = false.obs;
  final isPaginateLoading = false.obs;
  bool isLastPage = false;

  final Rx<ShrimpDiseaseResponse?> diseaseResponse = Rx(null);
  final disease = <ShrimpDiseaseDatum>[].obs;

  final currentPage = 1.obs;
  final diseaseProgress = 0.obs;

  fetchDiseases({required bool isPaginated}) async {
    if (isLastPage) return;
    setLoading(isPaginated: isPaginated, isLoading: true);

    try {
      final response =
          await repository.getDShrimpDiseases(page: currentPage.value);
      diseaseResponse(response);

      if (isPaginated) {
        disease.addAll(response.data ?? []);
      } else {
        disease(response.data);
      }

      currentPage(currentPage.value + 1);

      if (currentPage.value > diseaseResponse.value!.meta!.lastPage!) {
        isLastPage = true;
      }

      setLoading(isPaginated: isPaginated, isLoading: false);
    } catch (e) {
      showSnackbar(message: e.toString(), isSuccess: false);
    }
  }

  setLoading({required bool isPaginated, required bool isLoading}) {
    if (isPaginated) {
      isPaginateLoading(isLoading);
    } else {
      this.isLoading(isLoading);
    }
  }

  @override
  void onInit() {
    fetchDiseases(isPaginated: false);
    super.onInit();
  }
}
