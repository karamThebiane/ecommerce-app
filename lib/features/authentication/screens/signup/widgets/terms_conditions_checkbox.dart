

import 'package:bakaata/features/authentication/controllers/signup_controller.dart';
import 'package:bakaata/utils/constants/colors.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:bakaata/utils/constants/text_strings.dart';
import 'package:bakaata/utils/devices/device_utility.dart';
import 'package:bakaata/utils/helpers/helper_functions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        /// CHECKBOX => Wrap in a Sized box to remove extra padding
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
                () => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = value!),
          ),
        ),
        const SizedBox(width: TSizes.md),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: TTexts.privacyPolicy,
                  recognizer: TapGestureRecognizer()..onTap = () => TDeviceUtils.launchWebsiteUrl('https://codingwitht.com/'),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: THelperFunction.isDarkMode(context) ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: THelperFunction.isDarkMode(context) ? TColors.white : TColors.primary,
                  ),
                ),
                TextSpan(text: ' ${TTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: TTexts.termsOfUse,
                  recognizer: TapGestureRecognizer()..onTap = () => TDeviceUtils.launchWebsiteUrl('https://codingwitht.com/'),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: THelperFunction.isDarkMode(context) ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: THelperFunction.isDarkMode(context) ? TColors.white : TColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class THelperFunctions {
}
