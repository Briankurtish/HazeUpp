import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hazeupp/common/widgets/appbar/appbar.dart';
import 'package:hazeupp/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:hazeupp/common/widgets/products/cart/coupon_widget.dart';
import 'package:hazeupp/common/widgets/success_screen/success_screen.dart';
import 'package:hazeupp/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:hazeupp/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:hazeupp/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:hazeupp/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:hazeupp/navigation_menu.dart';
import 'package:hazeupp/utils/constants/colors.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:hazeupp/utils/constants/sizes.dart';
import 'package:hazeupp/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Items in Cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Coupon Text Field
              TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    // Pricing
                    TBillingAmountSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    //  Divider
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    // Payment Methods
                    TBillingPaymentSection(),

                    const SizedBox(height: TSizes.spaceBtwItems),
                    // Address
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
                animation: TImages.successfulPaymentIcon,
                title: "Payment Success",
                subTitle: "Your Item will be shipped soon",
                onPressed: () => Get.offAll(() => const NavigationMenu()),
              )),
          child: Text("Checkout  ₺3675.0 "),
        ),
      ),
    );
  }
}
