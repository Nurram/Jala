import 'package:get/get.dart';
import 'package:jala/core/repositories/shrimp_news_repository.dart';
import 'package:jala/models/shrimp_news_response.dart';

class ShrimpNewsController extends GetxController {
  final repository = Get.find<ShrimpNewsRepository>();

  final isLoading = false.obs;
  final isPaginateLoading = false.obs;
  bool isLastPage = false;

  final Rx<ShrimpNewsResponse?> newsResponse = Rx(null);
  final news = <NewsDatum>[].obs;

  final currentPage = 1.obs;
  final newsProgress = 0.obs;

  fetchNews({required bool isPaginated}) async {
    if (isLastPage) return;
    setLoading(isPaginated: isPaginated, isLoading: true);

    try {
      final response = await repository.getShrimpNews(page: currentPage.value);
      newsResponse(response);

      if (isPaginated) {
        news.addAll(response.data ?? []);
      } else {
        news(response.data);
      }

      currentPage(currentPage.value + 1);
      setLoading(isPaginated: isPaginated, isLoading: false);
    } catch (e) {
      setLoading(isPaginated: isPaginated, isLoading: false);
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
    fetchNews(isPaginated: false);
    super.onInit();
  }
}
