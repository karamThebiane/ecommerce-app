import 'package:bakaata/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:bakaata/common/widgets/texts/section_heading.dart';
import 'package:bakaata/features/shop/controllers/checkout_controller.dart';
import 'package:bakaata/utils/constants/colors.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:bakaata/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return Column(
      children: [
        TSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: () {
            controller.selectPaymentMethod(context);
          },
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Obx(
              () => Row(
            children: [
              TRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: THelperFunction.isDarkMode(context) ? TColors.light : TColors.white,
                padding: const EdgeInsets.all(TSizes.sm),
                child: Image(image: AssetImage(controller.selectedPaymentMethod.value.image), fit: BoxFit.contain),
              ),
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              Text(controller.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }

}
