import 'package:bakaata/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:bakaata/features/personalization/controllers/address_controller.dart';
import 'package:bakaata/features/personalization/models/address_model.dart';
import 'package:bakaata/utils/constants/colors.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:bakaata/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = THelperFunction.isDarkMode(context);
    return Obx(
          () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final isAddressSelected = selectedAddressId == address.id;
        return GestureDetector(
          onTap: onTap,
          child: TRoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(TSizes.md),
            width: double.infinity,
            backgroundColor: isAddressSelected ? TColors.primary.withOpacity(0.5) : Colors.transparent,
            borderColor: isAddressSelected
                ? Colors.transparent
                : dark
                ? TColors.darkerGrey
                : TColors.grey,
            margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  top: 0,
                  child: Icon(
                    isAddressSelected ? Iconsax.tick_circle1 : Iconsax.tick_circle1,
                    color: isAddressSelected
                        ? TColors.primary
                        : dark
                        ? TColors.darkerGrey
                        : TColors.grey,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: TSizes.sm / 2),
                    Text(address.formattedPhoneNo, maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: TSizes.sm / 2),
                    Text(address.toString(), softWrap: true),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
