import 'package:bakaata/features/authentication/controllers/onboarding_controller.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:bakaata/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';




class TOnBoardingSkipButton extends StatelessWidget {
  const TOnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(onPressed: controller.skipPage, child: const Text('Skip')),
    );
  }
}
