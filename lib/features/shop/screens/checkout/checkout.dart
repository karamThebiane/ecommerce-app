

import 'package:bakaata/common/widgets/appbar/appbar.dart';
import 'package:bakaata/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:bakaata/common/widgets/products/cart/billing_amount_section.dart';
import 'package:bakaata/common/widgets/products/cart/coupon_code.dart';
import 'package:bakaata/features/shop/controllers/product/cart_controller.dart';
import 'package:bakaata/features/shop/controllers/product/order_controller.dart';
import 'package:bakaata/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:bakaata/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:bakaata/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:bakaata/utils/constants/colors.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:bakaata/utils/helpers/helper_functions.dart';
import 'package:bakaata/utils/helpers/pricing_calculator.dart';
import 'package:bakaata/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'US');
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: const TAppBar(title: Text('Order Review'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// -- Items in Cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon TextField
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(subTotal: subTotal),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Divider
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment Methods
                    const TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    /// Address
                    const TBillingAddressSection(),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => TLoaders.warningSnackBar(title: 'Empty Cart', message: 'Add items in the cart in order to proceed.'),
            child: Text('Checkout \$$totalAmount'),
          ),
        ),
      ),
    );
  }
}
