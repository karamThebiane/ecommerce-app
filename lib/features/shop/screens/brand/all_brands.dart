import 'package:bakaata/common/widgets/appbar/appbar.dart';
import 'package:bakaata/common/widgets/brands/brand_card.dart';
import 'package:bakaata/common/widgets/layouts/grid_layout.dart';
import 'package:bakaata/common/widgets/shimmers/brands_shimmer.dart';
import 'package:bakaata/common/widgets/texts/section_heading.dart';
import 'package:bakaata/features/shop/controllers/brand_controller.dart';
import 'package:bakaata/features/shop/screens/brand/brand.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Brand')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Sub Categories
              const TSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Brands
              Obx(
                    () {
                  // Check if categories are still loading
                  if (controller.isLoading.value) return const TBrandsShimmer();

                  // Check if there are no featured categories found
                  if (controller.allBrands.isEmpty) {
                    return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                  } else {
                    /// Data Found
                    return TGridLayout(
                      itemCount: controller.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brand = controller.allBrands[index];
                        return TBrandCard(
                          brand: brand,
                          showBorder: true,
                          onTap: () => Get.to(() => BrandScreen(brand: brand)),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
