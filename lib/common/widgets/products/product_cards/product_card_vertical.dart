import 'package:bakaata/common/styles/shadows.dart';
import 'package:bakaata/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:bakaata/common/widgets/images/t_rounded_image.dart';
import 'package:bakaata/common/widgets/products/favourite_icon/favorite_icon.dart';
import 'package:bakaata/common/widgets/products/product_cards/widgets/add_to_cart_button.dart';
import 'package:bakaata/common/widgets/products/product_cards/widgets/product_cart_pricing_widget.dart';
import 'package:bakaata/common/widgets/products/product_cards/widgets/product_sale_tag.dart';
import 'package:bakaata/common/widgets/texts/t_brand_text_with_verified_icon.dart';
import 'package:bakaata/common/widgets/texts/t_product_title_text.dart';
import 'package:bakaata/features/shop/controllers/product/product_controller.dart';
import 'package:bakaata/features/shop/models/product_model.dart';
import 'package:bakaata/features/shop/screens/product_details/product_detail.dart';
import 'package:bakaata/utils/constants/colors.dart';
import 'package:bakaata/utils/constants/enums.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:bakaata/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product, this.isNetworkImage = true});

  final ProductModel product;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instance;
    final salePercentage = productController.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),

      /// Container with side paddings, color, edges, radius and shadow.
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            TRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  Center(child: TRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: isNetworkImage)),

                  /// -- Sale Tag
                  if (salePercentage != null) ProductSaleTagWidget(salePercentage: salePercentage),

                  /// -- Favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// -- Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(title: product.brand!.name, brandTextSize: TextSizes.small),
                ],
              ),
            ),

            /// Price & Add to cart button
            /// Use Spacer() to utilize all the space and set the price and cart button at the bottom.
            /// This usually happens when Product title is in single line or 2 lines (Max)
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Pricing
                PricingWidget(product: product),

                /// Add to cart
                ProductCardAddToCartButton(product: product),
              ],
            ),
          ],
        ),
      ),
    );
  }
}