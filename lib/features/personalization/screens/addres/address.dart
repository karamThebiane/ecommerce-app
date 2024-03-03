import 'package:bakaata/common/widgets/appbar/appbar.dart';
import 'package:bakaata/common/widgets/loaders/circular_loader.dart';
import 'package:bakaata/features/personalization/controllers/address_controller.dart';
import 'package:bakaata/features/personalization/screens/addres/add_new_address.dart';
import 'package:bakaata/features/personalization/screens/addres/widgets/single_address_widgets.dart';
import 'package:bakaata/utils/constants/colors.dart';
import 'package:bakaata/utils/constants/sizes.dart';
import 'package:bakaata/utils/helpers/cloud_helper_functions.dart';
import 'package:bakaata/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';



class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Obx(
              () => FutureBuilder(
            // Use key to trigger refresh
            key: Key(controller.refreshData.value.toString()),
            future: controller.allUserAddresses(),
            builder: (_, snapshot) {
              /// Helper Function: Handle Loader, No Record, OR ERROR Message
              final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
              if (response != null) return response;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => TSingleAddress(
                  address: snapshot.data![index],
                  onTap: () async {
                    Get.defaultDialog(
                      title: '',
                      onWillPop: () async {return false;},
                      barrierDismissible: false,
                      backgroundColor: Colors.transparent,
                      content: const TCircularLoader(),
                    );
                    await controller.selectAddress(snapshot.data![index]);
                    Get.back();
                  },
                ),
              );
            },
          ),
        ),
      ),

      /// Add new Address button
      floatingActionButton: FloatingActionButton(
        backgroundColor: THelperFunction.isDarkMode(context) ? TColors.secondary : TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: TColors.white),
      ),
    );
  }
}
