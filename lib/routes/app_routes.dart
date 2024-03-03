


import 'package:bakaata/features/authentication/screens/login/login.dart';
import 'package:bakaata/features/authentication/screens/onboarding/onboarding.dart';
import 'package:bakaata/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:bakaata/features/authentication/screens/signup/signup.dart';
import 'package:bakaata/features/authentication/screens/signup/verify_email.dart';
import 'package:bakaata/features/personalization/screens/addres/address.dart';
import 'package:bakaata/features/personalization/screens/profile/profile.dart';
import 'package:bakaata/features/personalization/screens/settings/settings.dart';
import 'package:bakaata/features/shop/screens/cart/cart.dart';
import 'package:bakaata/features/shop/screens/checkout/checkout.dart';
import 'package:bakaata/features/shop/screens/favourites/favourites.dart';
import 'package:bakaata/features/shop/screens/home/home.dart';
import 'package:bakaata/features/shop/screens/order/order.dart';
import 'package:bakaata/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:bakaata/features/shop/screens/store/store.dart';
import 'package:bakaata/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes{
  static final pages =[
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}