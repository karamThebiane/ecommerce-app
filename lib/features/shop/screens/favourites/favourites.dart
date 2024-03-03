

import 'package:bakaata/common/widgets/appbar/appbar.dart';
import 'package:bakaata/common/widgets/icons/t_circular_icon.dart';
import 'package:bakaata/common/widgets/layouts/grid_layout.dart';
import 'package:bakaata/common/widgets/loaders/animation_loader.dart';
import 'package:bakaata/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:bakaata/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:bakaata/features/shop/controllers/product/favourites_controller.dart';
import 'package:bakaata/features/shop/screens/store/store.dart';
import 'package:bakaata/navigation_menu.dart';
import 'package:bakaata/utils/constants/image_strings.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:bakaata/utils/devices/device_utility.dart';
import 'package:bakaata/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // Intercept the back button press and redirect to Home Screen
      onPopInvoked: (value) async => Get.offAll(const HomeMenu()),
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
          actions: [TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(() => const StoreScreen()))],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [

                /// Products Grid
                Obx(() {
                  return FutureBuilder(
                    future: FavouritesController.instance.favoriteProducts(),
                    builder: (_, snapshot) {
                      /// Nothing Found Widget
                      final emptyWidget = TAnimationLoaderWidget(
                        text: 'Whoops! Wishlist is Empty...',
                        animation: TImages.pencilAnimation,
                        showAction: true,
                        actionText: 'Let\'s add some',
                        onActionPressed: () => Get.off(() => const HomeMenu()),
                      );
                      const loader = TVerticalProductShimmer(itemCount: 6);
                      final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                      if (widget != null) return widget;

                      final products = snapshot.data!;
                      return TGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => TProductCardVertical(product: products[index]),
                      );
                    },
                  );
                }),
                SizedBox(height: TDeviceUtils.getBottomNavigationBarHeight() + TSizes.defaultSpace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
