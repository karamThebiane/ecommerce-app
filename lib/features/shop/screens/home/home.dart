

import 'package:bakaata/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:bakaata/common/widgets/layouts/grid_layout.dart';
import 'package:bakaata/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:bakaata/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:bakaata/common/widgets/texts/section_heading.dart';
import 'package:bakaata/data/repository/product/product_repository.dart';
import 'package:bakaata/features/shop/controllers/product/product_controller.dart';
import 'package:bakaata/features/shop/screens/all_products/all_products.dart';
import 'package:bakaata/features/shop/screens/home/widgets/header_categories.dart';
import 'package:bakaata/features/shop/screens/home/widgets/header_search_container.dart';
import 'package:bakaata/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:bakaata/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:bakaata/utils/constants/text_strings.dart';
import 'package:bakaata/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Searchbar
                  TSearchContainer(text: 'Search in Store', showBorder: false),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Categories
                  THeaderCategories(),
                  SizedBox(height: TSizes.spaceBtwSections * 2),
                ],
              ),
            ),

            /// -- Body
            Container(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Promo Slider 1
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Products Heading
                  TSectionHeading(
                    title: TTexts.popularProducts,
                    onPressed: () => Get.to(
                          () => AllProducts(
                        title: TTexts.popularProducts,
                        futureMethod: ProductRepository.instance.getAllFeaturedProducts(),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Products Section
                  Obx(
                        () {
                      // Display loader while products are loading
                      if (controller.isLoading.value) return const TVerticalProductShimmer();

                      // Check if no featured products are found
                      if (controller.featuredProducts.isEmpty) {
                        return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                      } else {
                        // Featured Products Found! 🎊
                        return TGridLayout(
                          itemCount: controller.featuredProducts.length,
                          itemBuilder: (_, index) =>
                              TProductCardVertical(product: controller.featuredProducts[index], isNetworkImage: true),
                        );
                      }
                    },
                  ),

                  SizedBox(height: TDeviceUtils.getBottomNavigationBarHeight() + TSizes.defaultSpace),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
