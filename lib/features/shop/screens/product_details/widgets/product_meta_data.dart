
import 'package:bakaata/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:bakaata/common/widgets/images/t_circular_image.dart';
import 'package:bakaata/common/widgets/texts/t_brand_text_with_verified_icon.dart';
import 'package:bakaata/common/widgets/texts/t_product_price_text.dart';
import 'package:bakaata/common/widgets/texts/t_product_title_text.dart';
import 'package:bakaata/features/shop/controllers/product/product_controller.dart';
import 'package:bakaata/features/shop/models/product_model.dart';
import 'package:bakaata/utils/constants/colors.dart';
import 'package:bakaata/utils/constants/enums.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:bakaata/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = ProductController.instance.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// -- Sale Tag
            if (salePercentage != null)
              Row(
                children: [
                  TRoundedContainer(
                    backgroundColor: TColors.secondary,
                    radius: TSizes.sm,
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text('$salePercentage%',
                        style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems)
                ],
              ),


            // Actual Price if sale price not null.
            if ((product.productVariations == null || product.productVariations!.isEmpty) && product.salePrice> 0.0)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.price.toString(), style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                  const SizedBox(width: TSizes.spaceBtwItems)
                ],
              ),

            // Price, Show sale price as main price if sale exist.
            TProductPriceText(price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        TProductTitleText(title: product.title),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const TProductTitleText(title: 'Stock : ', smallSize: true),
            Text(controller.getProductStockStatus(product), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Brand
        Row(
          children: [
            TCircularImage(
              image: product.brand!.image,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(title: product.brand!.name, brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
