import 'package:bakaata/common/widgets/appbar/appbar.dart';
import 'package:bakaata/common/widgets/texts/section_heading.dart';
import 'package:bakaata/features/personalization/controllers/upload_data_controller.dart';
import 'package:bakaata/utils/constants/colors.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:bakaata/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final  dark = THelperFunction.isDarkMode(context);
    final controller = Get.put(UploadDataController());

    return Scaffold(
      appBar: const TAppBar(title: Text('Upload Data'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Profile Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TSectionHeading(title: 'Main Record', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading:  Icon(Iconsax.category, size: 28, color:  dark ? TColors.secondary : TColors.primary),
                    title: Text('Upload Categories', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadCategories(),
                      icon: Icon(Iconsax.arrow_up_1, size: 28, color: dark ? TColors.secondary : TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: Icon(Iconsax.shop, size: 28, color:dark ? TColors.secondary : TColors.primary),
                    title: Text('Upload Brands', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadBrands(),
                      icon: Icon(Iconsax.arrow_up_1, size: 28, color: dark ? TColors.secondary : TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: Icon(Iconsax.shopping_cart, size: 28, color: dark ? TColors.secondary : TColors.primary),
                    title: Text('Upload Products', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadProducts(),
                      icon: Icon(Iconsax.arrow_up_1, size: 28, color: dark ? TColors.secondary : TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: Icon(Iconsax.image, size: 28, color: dark ? TColors.secondary : TColors.primary),
                    title: Text('Upload Banners', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadBanners(),
                      icon:Icon(Iconsax.arrow_up_1, size: 28, color: dark ? TColors.secondary : TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(title: 'Relationships', showActionButton: false),
                  const Text('Make sure you have already uploaded all the content above.'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: Icon(Iconsax.link, size: 28, color:dark ? TColors.secondary : TColors.primary),
                    title: Text('Upload Brands & Categories Relation Data', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadBrandCategory(),
                      icon: Icon(Iconsax.arrow_up_1, size: 28, color: dark ? TColors.secondary : TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: Icon(Iconsax.link, size: 28, color: dark ? TColors.secondary : TColors.primary),
                    title: Text('Upload Product Categories Relational Data', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadProductCategories(),
                      icon: Icon(Iconsax.arrow_up_1, size: 28, color: dark ? TColors.secondary : TColors.primary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
