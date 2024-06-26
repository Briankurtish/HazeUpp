import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hazeupp/common/widgets/appbar/appbar.dart';
import 'package:hazeupp/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:hazeupp/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:hazeupp/common/widgets/list_tiles/t_user_profile.dart';
import 'package:hazeupp/common/widgets/texts/section_heading.dart';
import 'package:hazeupp/data/repositories/authentication/authentication_repository.dart';
import 'package:hazeupp/features/personalization/screens/address/address.dart';
import 'package:hazeupp/features/personalization/screens/profile/profile.dart';
import 'package:hazeupp/features/shop/screens/cart/cart.dart';
import 'package:hazeupp/features/shop/screens/orders/orders.dart';
import 'package:hazeupp/utils/constants/colors.dart';
import 'package:hazeupp/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            THeaderPrimaryContainer(
              child: Column(
                children: [
                  // App Bar
                  TAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // User Profile Card
                  TUserProfile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Account Settings
                  const TSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subTitle: 'Set Shopping Delivery Address',
                    onTap: () => Get.to(() => UserAddressScreen()),
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    subTitle: 'Add, remove products and move to checkout',
                    onTap: () => Get.to(() => CartScreen()),
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subTitle: 'In-progress and Completed Orders',
                    onTap: () => Get.to(() => OrderScreen()),
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: "Bank Account",
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Coupons",
                    subTitle: 'List of all discounted coupons',
                    onTap: () {},
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "Notifications",
                    subTitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: "Account Privacy",
                    subTitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),

                  // App Settings
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSectionHeading(
                      title: "App Settings", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subTitle: 'Upload Data to your cloud firebase',
                    onTap: () {},
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: "Geolocation",
                    subTitle: 'Set recommendation based on location',
                    onTap: () {},
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe Mode",
                    subTitle: 'Search result is safe for all ages',
                    onTap: () {},
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality",
                    subTitle: 'Set image quality to be seen',
                    onTap: () {},
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),

                  // Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                      child: const Text("Logout"),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
