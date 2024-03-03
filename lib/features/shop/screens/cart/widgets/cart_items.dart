import 'package:bakaata/common/widgets/products/cart/add_remove_cart_button.dart';
import 'package:bakaata/common/widgets/products/cart/cart_item.dart';
import 'package:bakaata/common/widgets/texts/t_product_price_text.dart';
import 'package:bakaata/features/shop/controllers/product/cart_controller.dart';
import 'package:bakaata/utils/constants/colors.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:bakaata/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final cartItems = cartController.cartItems;
    return Obx(
          () {
        return ListView.separated(
          shrinkWrap: true,
          itemCount: cartItems.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: TSizes.spaceBtwSections),
          itemBuilder: (context, index) {
            return Obx(
                  () {
                final item = cartItems[index];
                return Column(
                  children: [
                    /// -- Cart Items
                    TCartItem(item: item),
                    if (showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),

                    /// -- Add Remove Buttons and Price Total
                    if (showAddRemoveButtons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// -- Add Remove Buttons
                          Row(
                            children: [
                              // Use to add space to the left of Buttons as image space.
                              const SizedBox(width: 70),

                              /// Add Remove Buttons
                              TProductQuantityWithAddRemoveButton(
                                width: 32,
                                height: 32,
                                iconSize: TSizes.md,
                                addBackgroundColor: TColors.primary,
                                removeForegroundColor: THelperFunction.isDarkMode(context) ? TColors.white : TColors.black,
                                removeBackgroundColor: THelperFunction.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
                                quantity: item.quantity,
                                add: () => cartController.addOneToCart(item),
                                remove: () => cartController.removeOneFromCart(item),
                              ),
                            ],
                          ),

                          /// -- Product total price
                          TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                        ],
                      )
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
