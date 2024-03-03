import 'package:bakaata/common/styles/spacing_style.dart';
import 'package:bakaata/common/widgets/login_signup/form_divider.dart';
import 'package:bakaata/common/widgets/login_signup/social_buttons.dart';
import 'package:bakaata/features/authentication/screens/login/widgets/login_form.dart';
import 'package:bakaata/features/authentication/screens/login/widgets/login_header.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:bakaata/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///  Header
              const TLoginHeader(),

              /// Form
              const TLoginForm(),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
