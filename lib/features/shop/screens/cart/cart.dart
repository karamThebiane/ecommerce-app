

import 'package:bakaata/common/widgets/appbar/appbar.dart';
import 'package:bakaata/common/widgets/loaders/animation_loader.dart';
import 'package:bakaata/features/shop/controllers/product/cart_controller.dart';
import 'package:bakaata/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:bakaata/features/shop/screens/checkout/checkout.dart';
import 'package:bakaata/navigation_menu.dart';
import 'package:bakaata/utils/constants/image_strings.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final cartItems = controller.cartItems;
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(() {
        /// Nothing Found Widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! Cart is EMPTY.',
          animation: TImages.cartAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const HomeMenu()),
        );

        /// Cart Items
        return cartItems.isEmpty
            ? emptyWidget
            : const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),

            /// -- Items in Cart
            child: TCartItems(),
          ),
        );
      }),

      /// -- Checkout Button
      bottomNavigationBar: Obx(
            () {
          return cartItems.isNotEmpty
              ? Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(() => Text('Checkout ${controller.totalCartPrice.value}')),
              ),
            ),
          )
              : const SizedBox();
        },
      ),
    );
  }
}
