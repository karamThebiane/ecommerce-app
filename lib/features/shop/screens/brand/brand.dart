
import 'package:bakaata/common/widgets/appbar/appbar.dart';
import 'package:bakaata/common/widgets/brands/brand_card.dart';
import 'package:bakaata/common/widgets/products/sortable/sortable_products.dart';
import 'package:bakaata/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:bakaata/common/widgets/texts/section_heading.dart';
import 'package:bakaata/features/shop/controllers/brand_controller.dart';
import 'package:bakaata/features/shop/models/brand_model.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:bakaata/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';



class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key, required this.brand});

  final BrandModel brand;

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
              /// Banner
              TBrandCard(brand: brand, showBorder: true),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sub Categories
              const TSectionHeading(title: 'Products', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              FutureBuilder(
                  future: controller.getBrandProducts(brand.id, -1),
                  builder: (context, snapshot) {
                    /// Handle Loader, No Record, OR Error Message
                    const loader = TVerticalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Record Found!
                    final brandProducts = snapshot.data!;
                    return TSortableProducts(products: brandProducts);
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
