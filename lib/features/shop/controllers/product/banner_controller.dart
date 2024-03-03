import 'package:bakaata/data/repository/banners/banner_repository.dart';
import 'package:bakaata/features/shop/models/banner_model.dart';
import 'package:bakaata/utils/popups/loaders.dart';
import 'package:get/get.dart';


class BannerController extends GetxController {
  final bannersLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  /// Fetch banners from Firestore and update the 'banners' list
  Future<void> fetchBanners() async {
    try {
      // Start Loading
      bannersLoading.value = true;

      // Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign banners
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      bannersLoading.value = false;
    }
  }
}
